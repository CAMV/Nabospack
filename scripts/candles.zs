import crafttweaker.api.mods.ModInfo;
import crafttweaker.api.mods.Mods;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.tag.MCTag;
import crafttweaker.api.CraftingTableManager;
import crafttweaker.api.BracketHandlers;
import crafttweaker.api.item.IIngredient;
import crafttweaker.api.item.IngredientList;

var colors as string[] = [ "white", "orange", "magenta", "light_blue", "yellow", "lime", "pink", "gray", "light_gray", "cyan", "purple", "blue", "brown", "green", "red", "black"];

var scents as string[] = [ "allium", "azure_bluet", "blue_orchid", "dandelion", "cornflower", "lily_of_the_valley", "oxeye_daisy", "poppy", "white_tulip", "orange_tulip", "pink_tulip", 
                           "red_tulip", "wither_rose", "white_clover", "pink_clover", "buttercup", "cartwheel", "blueball", "violet", "dianthus", "red_lotus", "white_lotus", "yellow_hibiscus",
                            "orange_hibiscus", "red_hibiscus", "pink_hibiscus", "magenta_hibiscus", "purple_hibiscus", "autumn_crocus"];

var scentsModID as string[] = [ "minecraft", "minecraft", "minecraft", "minecraft", "minecraft", "minecraft", "minecraft", "minecraft", "minecraft", "minecraft", "minecraft", 
                           "minecraft", "minecraft", "buzzier_bees", "buzzier_bees", "buzzier_bees", "environmental", "environmental", "environmental", "environmental", "environmental", "environmental", "environmental",
                            "environmental", "environmental", "environmental", "environmental", "environmental", "autumnity"];

var honeycombsPerCandle = 3;

// function getItemColorsMinusOne(item as string, modId as string, colorToExclude as string, isColorFst as bool) as IIngredient
// {
//     var colors as string[] = [ "white", "orange", "magenta", "light_blue", "yellow", "lime", "pink", "gray", "light_gray", "cyan", "purple", "blue", "brown", "green", "red", "black"];

//     var k = 0;
//     if (colors[k] == colorToExclude)
//         k = 1;

//     var sourceStr = isColorFst ? colors[k] + "_" + item : item + "_" + colors[k] ;
//     var sourceItemOptions as IngredientList = BracketHandlers.getItem(modId + ":" + sourceStr);

//     while k < 15
//     {
//         k += 1;
//         if (colors[k] == colorToExclude)
//             continue;

//         sourceStr = isColorFst ? colors[k] + "_" + item : item + "_" + colors[k];
//         sourceItemOptions = sourceItemOptions | BracketHandlers.getItem(modId + ":" + sourceStr);
//     }

//     return sourceItemOptions;
// }

<tag:items:supplementaries:candles>.remove(<item:buzzier_bees:soul_candle>);
craftingTable.removeRecipe(<item:buzzier_bees:soul_candle>);
mods.jei.JEI.hideItem(<item:buzzier_bees:soul_candle>);

<tag:items:supplementaries:candles>.remove(<item:buzzier_bees:ender_candle>);
craftingTable.removeRecipe(<item:buzzier_bees:ender_candle>);
mods.jei.JEI.hideItem(<item:buzzier_bees:ender_candle>);

<tag:items:supplementaries:candles>.remove(<item:buzzier_bees:candle>);
craftingTable.removeRecipe(<item:buzzier_bees:candle>);
mods.jei.JEI.hideItem(<item:buzzier_bees:candle>);

craftingTable.removeByRegex(".*buzzier_bees:candles/dyed/.*");
craftingTable.removeByRegex(".*cavesandcliffs:/*candle");

for color in colors
{
    var candle = BracketHandlers.getItem("quark:" + color + "_candle");
    <tag:items:supplementaries:candles>.remove(candle);
    mods.jei.JEI.hideItem(candle);
    
    candle = BracketHandlers.getItem("buzzier_bees:" + color + "_candle");
    <tag:items:buzzier_bees:candles>.remove(candle);
    <tag:items:buzzier_bees:dyed_candles>.remove(candle);
    mods.jei.JEI.hideItem(candle);

    craftingTable.removeByRegex("cavesandcliffs:*" + color + "_" + "candle");
}

craftingTable.addShaped(
    "candle_base_recipe", 
    <item:nabospack:candle_base>, 
    [[<tag:items:buzzier_bees:candle_wick>], 
    [ <tag:items:forge:nuggets>]] 
);

<recipetype:create:mixing>.addRecipe(
    "create_candle_mix",
    "heated",
    <fluid:nabospack:candle_mix> * 250,
    [<item:minecraft:honeycomb>],
    [<fluid:createaddition:seed_oil> * 250]
);

<recipetype:create:filling>.addRecipe(
    "create_candle_making",
    <item:cavesandcliffs:candle>,
    <item:nabospack:candle_base>,
    <fluid:nabospack:candle_mix> * 250
);

for color in colors
{
    <recipetype:create:sequenced_assembly>.addJSONRecipe(
        "create_" + color + "_candle",
        {
        "type": "create:sequenced_assembly",
        "ingredient": {"item": "nabospack:candle_base"},
        "transitionalItem": {"item": "nabospack:unfinished_candle"},
        "sequence": [
            {
                "type": "create:filling",
                "ingredients": [
                    {"item": "nabospack:unfinished_candle"},
                    {"fluid": "nabospack:candle_mix", "nbt": {}, "amount": 250}],
                "results": [{"item": "nabospack:unfinished_candle"}]
            },
            {
                "type": "create:filling",
                "ingredients": [
                    {"item": "nabospack:unfinished_candle"},
                    {"fluid": "nabospack:" + color + "_ink", "nbt": {}, "amount": 100}],
                "results": [{"item": "nabospack:unfinished_candle"}]
            }
        ],
        "results": [
            {"item": "cavesandcliffs:" + color + "_candle", "chance": 100, "count": 1}
        ],
        "loops": 1
        }
    );
}


var levelStr as string[] = ["small", "medium", "large"];
var cLevel = 4;

for i, str in levelStr
{
    var amount as int;

    amount = (i + 1) as int;

    // candle mix
    <recipetype:inspirations:cauldron>.addJSONRecipe(
        "cauldron_" + str + "_candle_mix",
        {
        "type": "inspirations:cauldron",
        "conditions": [
            {
            "prop": "recipes_module",
            "type": "inspirations:config"
            },
            {
            "prop": "cauldron_fluids",
            "type": "inspirations:config"
            }
        ],
        "input": {
            "item": {
            "item": "minecraft:honeycomb",
            "amount_needed": amount
            },
            "contents": {
            "type": "inspirations:fluid",
            "name": "createaddition:seed_oil"
            },
            "level": {
            "min": cLevel,
            "max": cLevel
            },
            "temperature": "boiling"
        },
        "output": {
            "contents": {
            "type": "inspirations:fluid",
            "name": "nabospack:candle_mix"
            }
        },
        "sound": "minecraft:block.honey_block.slide"
        }
    );

    cLevel += 4;
}

<recipetype:inspirations:cauldron>.addJSONRecipe(
    "cauldron_candle_making",
    {
    "type": "inspirations:cauldron",
    "conditions": [
        {
        "prop": "recipes_module",
        "type": "inspirations:config"
        },
        {
        "prop": "cauldron_fluids",
        "type": "inspirations:config"
        }
    ],
    "input": {
        "item": {
        "item": "nabospack:candle_base"
        },
        "contents": {
        "type": "inspirations:fluid",
        "name": "nabospack:candle_mix"
        },
        "level": {
        "min": 4
        }
    },
    "output": {
        "item": {
        "item": "cavesandcliffs:candle"
        },
        "level": {
        "add": -4
        }
    },
    "sound": "minecraft:block.honey_block.break"
    }
);





// <recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("candle_making")
//     .transitionTo(<item:minecraft:glass>)
//     .require(<item:minecraft:arrow>)
//     .loops(2)
//     .addOutput(<item:minecraft:diamond>, 1)
//     .addOutput(<item:minecraft:apple>, 1)
//     .addStep(<recipetype:create:cutting>.factory(), (rb) => rb.duration(50))
//     .addStep(<recipetype:create:pressing>.factory(), (rb) => rb.duration(500))
//     .addStep(<recipetype:create:deploying>.factory(), (rb) => rb.require(<item:minecraft:dirt>))
// );



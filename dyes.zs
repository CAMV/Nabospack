import crafttweaker.api.mods.ModInfo;
import crafttweaker.api.mods.Mods;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.tag.MCTag;
import crafttweaker.api.CraftingTableManager;
import crafttweaker.api.BracketHandlers;
import crafttweaker.api.item.IIngredient;
import crafttweaker.api.item.IngredientList;

<tag:items:crafttweaker:flag>.add(
    <item:supplementaries:flag_black>,
    <item:supplementaries:flag_blue>,
    <item:supplementaries:flag_brown>,
    <item:supplementaries:flag_cyan>,
    <item:supplementaries:flag_gray>,
    <item:supplementaries:flag_green>,
    <item:supplementaries:flag_light_blue>,
    <item:supplementaries:flag_light_gray>,
    <item:supplementaries:flag_lime>,
    <item:supplementaries:flag_magenta>,
    <item:supplementaries:flag_orange>,
    <item:supplementaries:flag_pink>,
    <item:supplementaries:flag_purple>,
    <item:supplementaries:flag_red>,
    <item:supplementaries:flag_white>,
    <item:supplementaries:flag_yellow>
);

var colors as string[] = [ "white", "orange", "magenta", "light_blue", "yellow", "lime", "pink", "gray", "light_gray", "cyan", "purple", "blue", "brown", "green", "red", "black"];
var colorCodes as int[] = [16383998, 16351261, 13061821, 3847130, 16701501, 8439583, 15961002, 4673362, 10329495, 1481884, 8991416, 3949738, 8606770, 6192150, 11546150, 1908001];

var itemsToDyeByMix = [ "wool", "carpet", "carpeted_trapdoor", "bed", "flag", "seat"];
var itemsToDyeByMixModID = [ "minecraft", "minecraft", "inspirations", "minecraft", "supplementaries", "create" ];
var itemsToDyeByMixTag = [ <tag:items:minecraft:wool>, <tag:items:minecraft:carpets>, <tag:items:inspirations:carpeted_trapdoors>, <tag:items:minecraft:beds>, <tag:items:crafttweaker:flag>, <tag:items:create:seats> ];

var armorToDyeByMix = [ <item:minecraft:leather_helmet>, <item:minecraft:leather_chestplate>, <item:minecraft:leather_leggings>, <item:minecraft:leather_boots>, <item:minecraft:leather_horse_armor> ];
var armorToDyeByMixString = [ "leather_helmet", "leather_chestplate", "leather_leggings", "leather_boots", "leather_horse_armor" ];

var itemsToDyeByFill = [ "shulker_box", "terracotta", "valve_handle", "toolbox"];
var itemsToDyeByFillModID = [ "minecraft", "minecraft", "create", "create" ];
var itemsToDyeByFillTag = [ <tag:items:inspirations:shulker_boxes>, <tag:items:inspirations:terracotta>, <tag:items:create:valve_handles>, <tag:items:create:toolboxes>];

var waterToWash = 500;
var inkToDye = 250;
var inkInBottle = 250;

function getItemColorsMinusOne(item as string, modId as string, colorToExclude as string, isColorFst as bool) as IIngredient
{
    var colors as string[] = [ "white", "orange", "magenta", "light_blue", "yellow", "lime", "pink", "gray", "light_gray", "cyan", "purple", "blue", "brown", "green", "red", "black"];

    var k = 0;
    if (colors[k] == colorToExclude)
        k = 1;

    var sourceStr = isColorFst ? colors[k] + "_" + item : item + "_" + colors[k] ;
    var sourceItemOptions as IngredientList = BracketHandlers.getItem(modId + ":" + sourceStr);

    while k < 15
    {
        k += 1;
        if (colors[k] == colorToExclude)
            continue;

        sourceStr = isColorFst ? colors[k] + "_" + item : item + "_" + colors[k];
        sourceItemOptions = sourceItemOptions | BracketHandlers.getItem(modId + ":" + sourceStr);
    }

    return sourceItemOptions;
}

craftingTable.removeRecipe(<item:inspirations:white_book>);
craftingTable.removeByRegex(".*valve_handle_from_other.*");
craftingTable.removeByRegex(".*wool.*");
craftingTable.removeByRegex(".*terracotta.*");
craftingTable.removeByRegex(".*carpet.*");
craftingTable.removeByRegex(".*_glass.*");
craftingTable.removeByRegex(".*_shulker_box.*");
craftingTable.removeByRegex(".*_concrete_powder.*");
craftingTable.removeByRegex(".*bed.*");
craftingTable.removeByRegex(".*books/.*");
craftingTable.removeByRegex(".*_bolloom.*");
craftingTable.removeByRegex(".*_seat_from_other_seat.*");
craftingTable.removeByRegex(".*_toolbox_from_other_toolbox.*");

# dye
for i, color in colors
{
    // empty ink bottles
    <recipetype:create:emptying>.addRecipe(
        "empty_" + color + "_ink_bottle",
        <item:minecraft:glass_bottle>,
        BracketHandlers.getFluidStack("nabospack:" + color + "_ink") * inkInBottle,
        BracketHandlers.getItem("inspirations:" + color + "_dyed_bottle")
    );

    // fill ink bottle
    <recipetype:create:filling>.addRecipe(
        "fill_" + color + "_ink_bottle",
        BracketHandlers.getItem("inspirations:" + color + "_dyed_bottle"),
        <item:minecraft:glass_bottle>,
        BracketHandlers.getFluidStack("nabospack:" + color + "_ink") * inkInBottle
    );

    // turn dye into ink
    <recipetype:create:mixing>.addRecipe(
        "create_mix_" + color + "_dye_water",
        "none",
        BracketHandlers.getFluidStack("nabospack:" + color + "_ink") * inkInBottle,
        [BracketHandlers.getItem("minecraft:" + color + "_dye")],
        [<fluid:minecraft:water> * inkInBottle]
    );

    // create mix
    for j, item in itemsToDyeByMix
    {
        var targetStr = item == "flag" ? item + "_" + color : color + "_" + item;
        var targetItem = BracketHandlers.getItem(itemsToDyeByMixModID[j] + ":" + targetStr);

        var sourceItems = getItemColorsMinusOne(item, itemsToDyeByMixModID[j], color, item != "flag") as IngredientList;
        
        <recipetype:create:mixing>.addRecipe(
            "create_mix_" + item + "_" + color + "_ink",
            "none",
            targetItem,
            [sourceItems],
            [BracketHandlers.getFluidStack("nabospack:" + color + "_ink") * inkToDye]
        );
    }

    // create mix armor
    for j, item in armorToDyeByMix
    {
        <recipetype:create:mixing>.addRecipe(
            "create_mix_" + armorToDyeByMixString[j] + "_" + color + "_ink",
            "none",
            item.withTag({display: {color: colorCodes[i] as int}}),
            [item],
            [BracketHandlers.getFluidStack("nabospack:" + color + "_ink") * inkToDye]
        );
    }

    // create fill
    for j, item in itemsToDyeByFill
    {
        var targetItem2 = BracketHandlers.getItem(itemsToDyeByFillModID[j] + ":" + color + "_" + item);

        var sourceItemOptions2 = getItemColorsMinusOne(item, itemsToDyeByFillModID[j], color, true) as IngredientList; 

        var prefix = "";

        if (item == "valve_handle")
            prefix = "copper_";

        if (item == "toolbox")
            prefix = "brown_";

        sourceItemOptions2 = sourceItemOptions2 | BracketHandlers.getItem(itemsToDyeByFillModID[j] + ":" + prefix + item);

        <recipetype:create:filling>.addRecipe(
            "create_paint_" + item + "_" + color + "_ink",
            targetItem2,
            sourceItemOptions2,
            BracketHandlers.getFluidStack("nabospack:" + color + "_ink") * (item == "terracotta" ? 50 : inkToDye)
        );
    }
}

# wash
for i, item in itemsToDyeByMix
{
    var sourceItemOptions3 = getItemColorsMinusOne(item, itemsToDyeByMixModID[i], "white", item != "flag") as IngredientList; 

    <recipetype:create:mixing>.addRecipe(
        "create_mix_wash_" + item,
        "none",
        BracketHandlers.getItem(itemsToDyeByMixModID[i] + ":" + (item == "flag" ? item + "_" + "white" : "white" + "_" + item)),
        [sourceItemOptions3],
        [<fluid:minecraft:water> * waterToWash],
        200
    );
}

for i, item in armorToDyeByMix
{
    <recipetype:create:mixing>.addRecipe(
        "create_mix_wash_" + armorToDyeByMixString[i],
        "none",
        item,
        [item],
        [<fluid:minecraft:water> * waterToWash],
        200
    );
}

for i, item in itemsToDyeByFill
{
    var sourceItemOptions4 = getItemColorsMinusOne(item, itemsToDyeByFillModID[i], "", true) as IngredientList; 

    var prefix2 = "";

    if (item == "valve_handle")
        prefix2 = "copper_";

    if (item == "toolbox")
        prefix2 = "brown_";

    <recipetype:create:filling>.addRecipe(
        "create_mix_wash_" + item,
        BracketHandlers.getItem(itemsToDyeByFillModID[i] + ":" + prefix2 + item),
        sourceItemOptions4,
        <fluid:minecraft:water> * (item == "terracotta" ? 100 : waterToWash),
        10000
    );
}

# mix inks
<recipetype:create:mixing>.addRecipe("create_mix_orange_ink", "none", <fluid:nabospack:orange_ink> * 2, [], [<fluid:nabospack:yellow_ink>, <fluid:nabospack:red_ink>], 25);
<recipetype:create:mixing>.addRecipe("create_mix_magenta_ink", "none", <fluid:nabospack:magenta_ink> * 2, [], [<fluid:nabospack:pink_ink>, <fluid:nabospack:purple_ink>], 25);
<recipetype:create:mixing>.addRecipe("create_mix_light_blue_ink", "none", <fluid:nabospack:light_blue_ink> * 2, [], [<fluid:nabospack:blue_ink>, <fluid:nabospack:white_ink>], 25);
<recipetype:create:mixing>.addRecipe("create_mix_pink_ink", "none", <fluid:nabospack:pink_ink> * 2, [], [<fluid:nabospack:red_ink>, <fluid:nabospack:white_ink>], 25);
<recipetype:create:mixing>.addRecipe("create_mix_lime_ink", "none", <fluid:nabospack:lime_ink> * 2, [], [<fluid:nabospack:green_ink>, <fluid:nabospack:white_ink>], 25);
<recipetype:create:mixing>.addRecipe("create_mix_cyan_ink", "none", <fluid:nabospack:cyan_ink> * 2, [], [<fluid:nabospack:green_ink>, <fluid:nabospack:blue_ink>], 25);
<recipetype:create:mixing>.addRecipe("create_mix_purple_ink", "none", <fluid:nabospack:purple_ink> * 2, [], [<fluid:nabospack:red_ink>, <fluid:nabospack:blue_ink>], 25);
<recipetype:create:mixing>.addRecipe("create_mix_light_gray_ink", "none", <fluid:nabospack:light_gray_ink> * 3, [], [<fluid:nabospack:white_ink> * 2, <fluid:nabospack:black_ink>], 25);
<recipetype:create:mixing>.addRecipe("create_mix_light_gray_ink_2", "none", <fluid:nabospack:light_gray_ink> * 2, [], [<fluid:nabospack:white_ink>, <fluid:nabospack:light_gray_ink>], 25);
<recipetype:create:mixing>.addRecipe("create_mix_gray_ink", "none", <fluid:nabospack:gray_ink> * 2, [], [<fluid:nabospack:white_ink>, <fluid:nabospack:black_ink>], 25);

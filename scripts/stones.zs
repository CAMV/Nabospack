import crafttweaker.api.mods.ModInfo;
import crafttweaker.api.mods.Mods;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.BracketHandlers;
import crafttweaker.api.item.IIngredient;
import crafttweaker.api.item.IngredientList;
import crafttweaker.api.CraftingTableManager;
import crafttweaker.api.BlastFurnaceManager;
import crafttweaker.api.FurnaceManager;
import crafttweaker.api.StoneCutterManager;
import crafttweaker.api.food.MCFood;
import crafttweaker.api.tag.MCTag;
import crafttweaker.api.util.MCEquipmentSlotType;
import crafttweaker.api.entity.AttributeOperation;
import crafttweaker.api.blocks.MCBlock;
import crafttweaker.api.loot.LootContext;
import crafttweaker.api.loot.modifiers.ILootModifier;
import crafttweaker.api.loot.modifiers.CommonLootModifiers;


var stoneTypes = [ "stone", "diorite", "andesite", "granite", "blackstone", "basalt", "sandstone", "red_sandstone", "end_stone", "netherrack", "limestone", "aridrock", "shale", "grimestone", "deepslate" ];
var stonesModID = [ "minecraft", "minecraft", "minecraft", "minecraft", "minecraft", "minecraft", "minecraft", "minecraft", "minecraft", "minecraft", "darkerdepths", "darkerdepths", "darkerdepths", "darkerdepths", "cavesandcliffs" ];


// hide all unnecesary cobblestone added by natural progression
mods.jei.JEI.hideItem(<item:natural-progression:cobbled_diorite>);
mods.jei.JEI.hideItem(<item:natural-progression:cobbled_granite>);
mods.jei.JEI.hideItem(<item:natural-progression:cobbled_andesite>);
mods.jei.JEI.hideItem(<item:natural-progression:cobbled_sandstone>);
mods.jei.JEI.hideItem(<item:natural-progression:cobbled_red_sandstone>);

// Hide all cobblestone stair
mods.jei.JEI.hideRegex(".*cobble.*stairs");

// Remove recipes & hiding non used blocks with stones
for i, stone in stoneTypes
{
    //var stoneItem = BracketHandlers.getItem(stonesModID[i] + ":" + stone);
    furnace.removeByRegex(".*" + stone +".*");
    craftingTable.removeByRegex(".*" + stone +".*");
    stoneCutter.removeByRegex(".*" + stone +".*");

    if (stone != "basalt" && stone != "sandstone" && stone != "red_sandstone" && stone != "stone")
        mods.jei.JEI.hideRegex(".*quark.*" + stone + ".*(?<!vertical_slab)$");
}

for i, stone in stoneTypes
{
    var pebble = BracketHandlers.getItem("nabospack:" + stone + "_pebble");

    BracketHandlers.getBlock(stonesModID[i] + ":" + stone).addLootModifier(
        stone + "_drops_pebbles", 
        CommonLootModifiers.clearing(CommonLootModifiers.addWithRandomAmount(pebble, 2, 4))
    );
}


// // HIDE ITEMS
// mods.jei.JEI.hideItem(<item:create:diorite_cobblestone_stairs>);
// mods.jei.JEI.hideItem(<item:natural-progression:cobbled_diorite>);

// # quark
// mods.jei.JEI.hideItem(<item:quark:chiseled_diorite_bricks>);
// mods.jei.JEI.hideItem(<item:quark:diorite_bricks>);
// mods.jei.JEI.hideItem(<item:quark:diorite_bricks_slab>);
// mods.jei.JEI.hideItem(<item:quark:diorite_bricks_stairs>);
// mods.jei.JEI.hideItem(<item:quark:diorite_bricks_wall>);
// mods.jei.JEI.hideItem(<item:quark:diorite_pavement>);
// mods.jei.JEI.hideItem(<item:quark:diorite_pillar>);
// mods.jei.JEI.hideItem(<item:quark:diorite_speleothem>);

// // PRUNE RECIPES
// furnace.removeRecipe(<item:minecraft:diorite>);
// craftingTable.removeByRegex(".*diorite.*");
// stoneCutter.removeByRegex(".*diorite.*");   

// // LOOT
// <block:minecraft:diorite>.addLootModifier(
//     "diorite_drops_pebbles", 
//     CommonLootModifiers.clearing(CommonLootModifiers.addWithRandomAmount(<item:natural-progression:diorite_pebble>, 2, 4))
// );

// <block:create:diorite_cobblestone>.addLootModifier(
//     "diorite_cobblestone_drops_pebbles", 
//     CommonLootModifiers.clearing(CommonLootModifiers.addWithRandomAmount(<item:natural-progression:diorite_pebble>, 3, 4))
// );

// // COBBLESTONE
// craftingTable.addShaped(
//     "create_diorite_cobblestone_fence_by_pebble", 
//     <item:create:diorite_cobblestone_wall>, 
//     [[<item:natural-progression:diorite_pebble>, <item:create:diorite_cobblestone>, <item:natural-progression:diorite_pebble>], 
//     [ <item:natural-progression:diorite_pebble>, <item:create:diorite_cobblestone>, <item:natural-progression:diorite_pebble>]] 
// );

// <tag:items:quark:stone_tool_materials>.remove(<item:natural-progression:cobbled_diorite>);
// <tag:items:forge:cobblestone>.remove(<item:natural-progression:cobbled_diorite>);

// // COBBLESTONE SLAB
// craftingTable.removeRecipe(<item:create:diorite_cobblestone_slab>);

// craftingTable.addShaped(
//     "create_diorite_cobblestone_slab_by_pebble", 
//     <item:create:diorite_cobblestone_slab>, 
//     [[<item:natural-progression:diorite_pebble>, <item:natural-progression:diorite_pebble>]]
// );

// // POLISHED
// <recipetype:create:sandpaper_polishing>.addRecipe("polish_diorite_sand_paper", <item:minecraft:polished_diorite>, <item:minecraft:diorite>, 100);

// // COBBLESTONE WALL 
// craftingTable.addShaped(
//     "create_diorite_cobblestone_by_pebble", 
//     <item:create:diorite_cobblestone>, 
//     [[<item:natural-progression:diorite_pebble>, <item:natural-progression:diorite_pebble>], 
//     [ <item:natural-progression:diorite_pebble>, <item:natural-progression:diorite_pebble>]] 
// );

// //
// // <recipetype:create:cutting>.addRecipe(String name, IItemStack output, IIngredient input, @Optional(100) int duration)

// <recipetype:create:cutting>.addRecipe("cutting_test", <item:minecraft:diamond>, <item:minecraft:glass>);

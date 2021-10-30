#priority 100

import crafttweaker.api.mods.ModInfo;
import crafttweaker.api.mods.Mods;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.CraftingTableManager;
import crafttweaker.api.CampFireManager;
import crafttweaker.api.BlastFurnaceManager;
import crafttweaker.api.SmokerManager;
import crafttweaker.api.FurnaceManager;
import crafttweaker.api.food.MCFood;
import crafttweaker.api.tag.MCTag;
import crafttweaker.api.BracketHandlers;
import crafttweaker.api.item.IIngredient;
import crafttweaker.api.item.IngredientList;
    
// One limestone is from quark, the other is from create
var stonesToPrune as string[] = [ "marble", "limestone", "jasper", "slate", "basalt", "myalite", "limestone", "weathered_limestone", "gabbro", "dolomite", "scoria", "dark_scoria" ]; 
var stonesToPruneModID as string[] = [  "quark", "quark", "quark", "quark", "quark", "quark", "create", "create", "create", "create", "create", "create" ]; 

<tag:items:forge:cobblestone>.remove(<item:quark:cobbedstone>);
<tag:items:quark:stone_tool_materials>.remove(<item:quark:cobbedstone>);
craftingTable.removeByRegex(".*cobbedstone.*");
mods.jei.JEI.hideRegex("quark:cobbedstone.*");

<tag:items:forge:stone>.remove(<item:quark:brimstone>);
<tag:items:quark:stone_tool_materials>.remove(<item:quark:brimstone>);
craftingTable.removeByRegex(".*brimstone.*");
mods.jei.JEI.hideRegex("quark:brimstone.*");

<tag:items:forge:stone>.remove(<item:quark:permafrost>);
<tag:items:quark:stone_tool_materials>.remove(<item:quark:permafrost>);
craftingTable.removeByRegex(".*permafrost.*");
mods.jei.JEI.hideRegex("quark:permafrost.*");

// basalt cope
<tag:items:supplementaries:deepslate>.remove(<item:quark:deepslate>);
<tag:items:quark:stone_tool_materials>.remove(<item:quark:deepslate>);
mods.jei.JEI.hideItem(<item:quark:deepslate>);

<tag:items:minecraft:stone_crafting_materials>.remove(<item:quark:cobbled_deepslate>);
<tag:items:quark:stone_tool_materials>.remove(<item:quark:cobbled_deepslate>);
mods.jei.JEI.hideItem(<item:quark:cobbled_deepslate>);

<tag:items:quark:stone_tool_materials>.remove(<item:quark:polished_deepslate>);
mods.jei.JEI.hideItem(<item:quark:polished_deepslate>);

<tag:items:endergetic:ender_fire_base_blocks>.remove(<item:quark:basalt>);
mods.jei.JEI.hideRegex("quark:basalt.*");
mods.jei.JEI.hideRegex("quark:polished_basalt.*");
mods.jei.JEI.hideRegex("quark:chiseled_basalt.*");

//mods.jei.JEI.hideItem(<item:natural-progression:quark_basalt_pebble>);


for i, stone in stonesToPrune
{
    var rawStone = BracketHandlers.getItem(stonesToPruneModID[i] + ":" + stone);
    var polishedStone = BracketHandlers.getItem(stonesToPruneModID[i] + ":" + "polished_" + stone);

    <tag:items:forge:stone>.remove(rawStone);
    <tag:items:forge:stone>.remove(polishedStone);
    <tag:items:quark:stone_tool_materials>.remove(rawStone);
    <tag:items:quark:stone_tool_materials>.remove(polishedStone);

    // mods.jei.JEI.hideItem(rawStone);
    // mods.jei.JEI.hideItem(polishedStone);

    if (stonesToPruneModID[i] == "create"  )
    {
        var cobbledStone = BracketHandlers.getItem(stonesToPruneModID[i] + ":" + stone + "_cobblestone");

        <tag:items:forge:cobblestone>.remove(cobbledStone);
        <tag:items:quark:stone_tool_materials>.remove(cobbledStone);
        // mods.jei.JEI.hideItem(cobbledStone);
    }

    if (stone != "basalt")
    {
        mods.jei.JEI.hideRegex(".*" + stonesToPruneModID[i] + ":.*" + stone + ".*");

    }
}


// General pruning

mods.jei.JEI.hideRegex(".*snail_shell_brick.*");
craftingTable.removeByRegex(".*snail_shell_brick.*");

mods.jei.JEI.hideRegex(".*terracotta_brick.*");
craftingTable.removeByRegex(".*terracotta_brick.*");

mods.jei.JEI.hideRegex(".*quark:.*shingles.*");
craftingTable.removeByRegex(".*quark:.*shingles.*");

mods.jei.JEI.hideRegex(".*quark:.*magma_bricks.*");
craftingTable.removeByRegex(".*quark:.*magma_bricks.*");

mods.jei.JEI.hideRegex(".*quark:.*snow_bricks.*");
craftingTable.removeByRegex(".*quark:.*snow_bricks.*");

mods.jei.JEI.hideRegex(".*quark:.*stained_planks.*");
craftingTable.removeByRegex(".*quark:.*stained_planks.*");

mods.jei.JEI.hideRegex(".*quark:.*cobblestone_bricks.*");

mods.jei.JEI.hideItem(<item:quark:dirt_bricks_stairs>);

mods.jei.JEI.hideRegex(".*quark:.*midori.*");
craftingTable.removeByRegex(".*quark:.*midori.*");

mods.jei.JEI.hideRegex(".*quark:.*thatch.*");

mods.jei.JEI.hideRegex(".*quark:.*leaf_carpet.*");

mods.jei.JEI.hideItem(<item:quark:grate>);

mods.jei.JEI.hideItem(<item:quark:flamerang>);
mods.jei.JEI.hideItem(<item:quark:pickarang>);

mods.jei.JEI.hideItem(<item:quark:gravisand>);

mods.jei.JEI.hideRegex(".*quark:.*duskbound.*");
craftingTable.removeByRegex(".*quark:.*duskbound.*");

mods.jei.JEI.hideRegex(".*quark:.*crystal.*");

mods.jei.JEI.hideItem(<item:quark:pipe>);

mods.jei.JEI.hideRegex(".*quark:.*_slime_block.*");

mods.jei.JEI.hideRegex(".*quark:.*turf.*");

mods.jei.JEI.hideRegex(".*quark:.*root.*");

mods.jei.JEI.hideItem(<item:quark:sturdy_stone>);

mods.jei.JEI.hideItem(<item:quark:ender_watcher>);

mods.jei.JEI.hideItem(<item:quark:obsidian_pressure_plate>);

mods.jei.JEI.hideRegex(".*quark:.*rune.*");
craftingTable.removeByRegex(".*quark:.*rune.*");

mods.jei.JEI.hideRegex(".*quark:.*speleothem.*");

mods.jei.JEI.hideRegex(".*quark:.*post.*");

mods.jei.JEI.hideItem(<item:quark:chute>);

mods.jei.JEI.hideRegex(".*quark:.*iron_plate.*");
craftingTable.removeByRegex(".*quark:.*iron_plate.*");

mods.jei.JEI.hideRegex(".*biotite.*");
craftingTable.removeByRegex(".*biotite.*");

mods.jei.JEI.hideRegex(".*quark:.*sandy_brick.*");
craftingTable.removeByRegex(".*quark:.*sandy_brick.*");

mods.jei.JEI.hideRegex(".*quark:.*elder_prismarine.*");
craftingTable.removeByRegex(".*quark:.*elder_prismarine.*");

mods.jei.JEI.hideItem(<item:quark:elder_sea_lantern>);

mods.jei.JEI.hideRegex(".*quark:.*charred_nether_brick.*");
craftingTable.removeByRegex(".*quark:.*charred_nether_brick.*");

mods.jei.JEI.hideRegex(".*quark:.*blue_nether_brick.*");
craftingTable.removeByRegex(".*quark:.*blue_nether_brick.*");

mods.jei.JEI.hideItem(<item:quark:crate>);
mods.jei.JEI.hideRegex(".*quark:.*tallow.*");


mods.jei.JEI.hideRegex(".*buzzier_bees:.*honeycomb_brick.*");
craftingTable.removeByRegex(".*buzzier_bees:.*honeycomb_brick.*");

mods.jei.JEI.hideRegex(".*buzzier_bees:.*honeycomb_tile.*");
craftingTable.removeByRegex(".*buzzier_bees:.*honeycomb_tile.*");

mods.jei.JEI.hideItem(<item:buzzier_bees:crystallized_honey_block>);
furnace.removeRecipe(<item:buzzier_bees:crystallized_honey_block>);

mods.jei.JEI.hideItem(<item:buzzier_bees:honey_lamp>);
furnace.removeRecipe(<item:buzzier_bees:honey_lamp>);

mods.jei.JEI.hideRegex(".*netheragriculture:.*crate.*");
craftingTable.removeByRegex(".*netheragriculture:.*crate.*");

// furnace.removeByRegex(".*snail_shell_bricks.*");
// craftingTable.removeByRegex(".*snail_shell_bricks.*");
// stoneCutter.removeByRegex(".*snail_shell_bricks.*");

    // - prismarine
    // - terracota colored
    // - eumus
    // - quark:snow
    // - quark:deepslate
    // - quark:magma
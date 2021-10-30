import crafttweaker.api.mods.ModInfo;
import crafttweaker.api.mods.Mods;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.CraftingTableManager;
import crafttweaker.api.CampFireManager;
import crafttweaker.api.BlastFurnaceManager;
import crafttweaker.api.SmokerManager;
import crafttweaker.api.FurnaceManager;
import crafttweaker.api.food.MCFood;


// Change aquaculture frog legs with quark frog legs
mods.jei.JEI.hideItem(<item:aquaculture:frog_legs_raw>);
mods.jei.JEI.hideItem(<item:aquaculture:frog_legs_cooked>);

<item:quark:frog_leg>.food = <item:quark:frog_leg>.food.setHealing(1).setSaturation(0.1f);
<item:quark:cooked_frog_leg>.food = <item:quark:cooked_frog_leg>.food.setHealing(2).setSaturation(0.2f);
<item:quark:cooked_frog_leg>.food = <item:quark:cooked_frog_leg>.food.setHealing(2).setSaturation(0.2f);

campfire.removeRecipe(<item:aquaculture:frog_legs_cooked>);
furnace.removeRecipe(<item:aquaculture:frog_legs_cooked>);
smoker.removeRecipe(<item:aquaculture:frog_legs_cooked>);

craftingTable.removeRecipe(<item:aquaculture:frog_legs_raw>);
craftingTable.addShapeless("get_quark_frog_legs_from_aqua_frog", <item:quark:frog_leg> * 2, [<item:aquaculture:frog>]);


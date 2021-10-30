import crafttweaker.api.mods.ModInfo;
import crafttweaker.api.mods.Mods;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.CraftingTableManager;
import crafttweaker.api.tag.MCTag;

mods.jei.JEI.hideItem(<item:quark:rope>);
mods.jei.JEI.hideItem(<item:darkerdepths:rope>);
craftingTable.removeRecipe(<item:darkerdepths:rope>);

<tag:items:supplementaries:ropes>.remove(<item:quark:rope>);
<tag:items:supplementaries:ropes>.remove(<item:inspirations:rope>);
<tag:items:supplementaries:ropes>.remove(<item:inspirations:vine>);



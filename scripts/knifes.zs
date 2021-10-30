import crafttweaker.api.mods.ModInfo;
import crafttweaker.api.mods.Mods;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.CraftingTableManager;
import crafttweaker.api.SmithingManager;
import crafttweaker.api.tag.MCTag;
import crafttweaker.api.util.MCEquipmentSlotType;
import crafttweaker.api.entity.AttributeOperation;

mods.jei.JEI.hideItem(<item:netheragriculture:diamond_knife>);
mods.jei.JEI.hideItem(<item:netheragriculture:knife>);
mods.jei.JEI.hideItem(<item:netheragriculture:netherite_knife>);
mods.jei.JEI.hideItem(<item:aquaculture:wooden_fillet_knife>);
mods.jei.JEI.hideItem(<item:aquaculture:stone_fillet_knife>);

<tag:items:forge:tools/knives>.add(<item:aquaculture:neptunium_fillet_knife>);
<tag:items:forge:tools/knives>.add(<item:aquaculture:diamond_fillet_knife>);
<tag:items:forge:tools/knives>.add(<item:aquaculture:gold_fillet_knife>);
<tag:items:forge:tools/knives>.add(<item:aquaculture:iron_fillet_knife>);
<tag:items:forge:tools/knives>.add(<item:natural-progression:bone_knife>);

<tag:items:netheragriculture:knives>.add(<item:aquaculture:neptunium_fillet_knife>);
<tag:items:netheragriculture:knives>.add(<item:aquaculture:diamond_fillet_knife>);
<tag:items:netheragriculture:knives>.add(<item:aquaculture:gold_fillet_knife>);
<tag:items:netheragriculture:knives>.add(<item:aquaculture:iron_fillet_knife>);
<tag:items:netheragriculture:knives>.add(<item:natural-progression:bone_knife>);

<tag:items:forge:fillet_knife>.add(<item:natural-progression:bone_knife>);

<tag:items:forge:tools/knives>.remove(<item:netheragriculture:diamond_knife>);
<tag:items:forge:tools/knives>.remove(<item:netheragriculture:knife>);
<tag:items:forge:tools/knives>.remove(<item:netheragriculture:netherite_knife>);

<tag:items:netheragriculture:knives>.remove(<item:netheragriculture:diamond_knife>);
<tag:items:netheragriculture:knives>.remove(<item:netheragriculture:knife>);
<tag:items:netheragriculture:knives>.remove(<item:netheragriculture:netherite_knife>);

<tag:items:forge:fillet_knife>.remove(<item:aquaculture:wooden_fillet_knife>);
<tag:items:forge:fillet_knife>.remove(<item:aquaculture:stone_fillet_knife>);

smithing.removeRecipe(<item:netheragriculture:netherite_knife>);
smithing.removeRecipe(<item:netheragriculture:diamond_knife>);
craftingTable.removeRecipe(<item:netheragriculture:knife>);
craftingTable.removeRecipe(<item:aquaculture:wooden_fillet_knife>);
craftingTable.removeRecipe(<item:aquaculture:stone_fillet_knife>);

// BONE KNIFE ATTACK ATTRIBUTES
<item:natural-progression:bone_knife>.removeGlobalAttribute(<attribute:minecraft:generic.attack_damage>, [<equipmentslottype:mainhand>]);
<item:natural-progression:bone_knife>.removeGlobalAttribute(<attribute:minecraft:generic.attack_speed>, [<equipmentslottype:mainhand>]);

<item:natural-progression:bone_knife>.addGlobalAttributeModifier(<attribute:minecraft:generic.attack_damage>, "Weapon modifier", 0.5, AttributeOperation.ADDITION, [<equipmentslottype:mainhand>]);
<item:natural-progression:bone_knife>.addGlobalAttributeModifier(<attribute:minecraft:generic.attack_speed>, "Weapon modifier", -2.200000047683716, AttributeOperation.ADDITION, [<equipmentslottype:mainhand>]);



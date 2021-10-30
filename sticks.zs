import crafttweaker.api.mods.ModInfo;
import crafttweaker.api.mods.Mods;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.blocks.MCBlock;
import crafttweaker.api.loot.LootContext;
import crafttweaker.api.loot.modifiers.ILootModifier;
import crafttweaker.api.loot.modifiers.CommonLootModifiers;

<tag:blocks:minecraft:leaves>.addLootModifier(
    "leave_drops_stick", 
    CommonLootModifiers.addWithRandomAmount(<item:minecraft:stick>, 0, 2)
);
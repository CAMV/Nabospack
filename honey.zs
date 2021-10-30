import crafttweaker.api.mods.ModInfo;
import crafttweaker.api.mods.Mods;
import crafttweaker.api.CraftingTableManager;

// Honey (Create over Inspirations)
mods.jei.JEI.hideFluid(<fluid:inspirations:honey>);
mods.jei.JEI.hideItem(<item:inspirations:honey_bucket>);

<recipetype:inspirations:cauldron>.removeByRegex("inspirations.*honey.*");


<recipetype:inspirations:cauldron>.addJSONRecipe(
    "fill_bottle_honey",
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
        "item": "minecraft:glass_bottle"
        },
        "contents": {
        "type": "inspirations:fluid",
        "name": "create:honey"
        },
        "level": {
        "min": 4
        }
    },
    "output": {
        "item": {
        "item": "minecraft:honey_bottle"
        },
        "level": {
        "add": -4
        }
    },
    "sound": "minecraft:item.bucket.fill"
    }
);

// empty honey bottle

<recipetype:inspirations:cauldron>.addJSONRecipe(
    "empty_bottle_honey",
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
        "item": "minecraft:honey_bottle"
        },
        "contents": {
        "type": "inspirations:fluid",
        "name": "create:honey"
        },
        "level": {
        "max": 11
        }
    },
    "output": {
        "item": {
        "item": "minecraft:glass_bottle"
        },
        "container": {
        "empty": "true"
        },
        "contents": {
        "type": "inspirations:fluid",
        "name": "create:honey"
        },
        "level": {
        "add": 4
        }
    },
    "sound": "minecraft:item.bottle.empty"
    }
);

// solidify honey into honeyblock
<recipetype:inspirations:cauldron_transform>.addJSONRecipe(
    "solidify_honey",
    {
    "type": "inspirations:cauldron_transform",
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
      "type": "inspirations:fluid",
      "name": "create:honey"
    },
    "temperature": "cool",
    "output": {
      "type": "inspirations:custom",
      "name": "minecraft:honey_block"
    },
    "time": 300,
    "sound": "minecraft:block.honey_block.place"
    }
);


// melt honey block
<recipetype:inspirations:cauldron_transform>.addJSONRecipe(
    "melt_honey",
    {
    "type": "inspirations:cauldron_transform",
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
        "type": "inspirations:custom",
        "name": "minecraft:honey_block"
    },
    "temperature": "boiling",
    "output": {
        "type": "inspirations:fluid",
        "name": "create:honey"
    },
    "time": 300,
    "sound": "minecraft:block.honey_block.break"
    }
);


// honey from honey combs
var levelStr as string[] = ["small", "medium", "large"];
var cLevel = 4;

for i, str in levelStr
{
    var amount as int;

    amount = ((i + 1) * 3) as int;

    <recipetype:inspirations:cauldron>.addJSONRecipe(
        "cauldron_" + str + "_honey_with_honeycombs",
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
            "name": "minecraft:water"
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
            "name": "create:honey"
            }
        },
        "sound": "minecraft:block.honey_block.place"
        }
    );

    cLevel += 4;
}
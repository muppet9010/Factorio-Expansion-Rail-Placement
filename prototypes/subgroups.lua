local Constants = require("constants");

data:extend({
    {
        type = "item-group",
        name = "expansion-rail-placement",
        icon = Constants.AssetModName .. "/graphics/fff-377-thumbnail.png",
        icon_size = 520,
        order = "a1" -- Place after main game logistics.
    },
    {
        type = "item-subgroup",
        name = "expansion-rails",
        group = "expansion-rail-placement"
    },
});

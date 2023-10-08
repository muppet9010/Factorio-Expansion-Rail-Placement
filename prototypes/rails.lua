local Constants = require("constants");

---@class Rails_PictureDetails
---@field width data.SpriteSizeType
---@field height data.SpriteSizeType
---@field scale double
---@field shift? Vector



-- TODO: need to do this as a rotatable entity just so that blueprints can be rotated. Don't need all the rotations in the entity, just the ones that BPs can be rotated through.
--- Make a rail prototype.
--- Needs to be "with force" so it can be blueprinted.
---@param name string
---@param pictureDetails Rails_PictureDetails
---@return data.SimpleEntityWithForcePrototype
function MakeRail(name, pictureDetails)
    ---@type data.SimpleEntityWithForcePrototype
    local rail = {
        type = "simple-entity-with-force",
        name = Constants.ModName .. "-rail-" .. name,
        picture = {
            filename = Constants.AssetModName .. "/graphics/rail-" .. name .. ".png",
            width = pictureDetails.width,
            height = pictureDetails.height,
            scale = pictureDetails.scale,
            shift = pictureDetails.shift
        },
        build_grid_size = 2, -- This might not be appropriate for curves and some diagonals.
        subgroup = "expansion-rails",
        flags = { "placeable-player", "player-creation", "not-rotatable" },
        selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
        minable = { mining_time = 1, required_fluid = (nil) --[[@as data.FluidID]], mining_trigger = (nil) --[[@as data.Trigger]] }, -- Values forcefully set to nil to work around them being defined as mandatory in API docs when they aren't.
        icon = "__base__/graphics/icons/rail.png",
        icon_size = 64,
        icon_mipmaps = 4
    };

    return rail;
end

-- Add the core rails.
local testImagesScale = 0.4;
local railPrototypes = {
    MakeRail("north", { width = 140, height = 179, scale = testImagesScale }),
    MakeRail("north-north-east", { width = 270, height = 337, scale = testImagesScale }),
    MakeRail("north-east", { width = 262, height = 216, scale = testImagesScale })
};

-- Use array order for rotation.
for order, railPrototype in pairs(railPrototypes) do
    railPrototype.order = tostring(order);
end

-- Make placer items for each rail to enable Q to work and for things to be holdable in the cursor as real & ghost.
local railItems = {};
for _, railPrototype in pairs(railPrototypes) do
    ---@type data.ItemPrototype
    local railItem = {
        type = "item",
        name = railPrototype.name,
        flags = { "not-stackable" },
        stack_size = 1,
        place_result = railPrototype.name,
        subgroup = "expansion-rails",
        icon = "__base__/graphics/icons/rail.png",
        icon_size = 64,
        icon_mipmaps = 4
    };
    table.insert(railItems, railItem);

    railPrototype.placeable_by = { item = railItem.name, count = 1 };
end

data:extend(railPrototypes);
data:extend(railItems);

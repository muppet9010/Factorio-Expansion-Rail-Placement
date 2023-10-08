local Constants = require("constants");

data:extend({
    {
        type = "custom-input",
        name = Constants.ModName .. "-rotate",
        key_sequence = "",
        linked_game_control = "rotate",
        action = "lua"
    },
    {
        type = "custom-input",
        name = Constants.ModName .. "-reverse-rotate",
        key_sequence = "",
        linked_game_control = "reverse-rotate",
        action = "lua"
    }
});

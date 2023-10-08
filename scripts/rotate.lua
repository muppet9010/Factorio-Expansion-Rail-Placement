local Rotate = {};

--- Called when a player presses either rotate key.
--- We just rotate what they have in their cursor, not anything they have selected as placed rail isn't rotatable.
---@param event EventData.CustomInputEvent
Rotate.OnARotateButtonPressed = function(event)
    local player = game.get_player(event.player_index); ---@cast player -nil
    local cursorStack = player.cursor_stack --TODO
    local cursorGhost = player.cursor_ghost --TODO

    local x = 1
end

return Rotate;

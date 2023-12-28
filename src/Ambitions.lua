local AmbitionControls = {}

local ambition_declared_marker = getObjectFromGUID(Global.getVar("ambition_declared_marker_GUID"))
local lead_card_zone = getObjectFromGUID(Global.getVar("lead_card_zone_GUID"))
local ambition_markers = {
    getObjectFromGUID(Global.getTable("ambition_marker_GUIDs")[1]),
    getObjectFromGUID(Global.getTable("ambition_marker_GUIDs")[2]),
    getObjectFromGUID(Global.getTable("ambition_marker_GUIDs")[3])
}
local ambition_map = {
    [2] = "Tycoon",
    [3] = "Tyrant",
    [4] = "Warlord",
    [5] = "Keeper",
    [6] = "Empath"
}

function AmbitionControls.declare(player_color)
    local declared_ambition = tonumber(string.sub(lead_card_zone.getObjects()[1].getDescription(),-1))

    if declared_ambition == 1 then
        broadcastToColor("Actions numbered 1 cannot be declared", player_color)
        return
    elseif declared_ambition == 7 then
        broadcastToAll(player_color.." is declaring ambition of choice", Color[player_color])
        broadcastToColor("Move highest available ambition marker to desired ambition", player_color)
    else
        broadcastToAll(player_color.." has declared "..ambition_map[declared_ambition].." ambition", Color[player_color])
    end

    ambition_declared_marker.setPositionSmooth({-13.51, 0.99, -4.72})
    ambition_declared_marker.setRotationSmooth({0.00, 90.00, 0.00})
end

return AmbitionControls
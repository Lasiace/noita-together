dofile_once("mods/noita-together/files/store.lua")
dofile_once("mods/noita-together/files/scripts/utils.lua")

local entity_id = GetUpdatedEntityID()

if not NT.reached_sampo then
    local entities = EntityGetWithTag("disabled_sampo")
    --sampo doesnt exist or not spawned yet? nothing to do then
    if #entities >= 1 and entities[1] then
        local px, py = EntityGetTransform(GetPlayer())
        local is_near_sampo = IsNearSampo(entities[1], px, py, NT_SAMPO_UNLOCK_DIST)
        if is_near_sampo then
            NT.reached_sampo = true
        end
    end
end

if (NT ~= nil and NT.run_started and NT.frames_elapsed ~= nil) then
    if ((not NT.reached_sampo or GameHasFlagRun("NT_got_sampo")) and not GameHasFlagRun("ending_game_completed")) then
        NT.frames_elapsed = NT.frames_elapsed + 1
    end
end

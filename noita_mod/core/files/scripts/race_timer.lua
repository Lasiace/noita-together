dofile_once("mods/noita-together/files/store.lua")
dofile_once("mods/noita-together/files/scripts/utils.lua")

local entity_id = GetUpdatedEntityID()

if not NT.reached_sampo then
    local px, py = EntityGetTransform(entity_id)
    if IsNearSampo(px, py, 200) then -- should use the same constant as in coop_boss_fight.lua
        NT.reached_sampo = true
    end
end

if (NT ~= nil and NT.run_started and NT.frames_elapsed ~= nil) then
    if ((not NT.reached_sampo or GameHasFlagRun("NT_got_sampo")) and not GameHasFlagRun("ending_game_completed")) then
        NT.frames_elapsed = NT.frames_elapsed + 1
    end
end

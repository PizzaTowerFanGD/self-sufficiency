_oldupd = love.update
local keys = {}
for k in pairs(G.P_CENTERS) do
    table.insert(keys, k)
end

-- call this inside love.update(dt)
-- probability_per_call ~ 0.001 means 0.1% chance per update to do 1 swap
function love.update(dt)
maxArrow = 1e6 -- Increased maximum hyperoperator to 1 million, yes thats the only other reason this file exists. godspeed.
if G.GAME then
if G.GAME.oops_its_rigged then
for k, v in pairs(G.GAME.probabilities) do 
                G.GAME.probabilities[k] = 2^1023
            end
end
if G.GAME.modifiers then
if G.GAME.modifiers.no_discards then
G.GAME.round_resets.discards = 0
G.GAME.current_round.discards_left = 0
end
end
end
if G.dtmod then
dt = dt * G.dtmod
end
-- safely sets the value without erroring if anything is nil
local success, _ = pcall(function()
	if G and G.GAME and G.GAME.blind and G.GAME.blind.config
		and G.GAME.blind.config.blind and G.GAME.blind.config.blind.debuff then
		G.GAME.blind.config.blind.debuff.infinite_discards = true
	end
end) 
_oldupd(dt)
end
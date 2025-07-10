SMODS.Atlas{
	key = "stakes",
	path = "placeholderstake.png",
	px = 29,
	py = 29
}
buy = G.FUNCS.buy_from_shop

function G.FUNCS.buy_from_shop(t)
buy(t)
local c2 = t.config.ref_table
if G.GAME.autosell_chance then
if math.random() < G.GAME.autosell_chance then
if c2 and c2:is(Card) then
G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.1,
        func = function()
c2:sell_card()
return true
end}))
end
end
end
end
SMODS.Stake{
key = 'Alt1',
applied_stakes = {  },
	prefix_config = { applied_stakes = { mod = false } },
atlas = "stakes",
unlocked = true,
modifiers = function()
G.GAME.autosell_chance = 0.25
end
}
SMODS.Stake{
key = 'Alt2',
applied_stakes = { "evilgroky_Alt1" },
atlas = "stakes",
unlocked = true,
modifiers = function()
G.GAME.pairs_banned = true
end
}

SMODS.Stake{
key = 'Alt3',
applied_stakes = { "evilgroky_Alt2" },
atlas = "stakes",
unlocked = true,
modifiers = function()
G.GAME.modifiers['enable_'..corrupted.key] = true
end
}

SMODS.Stake{
key = 'Alt4',
applied_stakes = { "evilgroky_Alt3" },
atlas = "stakes",
unlocked = true,
modifiers = function()
G.GAME.modifiers.no_discards = true
end
}
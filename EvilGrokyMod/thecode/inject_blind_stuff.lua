-- define injector lists
local before_injections = {}
local after_injections = {}
local runtime_injections = {}
local runtime_pre_injections = {}

function get_showdown_bosses()
    local bosses = {}
    for _, v in pairs(G.P_BLINDS or {}) do
        if v.boss and v.boss.showdown then
            table.insert(bosses, v)
        end
    end
    return bosses
end
eg_showdownbosses = get_showdown_bosses()
-- AFTER: easy mode overrides
table.insert(after_injections, function()
  if G.GAME.modifiers.easy_mode then
    G.GAME.round_resets.blind_choices.Small = tinyblind.key
    G.GAME.round_resets.blind_choices.Big = "bl_small"
    G.GAME.round_resets.blind_choices.Boss = "bl_big"
  end
end)

-- BEFORE: Verdant Tree & Verdant Forest challenges
table.insert(before_injections, function()
  if G.GAME.modifiers.verdant_tree_i then
    G.FORCE_BOSS = "bl_final_leaf"
  else G.FORCE_BOSS = false end
  if G.GAME.modifiers.verdant_tree_ii then
    G.FORCE_SMALL = "bl_final_leaf"
    G.FORCE_BIG = "bl_final_leaf"
    G.FORCE_BOSS = "bl_final_leaf"
  else
  G.FORCE_SMALL = false
  G.FORCE_BIG = false
  if not G.GAME.modifiers.verdant_tree_i then G.FORCE_BOSS = false end
  end
end)
table.insert(before_injections, function()
  if G.GAME.modifiers.supersize_me then
  G.GAME.modifiers.scaling = G.GAME.round_resets.ante
  G.GAME.starting_params.ante_scaling = G.GAME.round_resets.ante
  end
  if G.GAME.modifiers.holy_chicken then
  G.FORCE_SMALL = "bl_wall"
  G.FORCE_BIG = "bl_wall"
  G.FORCE_BOSS = "bl_final_vessel"
  end
  end)


-- AFTER: fallback clear if unset
table.insert(after_injections, function()
  if not G.FORCE_SMALL and not G.FORCE_BIG and not G.FORCE_BOSS then
    G.FORCE_SMALL = false
    G.FORCE_BIG = false
    G.FORCE_BOSS = false
  end
end)
table.insert(runtime_pre_injections, function()
    G.FORCE_SMALL = false
    G.FORCE_BIG = false
    G.FORCE_BOSS = false
end)
table.insert(runtime_injections, function()
if G.GAME.modifiers.scaling_set then
		G.GAME.starting_params.ante_scaling = G.GAME.modifiers.scaling_set
	end
	end)
	table.insert(runtime_injections, function()
if G.GAME.modifiers.ultrakill_fakeout then
love.system.openURL("https://store.steampowered.com/app/1229490/ULTRAKILL/")
		love.event.quit()
	end
	end)
_oldstrun = Game.start_run

function Game:start_run(args)
    for _, fn in ipairs(runtime_pre_injections) do
        fn()
    end
    _oldstrun(self, args)
    for _, fn in ipairs(runtime_injections) do
        fn()
    end
end
-- define the blind forcing patch
local function patch_blinds()
  if _oldresbl then return end
  if not reset_blinds then return end

  _oldresbl = reset_blinds

  function reset_blinds()
    _oldresbl()

    -- run before hooks
    for _, fn in ipairs(before_injections) do
      fn()
    end


    -- apply forced blinds
    if G.FORCE_SMALL then
      G.GAME.round_resets.blind_choices.Small = G.FORCE_SMALL
    end
    if G.FORCE_BIG then
      G.GAME.round_resets.blind_choices.Big = G.FORCE_BIG
    end
    if G.FORCE_BOSS then
      G.GAME.round_resets.blind_choices.Boss = G.FORCE_BOSS
    end
        -- run after hooks
    for _, fn in ipairs(after_injections) do
      fn()
    end
  end
end

patch_blinds()


-- backup original
_getbossfuncOLD_EVILGROKYMOD = get_new_boss

-- hook list
EVILGROKY_BOSS_HOOKS = {}

-- override
function get_new_boss()
  local ret = _getbossfuncOLD_EVILGROKYMOD()
  for _, hook in ipairs(EVILGROKY_BOSS_HOOKS) do
    fakeret = hook()
    if fakeret then return fakeret end
  end
  return ret
end

-- example hook
table.insert(EVILGROKY_BOSS_HOOKS, function()
  if G.GAME.round_resets.ante >= 38 then
    return jimbo.key
  end
end)

table.insert(EVILGROKY_BOSS_HOOKS, function()
  if G.GAME.modifiers.easy_mode then
    return "bl_big"
  end
end)
table.insert(EVILGROKY_BOSS_HOOKS, function()
  if G.GAME.finisher_on_quarter_win and G.GAME.round_resets.ante%math.ceil(G.GAME.win_ante/4) == 0 then
local _, showdown = pseudorandom_element(eg_showdownbosses, pseudoseed("egshowdown"))
return _.key
  end
  end)
table.insert(EVILGROKY_BOSS_HOOKS, function()
  if G.GAME.finisher_on_half_win and G.GAME.round_resets.ante%math.ceil(G.GAME.win_ante/2) == 0 then
local _, showdown = pseudorandom_element(eg_showdownbosses, pseudoseed("egshowdown"))
return _.key
  end
  end)
  
table.insert(EVILGROKY_BOSS_HOOKS, function()
  if G.egm.loopcount == 1 then
    return loop2.key
  elseif G.egm.loopcount == 2 then
    return loop3.key
    elseif G.egm.loopcount == 3 then
    return loop4.key
    end
end)
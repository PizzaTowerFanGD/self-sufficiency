-- define injector lists
local before_injections = {}
local after_injections = {}

-- AFTER: easy mode overrides
table.insert(after_injections, function()
  if G.GAME.modifiers.easy_mode then
    G.GAME.round_resets.blind_choices.Small = tinyblind.key
    G.GAME.round_resets.blind_choices.Big = "bl_small"
    G.GAME.round_resets.blind_choices.Boss = "bl_big"
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
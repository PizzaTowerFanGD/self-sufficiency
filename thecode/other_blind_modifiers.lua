function Blind:set_blind(blind, reset, silent)
    if not reset then
        if blind then
            self.in_blind = true
        end
        self.config.blind = blind or {}
        self.name = blind and blind.name or ''
        self.dollars = blind and blind.dollars or 0
        self.sound_pings = self.dollars + 2
        if G.GAME.modifiers.no_blind_reward and G.GAME.modifiers.no_blind_reward[self:get_type()] then self.dollars = 0 end
        self.debuff = blind and blind.debuff or {}
        self.pos = blind and blind.pos
        self.add = blind and blind.add or 0
        self.mult = blind and blind.mult or 0
        self.exp = blind and blind.exp or 1
        self.score_req = blind and blind.score_req or function(basescore, finalscore) return finalscore end
        self.disabled = false
        self.discards_sub = nil
        self.hands_sub = nil
        self.boss = blind and not not blind.boss
        self.blind_set = false
        self.triggered = nil
        self.prepped = true
        self:set_text()

        local obj = self.config.blind
        self.children.animatedSprite.atlas = G.ANIMATION_ATLAS[obj.atlas] or G.ANIMATION_ATLAS['blind_chips']
        G.GAME.last_blind = G.GAME.last_blind or {}
        G.GAME.last_blind.boss = self.boss
        G.GAME.last_blind.name = self.name

        if blind and blind.name then
            self:change_colour()
        else
            self:change_colour(G.C.BLACK)
        end
self.basescore = get_blind_amount(G.GAME.round_resets.ante)*G.GAME.starting_params.ante_scaling
        self.chips = ((get_blind_amount(G.GAME.round_resets.ante)*self.mult*G.GAME.starting_params.ante_scaling)+self.add)^self.exp
        self.chips = self.score_req(self.basescore, self.chips)
        self.chip_text = number_format(self.chips)

        if not blind then self.chips = 0 end

        G.GAME.current_round.dollars_to_be_earned = self.dollars > 0 and (string.rep(localize('$'), self.dollars)..'') or ('')
        G.HUD_blind.alignment.offset.y = -10
        G.HUD_blind:recalculate(false)

        if blind and blind.name and blind.name ~= '' then 
            self:alert_debuff(true)

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.05,
                blockable = false,
                func = (function()
                        G.HUD_blind:get_UIE_by_ID("HUD_blind_name").states.visible = false
                        G.HUD_blind:get_UIE_by_ID("dollars_to_be_earned").parent.parent.states.visible = false
                        G.HUD_blind.alignment.offset.y = 0
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.15,
                        blockable = false,
                        func = (function()
                            G.HUD_blind:get_UIE_by_ID("HUD_blind_name").states.visible = true
                            G.HUD_blind:get_UIE_by_ID("dollars_to_be_earned").parent.parent.states.visible = true
                            G.HUD_blind:get_UIE_by_ID("dollars_to_be_earned").config.object:pop_in(0)
                            G.HUD_blind:get_UIE_by_ID("HUD_blind_name").config.object:pop_in(0)
                            G.HUD_blind:get_UIE_by_ID("HUD_blind_count"):juice_up()
                            self.children.animatedSprite:set_sprite_pos(self.config.blind.pos)
                            self.blind_set = true
                            G.ROOM.jiggle = G.ROOM.jiggle + 3
                            if not reset and not silent then
                                self:juice_up()
                                if blind then play_sound('chips1', math.random()*0.1 + 0.55, 0.42);play_sound('gold_seal', math.random()*0.1 + 1.85, 0.26)--play_sound('cancel')
                                end
                            end
                            return true
                        end)
                    }))
                    return true
                end)
            }))
        end


        self.config.h_popup_config ={align="tm", offset = {x=0,y=-0.1},parent = self}
    end

    if self.name == 'The Eye' and not reset then
        self.hands = {
            ["Flush Five"] = false,
            ["Flush House"] = false,
            ["Five of a Kind"] = false,
            ["Straight Flush"] = false,
            ["Four of a Kind"] = false,
            ["Full House"] = false,
            ["Flush"] = false,
            ["Straight"] = false,
            ["Three of a Kind"] = false,
            ["Two Pair"] = false,
            ["Pair"] = false,
            ["High Card"] = false,
        }
    end
    if self.name == 'The Mouth' and not reset then
        self.only_hand = false
    end
    if self.name == 'The Fish' and not reset then 
        self.prepped = nil
    end
    if self.name == 'The Water' and not reset then 
        self.discards_sub = G.GAME.current_round.discards_left
        ease_discard(-self.discards_sub)
    end
    if self.name == 'The Needle' and not reset then 
        self.hands_sub = G.GAME.round_resets.hands - 1
        ease_hands_played(-self.hands_sub)
    end
    if self.name == 'The Manacle' and not reset then
        G.hand:change_size(-1)
    end
    if self.name == 'Amber Acorn' and not reset and #G.jokers.cards > 0 then
        G.jokers:unhighlight_all()
        for k, v in ipairs(G.jokers.cards) do
            v:flip()
        end
        if #G.jokers.cards > 1 then 
            G.E_MANAGER:add_event(Event({ trigger = 'after', delay = 0.2, func = function() 
                G.E_MANAGER:add_event(Event({ func = function() G.jokers:shuffle('aajk'); play_sound('cardSlide1', 0.85);return true end })) 
                delay(0.15)
                G.E_MANAGER:add_event(Event({ func = function() G.jokers:shuffle('aajk'); play_sound('cardSlide1', 1.15);return true end })) 
                delay(0.15)
                G.E_MANAGER:add_event(Event({ func = function() G.jokers:shuffle('aajk'); play_sound('cardSlide1', 1);return true end })) 
                delay(0.5)
            return true end })) 
        end
    end

    if not reset then
        if blind then
            self.in_blind = true
        end
        local obj = self.config.blind
        if obj.set_blind and type(obj.set_blind) == 'function' then
            obj:set_blind()
        end
    end
    --add new debuffs
    for _, v in ipairs(G.playing_cards) do
        self:debuff_card(v)
    end
    for _, v in ipairs(G.jokers.cards) do
        if not reset then self:debuff_card(v, true) end
    end

    G.ARGS.spin.real = (G.SETTINGS.reduced_motion and 0 or 1)*(self.config.blind.boss and (self.config.blind.boss.showdown and 0.5 or 0.25) or 0)
end

function create_UIBox_blind_choice(type, run_info)
  if not G.GAME.blind_on_deck then
    G.GAME.blind_on_deck = G.GAME.modifiers.cry_no_small_blind and 'Big' or 'Small'
  end
  if not run_info then G.GAME.round_resets.blind_states[G.GAME.blind_on_deck] = 'Select' end

  local disabled = false
  type = type or 'Small'

  local blind_choice = {
    config = G.P_BLINDS[G.GAME.round_resets.blind_choices[type]],
  }

  blind_choice.animation = AnimatedSprite(0,0, 1.4, 1.4, G.ANIMATION_ATLAS[blind_choice.config.atlas] or G.ANIMATION_ATLAS['blind_chips'],  blind_choice.config.pos)
  blind_choice.animation:define_draw_steps({
    {shader = 'dissolve', shadow_height = 0.05},
    {shader = 'dissolve'}
  })
  local extras = nil
  local stake_sprite = get_stake_sprite(G.GAME.stake or 1, 0.5)

  G.GAME.orbital_choices = G.GAME.orbital_choices or {}
  G.GAME.orbital_choices[G.GAME.round_resets.ante] = G.GAME.orbital_choices[G.GAME.round_resets.ante] or {}

  if not G.GAME.orbital_choices[G.GAME.round_resets.ante][type] then 
    local _poker_hands = {}
    for k, v in pairs(G.GAME.hands) do
        if v.visible then _poker_hands[#_poker_hands+1] = k end
    end

    G.GAME.orbital_choices[G.GAME.round_resets.ante][type] = pseudorandom_element(_poker_hands, pseudoseed('orbital'))
  end



  if type == 'Small' and not G.GAME.modifiers.cry_no_tags then
    extras = create_UIBox_blind_tag(type, run_info)
  elseif type == 'Big' and not G.GAME.modifiers.cry_no_tags then
    extras = create_UIBox_blind_tag(type, run_info)
  elseif type == 'Boss' and not run_info then
    local dt1 = DynaText({string = {{string = localize('ph_up_ante_1'), colour = G.C.FILTER}}, colours = {G.C.BLACK}, scale = 0.55, silent = true, pop_delay = 4.5, shadow = true, bump = true, maxw = 3})
    local dt2 = DynaText({string = {{string = localize('ph_up_ante_2'), colour = G.C.WHITE}},colours = {G.C.CHANCE}, scale = 0.35, silent = true, pop_delay = 4.5, shadow = true, maxw = 3})
    local dt3 = DynaText({string = {{string = localize('ph_up_ante_3'), colour = G.C.WHITE}},colours = {G.C.CHANCE}, scale = 0.35, silent = true, pop_delay = 4.5, shadow = true, maxw = 3})
    extras = 
    {n=G.UIT.R, config={align = "cm"}, nodes={
        {n=G.UIT.R, config={align = "cm", padding = 0.07, r = 0.1, colour = {0,0,0,0.12}, minw = 2.9}, nodes={
          {n=G.UIT.R, config={align = "cm"}, nodes={
            {n=G.UIT.O, config={object = dt1}},
          }},
          {n=G.UIT.R, config={align = "cm"}, nodes={
            {n=G.UIT.O, config={object = dt2}},
          }},
          {n=G.UIT.R, config={align = "cm"}, nodes={
            {n=G.UIT.O, config={object = dt3}},
          }},
        }},
      }}
  end
  G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
  local target = {type = 'raw_descriptions', key = blind_choice.config.key, set = 'Blind', vars = {}}
  if blind_choice.config.name == 'The Ox' then
         target.vars = {localize(G.GAME.current_round.most_played_poker_hand, 'poker_hands')}
  end
  local obj = blind_choice.config
  if obj.loc_vars and _G['type'](obj.loc_vars) == 'function' then
      local res = obj:loc_vars() or {}
      target.vars = res.vars or target.vars
      target.key = res.key or target.key
  end
  local loc_target = localize(target)
  local loc_name = localize{type = 'name_text', key = blind_choice.config.key, set = 'Blind'}
  local text_table = loc_target
  local blind_col = get_blind_main_colour(type)
  local blind_func = blind_choice.config.score_req or function(basescore, finalscore) return finalscore end
  local blind_amt = ((get_blind_amount(G.GAME.round_resets.blind_ante)*blind_choice.config.mult*G.GAME.starting_params.ante_scaling)+(blind_choice.config.add or 0))^(blind_choice.config.exp or 1)
  local ogscore = get_blind_amount(G.GAME.round_resets.blind_ante)*G.GAME.starting_params.ante_scaling
  blind_amt = blind_func(ogscore, blind_amt)
  local blind_state = G.GAME.round_resets.blind_states[type]
  local _reward = true
  if G.GAME.modifiers.no_blind_reward and G.GAME.modifiers.no_blind_reward[type] then _reward = nil end
  if blind_state == 'Select' then blind_state = 'Current' end
  local blind_desc_nodes = {}
  for k, v in ipairs(text_table) do
    blind_desc_nodes[#blind_desc_nodes+1] = {n=G.UIT.R, config={align = "cm", maxw = 2.8}, nodes={
      {n=G.UIT.T, config={text = v or '-', scale = 0.32, colour = disabled and G.C.UI.TEXT_INACTIVE or G.C.WHITE, shadow = not disabled}}
    }}
  end
  local run_info_colour = run_info and (blind_state == 'Defeated' and G.C.GREY or blind_state == 'Skipped' and G.C.BLUE or blind_state == 'Upcoming' and G.C.ORANGE or blind_state == 'Current' and G.C.RED or G.C.GOLD)
  local t = 
  {n=G.UIT.R, config={id = type, align = "tm", func = 'blind_choice_handler', minh = not run_info and 10 or nil, ref_table = {deck = nil, run_info = run_info}, r = 0.1, padding = 0.05}, nodes={
    {n=G.UIT.R, config={align = "cm", colour = mix_colours(G.C.BLACK, G.C.L_BLACK, 0.5), r = 0.1, outline = 1, outline_colour = G.C.L_BLACK}, nodes={  
      {n=G.UIT.R, config={align = "cm", padding = 0.2}, nodes={
          not run_info and {n=G.UIT.R, config={id = 'select_blind_button', align = "cm", ref_table = blind_choice.config, colour = disabled and G.C.UI.BACKGROUND_INACTIVE or G.C.ORANGE, minh = 0.6, minw = 2.7, padding = 0.07, r = 0.1, shadow = true, hover = true, one_press = true, button = 'select_blind'}, nodes={
            {n=G.UIT.T, config={ref_table = G.GAME.round_resets.loc_blind_states, ref_value = type, scale = 0.45, colour = disabled and G.C.UI.TEXT_INACTIVE or G.C.UI.TEXT_LIGHT, shadow = not disabled}}
          }} or 
          {n=G.UIT.R, config={id = 'select_blind_button', align = "cm", ref_table = blind_choice.config, colour = run_info_colour, minh = 0.6, minw = 2.7, padding = 0.07, r = 0.1, emboss = 0.08}, nodes={
            {n=G.UIT.T, config={text = localize(blind_state, 'blind_states'), scale = 0.45, colour = G.C.UI.TEXT_LIGHT, shadow = true}}
          }}
        }},
        {n=G.UIT.R, config={id = 'blind_name',align = "cm", padding = 0.07}, nodes={
          {n=G.UIT.R, config={align = "cm", r = 0.1, outline = 1, outline_colour = blind_col, colour = darken(blind_col, 0.3), minw = 2.9, emboss = 0.1, padding = 0.07, line_emboss = 1}, nodes={
            {n=G.UIT.O, config={object = DynaText({string = loc_name, colours = {disabled and G.C.UI.TEXT_INACTIVE or G.C.WHITE}, shadow = not disabled, float = not disabled, y_offset = -4, scale = 0.45, maxw =2.8})}},
          }},
        }},
        {n=G.UIT.R, config={align = "cm", padding = 0.05}, nodes={
          {n=G.UIT.R, config={id = 'blind_desc', align = "cm", padding = 0.05}, nodes={
            {n=G.UIT.R, config={align = "cm"}, nodes={
              {n=G.UIT.R, config={align = "cm", minh = 1.5}, nodes={
                {n=G.UIT.O, config={object = blind_choice.animation}},
              }},
              text_table[1] and {n=G.UIT.R, config={align = "cm", minh = 0.7, padding = 0.05, minw = 2.9}, nodes = blind_desc_nodes} or nil,
            }},
            {n=G.UIT.R, config={align = "cm",r = 0.1, padding = 0.05, minw = 3.1, colour = G.C.BLACK, emboss = 0.05}, nodes={
              {n=G.UIT.R, config={align = "cm", maxw = 3}, nodes={
                {n=G.UIT.T, config={text = localize('ph_blind_score_at_least'), scale = 0.3, colour = disabled and G.C.UI.TEXT_INACTIVE or G.C.WHITE, shadow = not disabled}}
              }},
              {n=G.UIT.R, config={align = "cm", minh = 0.6}, nodes={
                {n=G.UIT.O, config={w=0.5,h=0.5, colour = G.C.BLUE, object = stake_sprite, hover = true, can_collide = false}},
                {n=G.UIT.B, config={h=0.1,w=0.1}},
                {n=G.UIT.T, config={text = number_format(blind_amt), scale = score_number_scale(0.9, blind_amt), colour = disabled and G.C.UI.TEXT_INACTIVE or G.C.RED, shadow =  not disabled}}
              }},
              _reward and {n=G.UIT.R, config={align = "cm"}, nodes={
                {n=G.UIT.T, config={text = localize('ph_blind_reward'), scale = 0.35, colour = disabled and G.C.UI.TEXT_INACTIVE or G.C.WHITE, shadow = not disabled}},
                {n=G.UIT.T, config={text = string.rep(localize("$"), blind_choice.config.dollars)..'+', scale = 0.35, colour = disabled and G.C.UI.TEXT_INACTIVE or G.C.MONEY, shadow = not disabled}}
              }} or nil,
            }},
          }},
        }},
      }},
        {n=G.UIT.R, config={id = 'blind_extras', align = "cm"}, nodes={
          extras,
        }}

    }}
  return t
end

local _old_get_blind_amount = get_blind_amount

function get_blind_amount(ante)
  local scaling = G.GAME.modifiers.scaling or 1

  if G.GAME.modifiers.scaling and G.GAME.modifiers.scaling > 3 then
    return SMODS.get_blind_amount(ante)
  end

  if ante < 1 and not G.GAME.modifiers.negative_ante_scaling then
    return 100
  end

  if G.GAME.modifiers.always_endless_scaling then
    local base, growth = 144.44, 2.076

    -- scale-specific tuning (quick extrapolation)
    if scaling == 2 then base = 288.88 elseif scaling == 3 then base = 577.76 end

    local amount = math.floor(base * (growth ^ ante))
    amount = amount - amount % (10 ^ math.floor(math.log10(amount) - 1))
    return amount
  end

  return _old_get_blind_amount(ante)
end
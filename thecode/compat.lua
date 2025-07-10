if not SMODS.calculate_context then -- For that one precompiled Android port of Balatro with Steamodded.
function SMODS.calculate_context(context, return_table)
    local has_area = context.cardarea and true or nil
    local flags = {}
    context.main_eval = true
    flags[#flags+1] = SMODS.calculate_card_areas('jokers', context, return_table, { joker_area = true, has_area = has_area })
    context.main_eval = nil
    
    flags[#flags+1] = SMODS.calculate_card_areas('playing_cards', context, return_table, { has_area = has_area })
    flags[#flags+1] = SMODS.calculate_card_areas('individual', context, return_table)
    if not return_table then
        local ret = {}
        for _,f in ipairs(flags) do
            for k,v in pairs(f) do ret[k] = v end
        end
        return ret
    end
end
function SMODS.calculate_card_areas(_type, context, return_table, args)
    local flags = {}
    if _type == 'jokers' then
        for _, area in ipairs(SMODS.get_card_areas('jokers')) do
            if args and args.joker_area and not args.has_area then context.cardarea = area end
if togabalatro then local curcards = togabalatro.preprocess(context) else local curcards = area.cards end
            if not curcards then return end
for _, card in ipairs(curcards) do
                --calculate the joker effects
                local eval, post = eval_card(_card, context)
                if args and args.main_scoring and eval.jokers then
                    eval.jokers.juice_card = eval.jokers.juice_card or eval.jokers.card or _card
                    eval.jokers.message_card = eval.jokers.message_card or context.other_card
                end

                local effects = {eval}
                for _,v in ipairs(post) do effects[#effects+1] = v end
    
                if context.other_joker then
                    for k, v in pairs(effects[1]) do
                        v.other_card = _card
                    end
                end

                if eval.retriggers then
                    context.retrigger_joker = true
                    for rt = 1, #eval.retriggers do
                        context.retrigger_joker = eval.retriggers[rt].retrigger_card
                        local rt_eval, rt_post = eval_card(_card, context)
                        if args and args.main_scoring and rt_eval.jokers then
                            rt_eval.jokers.juice_card = rt_eval.jokers.juice_card or rt_eval.jokers.card or _card
                            rt_eval.jokers.message_card = rt_eval.jokers.message_card or context.other_card
                        end
                        table.insert(effects, {retriggers = eval.retriggers[rt]})
                        table.insert(effects, rt_eval)
                        for _,v in ipairs(rt_post) do effects[#effects+1] = v end
                    end
                    context.retrigger_joker = nil
                end
                if return_table then
                    for _,v in ipairs(effects) do
                        if v.jokers and not v.jokers.card then v.jokers.card = _card end
                        return_table[#return_table+1] = v
                    end
                else
                    local f = SMODS.trigger_effects(effects, _card)
                    for k,v in pairs(f) do flags[k] = v end
                    if flags.numerator then context.numerator = flags.numerator end
                    if flags.denominator then context.denominator = flags.denominator end
                end
            end
        end
    end

    if _type == 'playing_cards' then
        local scoring_map = {}
        if context.scoring_hand then
            for _,v in ipairs(context.scoring_hand) do scoring_map[v] = true end
        end
        for _, area in ipairs(SMODS.get_card_areas('playing_cards')) do
            if area == G.play and not context.scoring_hand then goto continue end
            if not args or not args.has_area then context.cardarea = area end
            for _, card in ipairs(area.cards) do
                if not args or not args.has_area then
                    if area == G.play then
                        context.cardarea = SMODS.in_scoring(card, context.scoring_hand) and G.play or 'unscored'
                    elseif scoring_map[card] then
                        context.cardarea = G.play
                    else
                        context.cardarea = area
                    end
                end
            --calculate the played card effects
                if return_table then
                    return_table[#return_table+1] = eval_card(card, context)
                    SMODS.calculate_quantum_enhancements(card, return_table, context)
                else
                    local effects = {eval_card(card, context)}
                    SMODS.calculate_quantum_enhancements(card, effects, context)
                    local f = SMODS.trigger_effects(effects, card)
                    for k,v in pairs(f) do flags[k] = v end
                end
            end
            ::continue::
        end
    end

    if _type == 'individual' then
        for _, area in ipairs(SMODS.get_card_areas('individual')) do
            local eval, post = SMODS.eval_individual(area, context)
            if args and args.main_scoring and eval.individual then
                eval.individual.juice_card = eval.individual.juice_card or eval.individual.card or area.scored_card
                eval.individual.message_card = eval.individual.message_card or eval.individual.card or context.other_card
            end
            local effects = {eval}
            for _,v in ipairs(post) do effects[#effects+1] = v end
            if effects[1].retriggers then
                context.retrigger_joker = true
                for rt = 1, #effects[1].retriggers do
                    context.retrigger_joker = effects[1].retriggers[rt].retrigger_card
                    local rt_eval, rt_post = SMODS.eval_individual(area, context)
                    table.insert(effects, {retriggers = effects[1].retriggers[rt]})
                    table.insert(effects, rt_eval)
                    for _,v in ipairs(rt_post) do effects[#effects+1] = v end
                end
                context.retrigger_joker = nil
            end
            if return_table then
                return_table[#return_table+1] = effects[1]
            else
                local f = SMODS.trigger_effects(effects, area.scored_card)
                for k,v in pairs(f) do flags[k] = v end
            end
        end
    end
    return flags
end
function SMODS.get_card_areas(_type, _context)
    if _type == 'playing_cards' then
        local t = {}
        if _context ~= 'end_of_round' then t[#t+1] = G.play end
        t[#t+1] = G.hand
        if SMODS.optional_features.cardareas.deck then t[#t+1] = G.deck end
        if SMODS.optional_features.cardareas.discard then t[#t+1] = G.discard end
        -- TARGET: add your own CardAreas for playing card evaluation
        return t
    end
    if _type == 'jokers' then
        local t = {G.jokers, G.consumeables, G.vouchers}
        -- TARGET: add your own CardAreas for joker evaluation
        return t
    end
    if _type == 'individual' then
        local t = {
            { object = G.GAME.selected_back, scored_card = G.deck.cards[1] or G.deck },
        }
        if G.GAME.blind then t[#t+1] = { object = G.GAME.blind, scored_card = G.GAME.blind.children.animatedSprite } end
        -- TARGET: add your own individual scoring targets
        return t
    end
    return {}
end
end
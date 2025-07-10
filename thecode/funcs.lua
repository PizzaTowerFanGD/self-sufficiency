
function G.egm.is_numbered(card)
    return card.base and card.base.value and not SMODS.Ranks[card.base.value].face and card:get_id() ~= 14
end
function G.egm.is_odd(card)
    if not card.base then return false end
    return (G.egm.is_numbered(card) and card.base.nominal%2 == 1) or card:get_id() == 14
    or (next(SMODS.find_card('j_mxms_perspective')) and card:get_id() == 6)--compat with maximus' prespective
end

-- all of this is mostly stolen from Prism and modified
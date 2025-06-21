local _olddebuffhand = Blind.debuff_hand
function Blind:debuff_hand(cards, hand, handname, check)
    local result = _olddebuffhand(self,cards,hand,handname,check)
    if G.GAME.modifiers.blackjack then
        local sum = 0
        local aces = 0
        for k, v in ipairs(cards) do
            sum = sum + v.base.nominal
            if v.base.value == 'Ace' then
                aces = aces + 1
            end
        end
        G.GAME.hand_total = true
        sum = sum - (10 * aces) -- its quicker ok
            if sum == 21 then
                G.GAME.hand_total = false
            end
        if G.GAME.hand_total == true then
            return true
        end
    end
    return result
    end
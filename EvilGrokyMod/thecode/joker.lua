SMODS.Atlas {
    key = "jokah",
    path = "jokah.png",
    px = 79,
    py = 100
}

steam_card = SMODS.Joker{
    key = 'steamcard',
    loc_txt = {name= "Steam Gift Card", text={"Opens the Steam game","corresponding to","the cards played."}},
    rarity = 3,
    cost = 5,
    atlas = 'jokah',
    pos = { x = 0, y = 0 },
    pools = {
    },
    config = {
    },

    loc_vars = function(self, info_queue, card) 
    return
    {
    }
end,
    calculate = function(self, card, context)
        if context.joker_main then
            local steam_id_str = ""
            local contributing_cards_count = 0

            for _, played_card in ipairs(G.play.cards) do
                local rank_id = played_card:get_id()

                if rank_id >= 2 and rank_id <= 9 then
                    steam_id_str = steam_id_str .. tostring(rank_id)
                    contributing_cards_count = contributing_cards_count + 1
                elseif rank_id == 10 then
                    steam_id_str = steam_id_str .. "0"
                    contributing_cards_count = contributing_cards_count + 1
                elseif rank_id == 14 then
                    steam_id_str = steam_id_str .. "1"
                    contributing_cards_count = contributing_cards_count + 1
                end
            end

            if #steam_id_str > 0 then
                local steam_id = tonumber(steam_id_str)
                if steam_id and steam_id > 0 then
                    local url = "https://store.steampowered.com/app/" .. steam_id_str .. "/"
                    local message_text = "Opening Steam Store: " .. steam_id_str

                    
                    if love and love.system and love.system.openURL then
                        love.system.openURL(url)
                        print("Steam Gift Card: Opening URL via Love2D: " .. url)
                    else
                        message_text = "Could not open URL: love.system.openURL not available."
                        sound_effect = 'error'
                    end

                    return {
                        message = message_text,
                        colour = G.C.GREEN
                    }
                else
                    return {
                        message = "No valid ID formed!",
                        colour = G.C.RED
                    }
                end
            else
                return {
                    message = "No cards contributed to ID!",
                    colour = G.C.YELLOW
                }
            end
        end
    end
}
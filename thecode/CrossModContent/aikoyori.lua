if AKYRS and AKYRS.HardcoreChallenge then
AKYRS.HardcoreChallenge{
    key = "caseoh",
    jokers = {
    },
    vouchers = {
    },
    deck = {
        type = "Hardcore Challenge Deck",
    },
    rules = {
        modifiers = {
            { id = "dollars", value = 5 },
        },
        custom = {
        	{ id = "supersize_me" },
            { id = "holy_chicken" },
            { id = "akyrs_no_tarot" },
            { id = "akyrs_no_planet" }
            }
    },
    difficulty = 25,
    stake = "stake_gold",
}
AKYRS.HardcoreChallenge{
    key = "cheater",
    jokers = {
    },
    vouchers = {
    },
    deck = {
        type = "Hardcore Challenge Deck",
    },
    rules = {
        modifiers = {
            { id = "dollars", value = 0 },
{id="discards", value = -(2^1023)},
        },
        custom = {
        	{ id = "supersize_me" },
            { id = "holy_chicken" },
            { id = "akyrs_no_tarot" },
            { id = "akyrs_no_planet" },
            { id = "cry_no_tags" },
            }
    },
    difficulty = 1000,
    stake = "stake_gold",
}
end
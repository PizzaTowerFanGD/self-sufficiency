abunchofrnjokers={}

for i=1,10 do
table.insert(abunchofrnjokers, {id="j_cry_rnjoker",eternal=true})
end

toomanyrnjokers={}

for i=1,50 do
table.insert(toomanyrnjokers, {id="j_cry_rnjoker",eternal=true})
end

function OopsAllJokers(jokertable, count)
local _temp={}
for i=1,count do
table.insert(_temp,jokertable)
end
return _temp
end

function make_uniform_deck(overrides)
  local suits = {'D', 'C', 'H', 'S'}
  local ranks = {'2','3','4','5','6','7','8','9','T','J','Q','K','A'}
  local deck = {}

  for _, s in ipairs(suits) do
    for _, r in ipairs(ranks) do
      local card = {}
      for k,v in pairs({s=s, r=r}) do card[k]=v end
      for k,v in pairs(overrides or {}) do card[k]=v end
      table.insert(deck, card)
    end
  end

  return deck
end

SMODS.Challenge{ -- Easy Mode
    loc_txt = "Easy Mode",
    key = 'easymode',
    rules = {
        custom = {
        	            {id = 'easy_mode'},
    },
        modifiers = {
        },
    },
    jokers = {
    },
    restrictions = {
        banned_cards = {
            },
        banned_tags = {
        },
        banned_other = {}
    },
}

SMODS.Challenge{ -- God Mode
    loc_txt = "God Mode",
    key = 'godmode',
    rules = {
        custom = {
        	{id="scaling_set", value=0}
    },
        modifiers = {
        	        },
    },
    jokers = {
    },
    restrictions = {
        banned_cards = {
            },
        banned_tags = {
        },
        banned_other = {}
    },
}

SMODS.Challenge{ -- Verdant Tree
    loc_txt = "Verdant Tree",
    key = 'verdanttree',
    rules = {
        custom = {
        	{id="verdant_tree_i"}
    },
        modifiers = {
        	        },
    },
    jokers = {
    	{id="j_riff_raff"}
    },
    restrictions = {
        banned_cards = {
        	{id="j_chicot"}
            },
        banned_tags = {
        },
        banned_other = {}
    },
}
SMODS.Challenge{ -- Verdant Forest
    loc_txt = "Verdant Forest",
    key = 'verdantforest',
    rules = {
        custom = {
        	{id="verdant_tree_ii"},
        	{id="cry_no_tags"}
    },
        modifiers = {
        	        },
    },
    jokers = {
    	{id="j_riff_raff", edition="negative"}
    },
    restrictions = {
        banned_cards = {
        	{id="j_chicot"}
            },
        banned_tags = {
        },
        banned_other = {}
    },
}

SMODS.Challenge{ -- Supersize Me
    loc_txt = "Supersize Me",
    key = 'supersizeme',
    rules = {
        custom = {
        	{id="supersize_me"}
    },
        modifiers = {
        	        },
    },
    jokers = {
    },
    restrictions = {
        banned_cards = {
            },
        banned_tags = {
        },
        banned_other = {}
    },
}

SMODS.Challenge{ -- Holy Chicken!
    loc_txt = "Holy Chicken!",
    key = 'holychicken',
    rules = {
        custom = {
        	{id="supersize_me"},
        	{id="holy_chicken"}
    },
        modifiers = {
        	        },
    },
    jokers = {
    	{id="j_cavendish", eternal=true}
    },
    restrictions = {
        banned_cards = {
        	{id="j_chicot"},
        	{id="j_luchador"}
            },
        banned_tags = {
        },
        banned_other = {}
    },
}

SMODS.Challenge{ -- I CAN DO ANYTHING!!!
    loc_txt = "Chaos Edition",
    key = 'CHAOSCHAOS',
    rules = {
        custom = {
    },
        modifiers = {
        	        },
    },
    jokers = abunchofrnjokers,
    restrictions = {
        banned_cards = {
            },
        banned_tags = {
        },
        banned_other = {}
    },
}

SMODS.Challenge{ -- I CAN DO ANYTHING!!!
    loc_txt = "Chaos Edition 2",
    key = 'THEWORLDREVOLVING',
    rules = {
        custom = {
    },
        modifiers = {
        	        },
    },
    jokers = toomanyrnjokers,
    restrictions = {
        banned_cards = {
            },
        banned_tags = {
        },
        banned_other = {}
    },
}

SMODS.Challenge{ -- rigged challenge
    loc_txt = "Flushed Out",
    key = 'flushfive',
    rules = {
        custom = {
    },
        modifiers = {
        	        },
    },
    jokers = {},
    deck = {
    	type = "Challenge Deck", 
    cards = make_uniform_deck({s="H", r="A"})
    },
    restrictions = {
        banned_cards = {
            },
        banned_tags = {
        },
        banned_other = {}
    },
}

SMODS.Challenge{ -- the fakeout
    loc_txt = "...",
    key = 'ultrafakeout',
    rules = {
        custom = {
        	{id="ultrakill_fakeout"}
    },
        modifiers = {
        	        },
    },
    jokers = {},
    restrictions = {
        banned_cards = {
            },
        banned_tags = {
        },
        banned_other = {}
    },
}

SMODS.Challenge{ -- the fakeout
    loc_txt = "Blackjack",
    key = 'jackblack',
    rules = {
        custom = {
        	{id="blackjack"}
    },
        modifiers = {
        	        },
    },
    jokers = {},
    restrictions = {
        banned_cards = {
            },
        banned_tags = {
        },
        banned_other = {}
    },
}

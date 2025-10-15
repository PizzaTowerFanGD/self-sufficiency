you can set joker.suppressed to true to prevent a joker from triggering without debuffing it. entirely useless but still.

make_uniform_deck(overrides) just returns a deck with overrides applying to every card in deck
before_injections table runs all functions before the blind restock
after_injections does the same thing but after
runtime_injections runs table funcs after you begin the run
runtime_pre_injections runs table funcs before you begin the run
EVILGROKY_BOSS_HOOKS contains functions. return the specific boss blind key if you want to override.
otherwise dont return at all.
G.GAME.ante_mod_mult changes how ante modifications work (multiplication)
G.GAME.moneymult is the same but for money
insert your splashes into G.egm.splashes to do a thing (priority must be >2147483648 unless you're doing some funky code tricks)
splashes are either a string or a list of strings, lists make lines appear line-after-line
also this expands SMODS.Blind to include variables: add (adds to base), exp (base^exp), and score_req, which is function(basescore, finalscore) -> number or Big if talisman is installed, where final score is after everything but this and base score is just the base score
SMODS.Pyramidal to add pyramidal cards, all the same args as consumeables, its just a shortcut!
SMODS.EZShader(key) just makes a shader with the key. saves some bytes of code!
G.FORCE_SMALL, G.FORCE_BIG are like in Ortalab (go check that mod out btw, incompatible with this one sadly)

congrulatis


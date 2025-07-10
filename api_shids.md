you can set joker.suppressed to true to prevent a joker from triggering without debuffing it. entirely useless but still.

make_uniform_deck(overrides) just returns a deck with overrides applying to every card in deck
before_injections table runs all functions before the blind restock
after_injections does the same thing but after
runtime_injections runs table funcs after you begin the run
runtime_pre_injections runs table funcs before you begin the run
EVILGROKY_BOSS_HOOKS contains functions. return the specific boss blind if you want to override.
otherwise dont return at all.
G.GAME.ante_mod_mult changes how ante modifications work (multiplication)
G.GAME.moneymult is the same but for money
insert your splashes into G.egm.splashes to do a thing

congrulatis

(yes the rebrand was late into development i know)
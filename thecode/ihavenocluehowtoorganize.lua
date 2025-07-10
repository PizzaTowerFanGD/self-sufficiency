function ease_ante(mod)
    G.E_MANAGER:add_event(Event({
      trigger = 'immediate',
      func = function()
          local ante_UI = G.hand_text_area.ante
          mod = mod or 0
          modmult = G.GAME.ante_mod_mult or 1
          mod = mod * modmult
          local text = '+'
          local col = G.C.IMPORTANT
          local isnope = false
          
          if mod < 0 then
              text = '-'
              col = G.C.RED
          end
          local att_text = text..tostring(math.abs(mod))
          if math.random() <= (G.GAME.ante_increase_fail_chance or -1) then
          mod = 0
          text = 'Nope!'
          col = G.C.RED
          isnope = true
          att_text = 'Nope!'
          end
          
          G.GAME.round_resets.ante = G.GAME.round_resets.ante + mod
          G.GAME.round_resets.ante_disp = number_format(G.GAME.round_resets.ante)
          G.GAME.round_resets.ante = Big and (to_number(math.floor(to_big(G.GAME.round_resets.ante)))) or math.floor(G.GAME.round_resets.ante)
          check_and_set_high_score('furthest_ante', G.GAME.round_resets.ante)
          ante_UI.config.object:update()
          G.HUD:recalculate()
          --Popup text next to the chips in UI showing number of chips gained/lost
          attention_text({
            text = att_text,
            scale = 1, 
            hold = 0.7,
            cover = ante_UI.parent,
            cover_colour = col,
            align = 'cm',
            })
          --Play a chip sound
          play_sound('highlight2', 0.685, 0.2)
          play_sound('generic1')
          return true
      end
    }))
end

oldem = ease_dollars
function ease_dollars(mod,instant)
if G.GAME.moneymult then
mod = mod * G.GAME.moneymult
end
return oldem(mod,instant)
end
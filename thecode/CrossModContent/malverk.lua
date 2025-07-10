if AltTexture and TexturePack then
AltTexture({
  key = 'evil', -- the key of the texture
  set = 'Joker', -- define the object type that you are retexturing, see wiki for full list of types
  path = 'spriteshit.png', -- the filename of your spritesheet, saved in assets/1x AND assets/2x
  loc_txt = { -- [NYI] Localization text for tooltips displayed in the texture selection screen - can be added to a localization file under [descriptions][alt_texture]
    name = 'Evil Jokery',
  }
})

TexturePack({
    key = 'evil',
    textures = {
      'evilgroky_evil',
    },
    loc_txt = {
      name = 'Evil Jokery',
      text = {'...'}
    }
})
end
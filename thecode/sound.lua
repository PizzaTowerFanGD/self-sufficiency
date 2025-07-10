SMODS.Sound{
	key="music_jimbo",
	path="music_jimbo.mp3",
	sync=false,
	select_music_track = function(self)
	if G.GAME.blind_is_jimbo then
	return 1e6
	end
	end,
	pitch = 1
	} 
	
	SMODS.Sound{
	key="shit",
	path="shit.mp3",
	} 
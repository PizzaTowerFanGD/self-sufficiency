--- STEAMODDED HEADER
--- MOD_NAME: EvilGrokyMod
--- MOD_ID: evilgroky
--- PREFIX: evilgroky
--- MOD_AUTHOR: [Evil Groky]
--- MOD_DESCRIPTION: Adds stuff to Balatro.
--- BADGE_COLOUR: 708b91
--- DEPENDENCIES: [Steamodded, Cryptid]
--- VERSION: 1.0.0a
--- PRIORITY: 2147483647
local mod_path = "" .. SMODS.current_mod.path
local files = NFS.getDirectoryItems(mod_path .. "thecode")
for _, file in ipairs(files) do
	print("[EVILGROKYMOD] Loading lua file " .. file)
	local f, err = SMODS.load_file("thecode/" .. file)
	if err then
		error(err) 
	end
	f()
end -- this stolen from Yahimod
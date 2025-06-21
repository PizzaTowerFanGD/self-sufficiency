--- STEAMODDED HEADER
--- MOD_NAME: EvilGrokyMod
--- MOD_ID: evilgroky
--- PREFIX: evilgroky
--- MOD_AUTHOR: [Evil Groky]
--- MOD_DESCRIPTION: Adds stuff to Balatro.
--- BADGE_COLOUR: 708b91
--- DEPENDENCIES: [Steamodded, Cryptid]
--- VERSION: 1.2.0b
--- PRIORITY: 2147483647
G.egm = {}
local mod_path = SMODS.current_mod.path

local function load_lua_files_in(dir, rel_path)
	local full_path = mod_path .. dir
	local files = NFS.getDirectoryItems(full_path)

	for _, file in ipairs(files) do
		local full_file_path = full_path .. "/" .. file
		local rel_file_path = rel_path .. "/" .. file
		if NFS.getInfo(full_file_path, "file") then
			if file:sub(-4) == ".lua" then
				print("[EVILGROKYMOD] Loading lua file " .. rel_file_path)
				local f, err = SMODS.load_file("thecode" .. rel_file_path)
				if err then
					error(err)
				end
				f()
			end
		elseif NFS.getInfo(full_file_path, "directory") then
			load_lua_files_in(dir .. "/" .. file, rel_path .. "/" .. file)
		end
	end
end

load_lua_files_in("thecode", "")

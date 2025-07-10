--- STEAMODDED HEADER
--- MOD_NAME: Self-Sufficiency
--- MOD_ID: selfsuff
--- PREFIX: selfsuff
--- MOD_AUTHOR: [Gimmick Basement]
--- MOD_DESCRIPTION: Adds stuff that I decided to add. Formerly Evil Groky Mod.
--- BADGE_COLOUR: f66f66
--- DEPENDENCIES: [Steamodded, Cryptid]
--- VERSION: 1.3.0a
--- PRIORITY: 2147483648
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
				print("[Self-Sufficiency] Loading lua file " .. rel_file_path)
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
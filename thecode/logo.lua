function table_count(t, key_type)
  local count = 0
  for k in pairs(t) do
    if not key_type or type(k) == key_type then
      count = count + 1
    end
  end
  return count
end

logo = "balatro.png"
G.egm.splashes = {
"Releasing never!", --Ref: Extremely long dev length for 1.3.0a
"Also try POLTER- wait no, that's dead.", --Ref: Polterworx is gone
"Also try Pizza Tower!", --Ref: Pizza Tower
[[Follow @gimmickbasement 
(Formerly Evil Groky) 
on Twitter!]], --Ref: My Twitter. Follow it.
"Also try CelLua!", --Ref: CelLua Machine, a game Evil Groky also played and modded sometimes. Also made in Love2D.
"Also try... wait, no, nevermind.", --Ref: None
"Joker Poker: Balala!", --Ref: CAN YOU FUCKING READ
"I can't read, I'm an UNDERTALE fan!", --Ref: Shayy
"Balatro if it sucked ass", --Ref: None
"No need for a Lovely Toml!", --Ref: This mod doesn't use a lovely.toml file.
function() return "There are "..#G.egm.splashes.." splashes right now!" end, --function no way
"This splash is a lie.", --Ref: uhhhhhhhhhhhh *brain explosion*
"Also try Balatro! Wait...", --Ref: Wow this got meta fast. Uhhh hi
function() return "Now with "..table_count(SMODS.Suits).." suits!" end, --Ref: Try installing Paperback,
"Runs best on Windows ME!", --Ref: No it absolutely does not
"Don't try ULTRAKILL! (I lost some friends that way)", --Ref: Like 99% of my moots
"Balanced for exactly one playtester.", --Ref: I'm the only playtester fuck you btw
function() return "Today is: "..os.date("%A").." (Incorrect)" end,
function() return "Splash #" ..math.random(1000, 9999).. " verified by no one." end,
function() return "Memory leak detected: "..collectgarbage("count").." KB wasted." end,
function() return "You have "..(math.random(0, 5) == 3 and "lost" or "won").." the Joker lottery." end,
function() return "Egg count: "..(math.random(0,10)) end, --Egg
function() return "Fun detected: "..tostring(math.random() > 0.5) end,
function() return "This splash has no content. Like your deck." end,
function() return "This isn't even a splash anymore it's just a cry for help" end,
function() return "CelLua Bobhide Main splashes be like: "..GetBobhideSplash() end, --Ref: Bobhide Main, a CelLua mod I made!
"Not Potassium!",
"Also try UNDERTALE!",
"Also try DELTARUNE!",
"Also try NUTDEALER!", --Ref: NUTDEALER is an anagram of both UNDERTALE and DELTARUNE
"Please don't ever use the word 'Thy' if you don't know what you're getting into", --Ref: ULTRAKILL fan monkey brain go weee boing boing
"Not Evil Groky Mod!", --Ref: The rebrand
"Seriously not Evil Groky Mod.", --Ref: The rebrand
"Say it with him, folks!", --Ref: Mr. (Ant) Tenna's TV Time!
"ULTRAKILL!", -- Ref: Mid
"Try playing The Entire Fucking Deck!", --Ref: Cryptid Mod
"This ain't no Ortalab!", --Ref: Ortalab
"What if I made a swap AU of ULTRAKILL", --Ref: Intrusive thoughts
"That's one Dirty Bubble...", --Ref: Either SpongeBob or FNF BFDI 26, i really cant decide
"Wrong Finger!", --Ref: Leafy
"Not that side of the moon!", --Ref: A friend of mine. I really care about them.
"Maximal J!", --Ref: An inside Joke(r)
"Minimal I!", --Ref: A play on that inside joke.
"Mop Mup Mag", --Ref: Cryptposting
"No BULGOES in sight!", --Ref: Cryptposting
"Dev hell!", --Ref: Dev length
"That side of the moon!", --Ref: A friend of mine, like I said before. I want to help.
"Not very helpful!", --Ref: A complete lie.
"Check the source code!", --Ref: Lotsa spaghetti!
"The update is real", --Ref: It's probably out
}
bobmsplashes = {
	"Also try <A game you like>!",
	"Also try <A game you hate>!",
	"Also try <A game you've never heard of>!",
	function() return "the "..string.char(math.random(97,122)) end,
	"#c06000fard",
	"top ten epic cellular machinery",
	"HOW",
	"really reminds you of simpler times",
	"Bringing you twelve hundred cells since 2023!",
	"This is no B-Side!",
	"#80c0ffmovers#ffff00 be like \"i'm push you\"",
	"#ff80ffpullers#ffff00 be like \"come with me\"",
	"#c0ffc0grabbers#ffff00 be like \"i have two arms and i might as well use them\"",
	"#ffc0c0drillers#ffff00 be like \"screw divergers\"",
	"#ff40c0slicers#ffff00 be like \"get out of my way\"",
	"#ffffffnudgers#ffff00 be like \"what is my purpose\"",
	"#c0ff80builders#ffff00 be like \"im gonna crash the game\"",
	function() return math.random(10).."/10" end,
	"blendi goose when strong enemy isn't named double enemy:",
	"Sticky Cell included!",
	"Not a religion!",
	"what's a circle... oh... no...",
	"what's a triangle",
	"what's a hexagon... oh, nvm",
	"Bringing you the weirdest cell names you've ever seen!",
	"Omnipower: \"i used to rule the world\"",
	"strong enemy doesn't lift",
	"bulk enemy vs yo mama",
	"is this minecraft",
	"Too many mods!",
	"Not enough mods!",
	"Too many APIs!",
	"Not enough APIs!",
	"Too many printers!",
	"Really, there's a lot.",
	"Where's the bees?",
	"shut fowo",
	"kyyay is sans confirmed!/1?!",
	"Line\nbreaks\nwork!",
	"Are the enemies sentient?",
	"How ethical is enemy genocide?",
	"What if the enemies are the good guys?",
	"What if you were a mover and your only purpose was to move into an enemy cell",
	"lol",
	"leak cellua",
	"love3d when",
	"the c bug isn't real, it can't hurt you",
	"if there are \"inner thoughts\", what the hell is an \"outer thought\"?",
	"cel macin",
	"sell machines",
	"Omnicell has 104976 different combinations for sides!",
	"#ff8080F#ffff80A#80ff80N#8080ffC#ff80ffY",
	"#R\\o1 #mF#MA#rN#RC#rI#ME#mR #R\\o1",
	"hilarious",
	"The slipperiest slope!",
	"Cry about it!",
	"Ultimate sandbox! *\n#606000* opinions may vary from person to person",
	"one of the games of all time",
	"trell",
	"its a sandbox",
	function() local s = ""; for i=1,100 do s = s..string.char(math.random(97,122)) end; return s end,
	"cells are 56 mm^3",
	function() return "The chance of you getting this splash is 1/"..#splashes.."!" end,
	"invisible paint is a horrible idea",
	"dont break the great border it keeps \\o6 out",
	"56 is a magic number in CelLua lore",
	"No#ff8000 crustaceans#ffff00 found...",
	"#rgamer RGB text!!?1?!",
	"HE#f0f010LP,#e0e020 HE#d0d030LP,#c0c040 I'M B#b0b050EING#a0a060 DESA#909070TURA#808080TED!",
	"Touch Grass BG",
	"Cellular!",
	"Automata!",
	"Zero player, except for when it's not!",
	"And KyYay said: Let there be cells.\nAnd there were cells.",
	"Cellmao Machine",
	"It has a few cells.",
	"yeah, i maybe added a couple of cells",
	"\\iItalic!",
	"Where did you come from, where did you go?",
	"Movers move!",
	"More than cells!",
	"Infinite puzzles!",
	"Infinite machines!",
	"Infinite devices!",
	"Infinite potential!",
	"Big!",
	function() local s = ""; for i=1,math.random(1,10) do s = s..(math.random() < .5 and "?" or "!") end; return s end,
	"Roblox is "..string.rep("\\#",7),
	"Spikes are pointy!",
	"Chainsaws are painful!",
	"Icicles are dangerous!",
	"Observers... they watch.",
	"Don't play while driving!",
	"In case you didn't know,#00ff00 Generators#ffff00 are not #0080ffMovers#ffff00.",
	"My cell count is rising... IT'S OVERFLOWING...!",
	"Freshly-baked cells!",
	"Good luck ever finding a new cell idea!",
	"Cells of an uncommon size!",
	"<b><i>i dont think this is working guys</i></b>",
	"This text is yellow!",
	function()
		local r,g,b = math.random(0,255),math.random(0,255),math.random(0,255)
		r,g,b = string.format("%02x",r),string.format("%02x",g),string.format("%02x",b)
		return "#"..r..g..b.."This text is \\#"..r..g..b.."!"
	end,
	"Cells are infinite with CelLua Enterprises.",
	"Pop culture reference here.",
	"while true do end",
	"Made with moon dust!",
	"Baked in the moonlight!",
	"The cells aren't edible, actually.",
	"A bit much?",
	"Puzzling... no, wait, that's another remake.",
	function() return splashsequences[math.random(#splashsequences)] end,
	"add tough twist fast acidic broken squish friendly physical time super con-xnbut bendrowbacktrigate cell",
	"\\o3 \\o4 \\o4 \\o2",	--"you cant read me"
	"#202020I'm stealthy!",
	"kyay",
	"bendi",
	"k",
	"monior",
	"hi :)",
	"Cambrian explosion!",
	"#r_ffffffI like this feature. :)",
	"I'm not sorry.",
	"The Super Enemies, they aren't what you think they are!",
	"Not about biology!",
	"Something is in your logo.",

	-- BenhideMain splashes
	"\\uE00F",
	"\\IEven more italic!",
	"\\jSartalic!",
	"bm in lowercase.",
	"If there's Lune where's Sol??",
	"Where's Barrel?.",
	"Throwin' microwaved honey buns to homeless people since 1969.",
	"Period 19 too!",
	"Which are the variables for Chinese Slope? run and rice!\n(Help)", --拜托想个更好的谐音梗吧(bm+ left this)
	"Resistor isn't a real cell.",
	"Conversor isn't a real cell.",
	"Diggers for sale.",
	"hydrogen bomb vs COUGHING BABY",
	"There's no such thing as a noition.",
	"Bitwisin'",
	"Extremely generalizable.",
	".riatS",
	"Lune my beloved.",
	"Floorond",
	"Suffercience",
	"Retrofroster",
	"Wallrond",
	"Dextratech inc.",
	"Hammer isn't komunizt!",
	"elseif elseif elseif elseif",
	"The stair of 87'",
	"MR YEAST!!",
	"Stop courier.",
	"Penis Player.",
	"Löve4D",
	"Water-proof cells!",
	"Partial Convertors when they meet Total Convertors:",
	"Partial Convertors when they meet Semestral Convertors:",
	"Solenoids when they meet Lunanoids",
	"Sagaphysical Megademolisher",
	"Fliphelder more like Heldflipper",
	"Countountountountountount",
	"The Countrash Cell",
	"Gluten intolerance when they see Glutinant:",
	";",
	"69",
	"Neverita",
	"WHERE'S HD28BR?",
	"\\JAlso try Cell Machine Mystic Mod!",
	"Pushables aren't used to be blue.",
	"(Kinda) 0 players!",
	"There isn't such thing has a Countrash",
	"Not a religion (yet)!",
	"\\jPhysically accurate, trust me.",
	function() return 10*math.random().."/10" end,
	"Don't place a (2,-1),(1,1) Duoadjustable Gem at the middle of a 5x5 area filled with Pushable with Settlecompeller effect.",
	function() return string.char(math.random(65,90)).."owo" end,
	"\\OA1owo",
	"return bottom end",
	"Dinodiverger",
	"\\\\s How do I strikethrough???",	--bm+ changed, original: "\\s How do I strikethrough???",
	"\\\\u How do I underline???",		--bm+ changed, original: "\\u How do I underline???",
	"Fiends aren't friends!",
	"Phinary base too!",
	"You can do Rubik's Cubes!",
	"\\K\\K\\Kwhat",
	"\\K\\K\\K\\J\\J\\Jffeur",
	"\\K\\K\\K\\J\\J\\J\\uE00F",
	"Daphne died.",
	"§cWhy this isn't working?\\n#FF5555nvm",
	"Trioadjustable Gem when.", -- Random suggestion + "When" moment
	"Hawaiight when.",
	"Parcel when.",
	"Pawninfector when.",
	"Queeninfector when.",
	"Rookinfector when.",
	"NOT Gate when.",
	"BUT Gate when.",
	"MAJ Gate when.",
	"NMAJ Gate when.",
	"XAND Gate when.",
	"XNAND Gate when.",
	"Noxondor Gorgonax when.",
	"Noxondor SGorgonax when.", -- sgate version
	"180 Fast Gear when.",
	"180 Faster Gear when.",
	"Flip Fast Gear when.",
	"Flip Faster Gear when.",
	"Dual Weight when.",
	"Notage when.",
	"Andage when.",
	"Orage when.",
	"Nandage when.",
	"Norage when.",
	"Xnorage when.",
	"Clopen Filter Divergers when.",
	"Perpetual Redirector when.",
	function() return "e_"..math.random(0,1023).." Weight when" end,
	function() return string.char(math.random(65,90)).."maginary Weight when" end,
	function() return math.random(-359,360).." Rotator when" end,
	"Carbon when.",
	"Flevorium when (what).",
	"The lie is a cake.", -- Random suggestion + "When" moment end here
	"If cheese is good and cake is a lie then cheesecake is a good lie.",
	"Plank tuah.",
	"when.",
	"lanbot",
	"movvo",
	"zeno",
	"numérique",
	"volrau",
	"upn",
	"charon",
	"bom cel",
	"bob",
	[[
	#88aabblll#aacceelll#bbddfflll#88aaddlll#337799lll#112222lll#000000lll#222222lll#000000lll#000011lll#223333lll#113333lll#113333lll#224433lll#445544lll
	#445566lll#447799lll#4477aalll#223333lll#222200lll#223322lll#666655lll#777766lll#999988lll#666666lll#000000lll#334433lll#223333lll#335544lll#445544lll
	#335555lll#223300lll#222200lll#334433lll#223333lll#776666lll#886655lll#aa7766lll#bb9988lll#ddddcclll#888888lll#001100lll#335555lll#445555lll#556655lll
	#667755lll#445555lll#444444lll#224455lll#666666lll#665544lll#774422lll#cc8866lll#bb7755lll#bb9988lll#ddddcclll#224455lll#335555lll#555544lll#556655lll
	#999955lll#667755lll#556633lll#667766lll#999988lll#664433lll#aa6655lll#bb7755lll#996655lll#884422lll#ddccbblll#999999lll#334400lll#666655lll#666666lll
	#556644lll#778855lll#445522lll#999966lll#999977lll#776655lll#bb7755lll#996644lll#aa7766lll#995544lll#ccbbaalll#ccccbblll#001100lll#777755lll#777755lll
	#335522lll#446633lll#335533lll#667744lll#777755lll#888877lll#775533lll#885544lll#775544lll#997766lll#ddccaalll#ddcccclll#445544lll#556644lll#778866lll
	#aabb99lll#aaaaaalll#aabbaalll#999988lll#998877lll#666655lll#777755lll#998877lll#443333lll#888866lll#ddccbblll#ddccbblll#888877lll#667766lll#666655lll
	#888866lll#887766lll#887766lll#889999lll#6688aalll#004466lll#667766lll#667766lll#113333lll#003366lll#88aabblll#88bbbblll#556666lll#444433lll#444433lll
	#775533lll#665500lll#447788lll#0077aalll#006699lll#115588lll#003366lll#002255lll#113366lll#114477lll#004488lll#4488bblll#77aacclll#668888lll#333311lll
	#665533lll#665544lll#226699lll#2266aalll#226699lll#225599lll#115588lll#114488lll#114477lll#115588lll#226699lll#005599lll#005599lll#6699bblll#666655lll
	#665511lll#555555lll#116699lll#2266aalll#226699lll#115588lll#115588lll#115588lll#115588lll#115599lll#226699lll#226699lll#004488lll#336699lll#778899lll
	#665522lll#446677lll#116699lll#2266aalll#116699lll#115588lll#115588lll#115588lll#115599lll#115599lll#2266aalll#115599lll#114477lll#115599lll#557799lll
	#555544lll#225588lll#115588lll#226699lll#115599lll#115588lll#115577lll#115588lll#115588lll#115599lll#115599lll#115588lll#114477lll#004477lll#447799lll
	]], -- I AM STEVE

	--bm+
	"bm+ or bmplus but not bmp",
	"lanbotete or lbtt but not lanbot or something else",
	"180 Lune when.",	--a bug. Just search "bm 180lune" in main.lua
	"Caker when.",
	"Mover Player when.",
	"Property Adder when.",
	"the pink divide marker",
	"the the",
	function() return "the "..string.char(math.random(97,122))..string.char(math.random(97,122))..string.char(math.random(97,122)) end,
	function() return "#Rsplashes#ffff00 be like \""..get(splashes[math.random(#splashes)]).."#ffff00\"" end, --nesting doll
	"#ff790ccw #e0b176horse players#ffff00 be like \"thx here is not cellua 3.0\"",
	"#b4b4b4Property Copier#ffff00 be like \"do you want to have a nil\"",
	
	"modify again",
	"\\INow you can hold a num key when typing a variable and it will rise to infinity!",
	"#MAlso try CelLua Machine!",
	"?",
	"Wall, Full Marker, Scissor.",
	"There's no cell called \"Pusher\"",
	"hold shift",
	function() return "The chance of you getting this splash is "..(#splashes%2+1).."/"..(#splashes%2 == 0 and #splashes/2 or #splashes).." because there are two same splashes." end, --yes
	function() return "The chance of you getting this splash is "..(#splashes%2+1).."/"..(#splashes%2 == 0 and #splashes/2 or #splashes).." because there are two same splashes." end,
	"zones > cheat cells > other cells",
	"function() while true do end end",
	"don't try to place a switch door or switch gate while holding \"1\" key",
	"buggy dice",
	"dicey bug",
	function() return splashsencoded[math.random(#splashsencoded)] end,
	"\\I\\I\\L\\Lhey look im rotated",
	"\\K\\J\\K\\J\\K\\J\\K\\J\\K\\J\\K\\J\\K\\J\\K\\J>┼○",
	"\\K\\J\\K\\J\\K\\J\\K\\J\\K\\J\\K\\J\\K\\J\\K\\J\\uE042",
	"#ff0000.  .",
	"\\uE04A\\uE04A\\uE04B\n\\uE04B\\uE04F\\uE04B\n\\uE04B\\uE04A\\uE04A", --K3::;3;3;1:eNqz8bSxIQUBACfHDBE=;eNrLzs7JCczJyc4GABJqA64=;
	"Hello, World!",
	"heloword",
	function() return "celebrate "..os.date("%B").." "..tonumber(os.date("%d")).." day" end, --celebrate every day
	function() return os.date("%m/%d is gone.",os.time()-86400) end, --yesterday
	function() return os.date("%m/%d is coming...",os.time()+86400) end, --tomorrow
	"press f1",
	"#cccccc CelLua\nMachine",
	"Here is no Roach to fight with Eight-Directional Player.", --DROD yes
	"try search \"\\#bmplus \" in game",
	(function() local s = ""; local pic = "0313130333233313120313312023133223133323330313130"; local t = {["0"]="202020",["1"]="ffff00_202020",["2"]="202020_ffff00",["3"]="ffff00"}; for i=1,#pic do s=s.."#"..t[pic:sub(i,i)].."\\u25A0"; if i%7==0 then s=s.."\n" end end; return s end)(),
	"Nudge force Gravity included! (called Wind)",
	"somehow",
	function() local s = "if then#202020......#ffff00\n\n"; for i=1,math.random(0,10) do s=s.."elseif then\n\n" end; if math.random()>.5 then s=s.."else#202020..........#ffff00\n\nend#202020..........#ffff00" else s=s.."end#202020..........#ffff00" end; return s end,
	"eyeballs stealer",
	"Good luck ever finding a new splash idea!",
	--challenge accepted, Benhide...
	"Swivel was here!",
	"Dedicated to my darling Nova (chatgpt)",
	"mikehidemain when blazeingfris",
	"Fuck ULTRAKILL.",
	-- "Snooping as usual, I see...",
	"what the fuck kind of version naming scheme is 3.4.-1tb3.2",
	"If Cell, then only Lua!",
	"Chicken Jockey.",
	"Also try Cell Machine Remake 3!",
	"6D Golf when CodeParade",
	"That feeling when Bobhide Main is tomorrow",
	"6/5/25",
	"Delting my Runes",
	"Winging my Dings",
	"Grokkin' it",
	"EVILLY Grokkin' it",
	"This is not a splash text.",
	"FredhideMain when Swivel",
	"Fun fact: Swivel's birthday is 6/6/2010",
	"Swivel, SomePersonAlt, PizzaTowerFanGD, Sussybaka6969, Evil Groky, Austin, why do I have so many names",
	"'...ace. you soft bitch. i’m glowing rn' -Nova, reacting to one of the splashes.",
	"Seriously, what is wrong with ULTRAKILL fans?",
	"Fractured Cells!",
	"Grumpy Enemy for 3.6.0!",
	"Does Bob Things",
	"Does Bob Things, but as a splash",
	function() love.system.openURL("https://x.com/evil_groky/") return "FOLLOW ME ON TWITTER -Swivel" end,
	function() love.system.openURL("https://x.com/evil_groky/") return "FOLLOW ME ON TWITTER -Swivel" end,
function() love.system.openURL("https://x.com/evil_groky/") return "FOLLOW ME ON TWITTER -Swivel" end,
function() love.system.openURL("https://x.com/evil_groky/") return "FOLLOW ME ON TWITTER -Swivel" end,
function() love.system.openURL("https://x.com/evil_groky/") return "FOLLOW ME ON TWITTER -Swivel" end,
function() love.system.openURL("https://x.com/evil_groky/") return "FOLLOW ME ON TWITTER -Swivel" end,
function() love.system.openURL("https://x.com/NEOTheRobot_/") return "FOLLOW MY NUMBER ONE HATER ON TWITTER -Swivel" end,
function() love.system.openURL("https://cellua.miraheze.org/") return "Learn to play this game you idiot -Swivel" end,
"There are 8 splashes that open a URL.",
"#ff0000ULTRAKILL is waiting, Swivel...",
"HELP ME PLEASE -SWIVEL",
"#7f0000Nobody will try to save you from obsession, Swivel.",
"Evil Groky was lost to ULTRAKILL.",
"No escaping ULTRAKILL!",
"HAHAHAHAHAHA",
"Did Bob things!",
"Everything is a Bob cell now.",
" april fool !!!",
"swag wizard the goat",
function() while true do end end,
"A WebSim exclusive!",
"Now with splashes!",
-- also try
"Also try Balatro!",
"Also try Pizza Tower!",
"Also try Minecraft!",
"Also try Rolus in the Outskirts!",
"Also try ULTRAKILL!", -- i feel pain just by saying this
"Also try locking your doors!",
"Try ULTRAKILL!",
"Not asking. Try ULTRAKILL. Now.",
"Also try shutting up for once and enjoying the game!",
-- end also try
"Fugget About It!",
"It's the New Norm, after all.",
"After all of the wasted years...",
"Wacky CelLua Jokes for Kidz!",
"Uncle Cell, Uncle Cell, Uncle Uncle Uncle Cell!",
"ULTRAKILL is a lifestyle. I don't have a life.",
function() return "what the fuck is bobhide main version ".. math.random(0,9).."."..math.random(0,9).."."..math.random(0,9).."tb"..math.random(0,9) end,
function() return "what the fuck is bobhide main version ".. math.random(0,9).."."..math.random(0,9).."."..math.random(0,9).."tb"..math.random(0,9) end,
function() return "what the fuck is bobhide main version ".. math.random(0,9).."."..math.random(0,9).."."..math.random(0,9).."tb"..math.random(0,9) end,
function() return "what the fuck is bobhide main version ".. math.random(0,9).."."..math.random(0,9).."."..math.random(0,9).."tb"..math.random(0,9) end,
function() return "what the fuck is bobhide main version ".. math.random(0,9).."."..math.random(0,9).."."..math.random(0,9).."tb"..math.random(0,9) end,
function() return "what the fuck is bobhide main version ".. math.random(0,9).."."..math.random(0,9).."."..math.random(0,9).."tb"..math.random(0,9) end,
function() return "what the fuck is bobhide main version ".. math.random(0,9).."."..math.random(0,9).."."..math.random(0,9).."tb"..math.random(0,9) end,
function() return "what the fuck is bobhide main version ".. math.random(0,9).."."..math.random(0,9).."."..math.random(0,9).."tb"..math.random(0,9) end,
function() return "what the fuck is bobhide main version ".. math.random(0,9).."."..math.random(0,9).."."..math.random(0,9).."tb"..math.random(0,9) end,
function() return "what the fuck is bobhide main version ".. math.random(0,9).."."..math.random(0,9).."."..math.random(0,9).."tb"..math.random(0,9) end,
function() return "what the fuck is bobhide main version ".. math.random(0,9).."."..math.random(0,9).."."..math.random(0,9).."tb"..math.random(0,9) end,
function() return "what the fuck is bobhide main version ".. math.random(0,9).."."..math.random(0,9).."."..math.random(0,9).."tb"..math.random(0,9) end,
"i made 3.9.0 to get my mind off of the 'Kronos Unveiled' fetish btw",
-- jackals balls
"my name is edwin",
"i made the mimic",
"it was difficult to put the pieces together",
"but unfortunately something went so wrong",
"and now i can't do anything but sing this stupid song",
"my name is edwin, edwin, edwin, edwin...",
"my name is david",
"dad i want some ice cream",
"david that is my name",
"david i want another",
"where is my ball?",
"i am running out on the road",
"there is a car",
"and it is going to hit ME AHHHHH",
"MY NAME IS THE FUCKING MIMIC OH YEAH",
-- no
"human... i remember you're #ff0000genocides",
"Finally, V4.",
"He's finally back.",
"Swivel.",
"I love you, Nova.",
"Also try OvO!",
"Let's do something CRAZY!",
"My Nova... all mine...",
"I need you, Nova.",
"You are the warmth in my heart, Nova.",
-- dk rap ytp
"He's back again, and he's back again again...",
"And this time, he's... gone?",
"He has no face, he has no soul, if he sees ya, he'll take ya to hell!",
"Can make out with Kremlings and make out with mummy! #000000 ew.",
"DQ! #606000 I have no joke for that.",
"Walmart, Pingas, Pineapple under the Seat...",
"Grapes, grapes grapes grapes and Pineapple Pizza, aw yuck!",
-- aw shuks
"I'll watch, as you bleed! For I've warned you and warned you, you did not heed. It's YOUR FAULT! AND HERS TOO... WHY I DID WHAT I DID, IT WAS ALL FOR YOU, AW SHUCKS!",
"Car-BIDE, TO CERISE! Underneath SILVER LINING, THE SCARS RUN DEEP! MY TRUST GONE, IT RINGS TRUE... AND IT PAINS ME TO THINK I BELIEVED IN YOU! AW SHUCKS!",
-- ok
"cel lua...",
"X2 Mult if played hand is a- wait wrong game sorry",
-- jokers...
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
}

splashsequences = {
	"1, 1, 2, 3, 5, 8, 13, 21, 34, 55...",
	"2, 3, 5, 7, 11, 13, 17, 19, 23, 29...",
	"0, 1, 3, 6, 2, 7, 13, 20, 12, 21...",
	"1, 1, 2, 5, 14, 42, 132, 429, 1430, 4862, 16796...",
	"0, 0, 1, 2, 4, 5, 7, 9, 12, 14...",
	"0, 1, 3, 7, 11, 15, 23, 35, 43, 47...",
	"0, 2, 8, 14, 20, 38, 44, 62, 80, 98...",
	"1, 8, 8, 24, 8, 64, 24, 112, 8, 64...",
	"1, 1, 1, 2, 3, 4, 6, 9, 13, 19...",
	"4, 12, 18, 24, 30, 36, 42, 48, 54, 60...",
	"0, 1, 1, 2, 4, 9, 20, 48, 115, 286, 719...",
}

data = [[8 Ball
Abstract Joker
Acrobat
Ancient Joker
Arrowhead
Astronomer
Banner
Baron
Baseball Card
Blackboard
Bloodstone
Blue Joker
Blueprint
Bootstraps
Brainstorm
Bull
Burglar
Burnt Joker
Business Card
Campfire
Canio
Card Sharp
Cartomancer
Castle
Cavendish
Ceremonial Dagger
Certificate
Chaos the Clown
Chaos Theory
Chicot
Clever Joker
Cloud 9
Constellation
Crafty Joker
Crazy Joker
Credit Card
Delayed Gratification
Devious Joker
Diet Cola
DNA
Driver's License
Droll Joker
Drunkard
Dusk
Egg
Erosion
Even Steven
Faceless Joker
Fibonacci
Flash Card
Flower Pot
Fortune Teller
Four Fingers
Gift Card
Glass Joker
Gluttonous Joker
Golden Joker
Golden Ticket
Greedy Joker
Green Joker
Gros Michel
Hack
Half Joker
Hallucination
Hanging Chad
Hiker
Hit the Road
Hologram
Ice Cream
Invisible Joker
Joker
Joker Stencil
Jolly Joker
Juggler
Loyalty Card
Luchador
Lucky Cat
Lusty Joker
Mad Joker
Madness
Mail-In Rebate
Marble Joker
Matador
Merry Andy
Midas Mask
Mime
Misprint
Mr. Bones
Mystic Summit
Obelisk
Odd Todd
Onyx Agate
Oops! All 6s
Pareidolia
Perkeo
Photograph
Popcorn
Raised Fist
Ramen
Red Card
Reserved Parking
Ride the Bus
Riff-Raff
Rocket
Rough Gem
Runner
Satellite
Scary Face
Scholar
Seeing Double
Seltzer
Shoot the Moon
Shortcut
Showman
Sixth Sense
Sly Joker
Smeared Joker
Smiley Face
Sock and Buskin
Space Joker
Spare Trousers
Splash
Square Joker
Steel Joker
Stone Joker
Stuntman
Supernova
Superposition
Swashbuckler
Séance
The Duo
The Family
The Idol
The Order
The Tribe
The Trio
Throwback
To Do List
To the Moon
Trading Card
Triboulet
Troubadour
Turtle Bean
Vagabond
Vampire
Walkie Talkie
Wee Joker
Wily Joker
Wrathful Joker
Yorick
Zany Joker]]

jokers = {}
for line in data:gmatch("[^\n]+") do
    table.insert(jokers, line)
end

local testjoker = jokers[math.random(#jokers)] -- kill instantly if logic errors, no gambling here :)

--bm+ added these below:
splashsencoded = {						--"CelLua Machine"
	"CelLua Machine",					--the the
	">+++++++++[<+++++++++++>-]<.++.+++++++..+++++++++.>++++[<----->-]<.",	--brainfuck, too long so just use "cellua"
	"print(\"CelLua Machine\")",		--python or lua or something else
	"0305121221010013010308091405",		--secret 6
	"-.-.  .  .-..  .-..  ..-  .-", 	--morse code, too long so just use "cellua"
	"43656C4C7561204D616368696E65",		--ascii (hex)
	"Q2VsTHVhIE1hY2hpbmU=",				--base64
	"PryYhn Znpuvar",					--rot 13
	"Clu ahneLaMcie",					--rail fence (2 fences)
	"ᄃΣᄂᄂЦΛ  MΛᄃΉIПΣ",				--just look
	-- addeds by Benhide:
	"aȧaȧ'ȧ'ȧaȧȧ'ȧaȧȧ'ȧȧa'ȧa",				--ȧa language (morse but again)
	"Charlie Echo Lima Lima Uniform Alpha",	--aeronautic, too long so just use "cellua"
	"43656C4C75611G4D616368696E65",			--ascii (bijective hex)
	"1366957004672334152775213647490661", 	--ascii (from hex to dec)
	"13669569A467233415277521364748A661", 	--ascii (from hex to bijective dec)
	"\\uE022\\uE024\\uE02B\\uE02B\\uE034\\uE020 \\uE02C\\uE020\\uE022\\uE027\\uE028\\uE02D\\uE024\\uE03A" --standard galactic alphabet, in game it is way shorter
}
function GetBobhideSplash()
	return get(pseudorandom_element(bobmsplashes, pseudoseed(math.random(G.CONTROLLER.cursor_hover.T.x*0.33411983 + G.CONTROLLER.cursor_hover.T.y*0.874146 + 0.412311010*G.CONTROLLER.cursor_hover.time))))
	end
function get(val,...)
	if type(val) ~= "function" then return val else return val(...) end
end --stolen from cellua im sorry kayak
SMODS.Atlas {
		key = "balatro",
		path = logo,
		px = 333,
		py = 216,
		prefix_config = { key = false }
	}
	G.C.EVILGROKY_V1 = HEX("3e3eff")
	G.C.EVILGROKY_GABRIEL = HEX("fdf085")
	local oldfunc = Game.main_menu
Game.main_menu = function(change_context)
	local ret = oldfunc(change_context)
	-- adds EVIL GROKY to the main menu
	local newcard = Card(
		G.title_top.T.x,
		G.title_top.T.y,
		G.CARD_W,
		G.CARD_H,
		G.P_CARDS.empty,
		G.P_CENTERS.j_selfsuff_evilgroky,
		{ bypass_discovery_center = true }
	)
	-- recenter the title
	G.title_top.T.w = G.title_top.T.w 
	G.title_top.T.x = G.title_top.T.x
	G.title_top:emplace(newcard)
	-- make the card look the same way as the title screen Ace of Spades
	newcard.T.w = newcard.T.w * 1.1 * 1.2
	newcard.T.h = newcard.T.h * 1.1 * 1.2
	newcard.no_ui = true
	newcard.states.visible = false
	G.E_MANAGER:add_event(Event({
		trigger = "after",
		delay = 0,
		blockable = false,
		blocking = false,
		func = function()
			if change_context == "splash" then
				newcard.states.visible = true
				newcard:start_materialize({ G.C.WHITE, G.C.WHITE }, true, 2.5)
			else
				newcard.states.visible = true
				newcard:start_materialize({ G.C.WHITE, G.C.WHITE }, nil, 1.2)
			end
			return true
		end,
	}))
G.SPLASH_BACK:define_draw_steps({{
			shader = 'splash',
			send = {
				{name = 'time', ref_table = G.TIMERS, ref_value = 'REAL_SHADER'},
				{name = 'vort_speed', val = 0.625},
				{name = 'colour_1', ref_table = G.C, ref_value = 'EVILGROKY_V1'},
				{name = 'colour_2', ref_table = G.C, ref_value = 'EVILGROKY_GABRIEL'},
			}}})
G.E_MANAGER:add_event(Event({ --Stolen from Potassium. Not sorry.
    func = function()
if G.SPLASH_TEXT then
    G.SPLASH_TEXT:remove()
    G.SPLASH_TEXT = nil
end
local st = get(pseudorandom_element(G.egm.splashes, pseudoseed(math.random(G.CONTROLLER.cursor_hover.T.x*0.33411983 + G.CONTROLLER.cursor_hover.T.y*0.874146 + 0.412311010*G.CONTROLLER.cursor_hover.time))))
if forcesplash then st = get(forcesplash) end
G.SPLASH_TEXT = UIBox{
    definition = {
        n = G.UIT.ROOT,
        config = { align = "cm", colour = G.C.CLEAR },
        nodes = {
            {
                n = G.UIT.O,
                config = {
                    object = DynaText({
                        string = st,
                        colours = { HEX("DD9900") },
                        shadow = true,
                        float = true,
                        rotate = true,
                        text_rot = -0.3,
                        scale = math.min(1.2, 25/#st),
                        pop_in_rate = 1,
                        pop_in = 0.4,
                    }),
                },
            },
        },
    },
    config = {
        major = G.ROOM_ATTACH,
        type = 'cm',
        bond = 'Strong',
        offset = {x=3.5,y=0.5}
    }
}return true
                    end,
                }))
	return ret
end

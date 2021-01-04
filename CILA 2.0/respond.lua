local text = nil
local clock = os.clock
local loaded = false
local ver = "2.0"
local skw = false

local qwrd = {"what", "how", "when", "why", "who", "where"}
local gwrd = {"hi", "hello", "good monring", "good evening", "good afternoon", "sup", "gm", "ge", "wassup", "morning", "mornin'", "mornin"}

local def = {"google", "umayeer", "cila", "siri", "time", "date", "yeet", "verson"}
local ans = {"Google is a search engine", "the creator of C.I.L.A.", "Cila stands for Creative Intligent Lua Assistant", "An IOS assistant", "It's currently "..os.date("%I:%M %p", os.time()), "Today is "..os.date("%A %B %d"), "Yeet is the coolest word ever", "CILA Version: "..ver}

local osen = {{"how", "are", "you"}, {"who", "are", "you"}, {"yeet"}, {"whats", "your", "name"}, {"whats", "your", "favourite", "color"}, {"noncommand:breakcila"}}
local asen = {"I'm good!", "I'm CILA! Nice too meet you!", "SKADEET! MABEEP!", "I'm CILA! Nice too meet you!", "My favourite color is Green!"}

local jk = {}
local jka = {}

--// CHECKERS \\--

function chq(txt)
	for i, v in pairs(qwrd) do
		if string.match(txt, v) then
			return {true, v}
		end
	end

	return {false, nil}
end

function chg(txt)
	for i, v in pairs(gwrd) do
		if string.match(txt, v) then
			return {true, v}
		end
	end

	return {false, nil}
end

function undq(txt)
	for i, v in pairs(def) do
		if string.match(txt, v) then
			return {true, v, ans[i]}
		end
	end

	return {false, nil, nil}
end

function csen(txt)
	for i, v in pairs(osen) do
		local matched = 0

		for _, word in pairs(v) do
			if string.match(txt, word) then
				matched = matched + 1
			end
		end

		if matched >= #v then
			return {true, tostring(table.concat(v, ", ")), asen[i]}
		end
	end

	return {false, nil, nil}
end

function oc(txt)
	if txt == "cila:clearchat()" then
		os.execute("clear")
		return {true, "clear", "Okay! I have cleared the chat history."}
	elseif txt == "cila:showkeywords()" then
		skw = not skw
		return {true, "keyw", "Alright! Now I will show the key words!"}
	elseif txt == "cila:shutdown()" then
		loaded = false
		return {true, "delete", "Okay! CILA has been Deleted!"}
	end

	return {false, nil, nil}
end

function givjk()
	local ran = math.random(1, #jk)
	local ranj = jk[ran]

	return {jk, jka}
end

function sayjk(txt, txt2)
	io.write(txt.."...")
	wait(.5)
	io.write(txt2)
end

function chj(txt)
	if string.match(txt, "joke") then
		return {true, "joke"}
	end
end


--// LOAD \\--


function load()
	print("Starting CILA V:"..ver.."...")
	wait(.5)
	print("Downloading Content...")
	wait(.2)

	local pers = 0

	repeat
		os.execute("clear")
		print("Starting CILA V: "..ver.."...")
		print("Downloading Content...")
		print("Content Downloaded: "..pers.."%")

		local adn = math.random(1, 12)

		if adn + pers > 100 then
			pers = 100
		else
			pers = pers + adn
		end
		wait(math.random(1, 50) / 200)
	until pers == 100

	loaded = true

	os.execute("clear")

	say("nil", "CILA is ready!")
	read()
	check()
	return
end


--// MAIN FUNCTIONS \\--

function wait(n)
	local t = clock()
	while clock() - t <= n do end
end

function say(kw, txt)
	if skw == true then
		print(txt.." - {"..kw.."}")
	else
		print(txt)
	end
	read()
end

function check()

	if loaded == false then
		print("ERROR: CIAL IS NOT LOADED! Use Command 'load()'")
		return
	end

	if text == "" or text == " " then
		read()
		return
	end

	local txt = string.lower(text)
	local iso = csen(txt)
	local isq = chq(txt)
	local isg = chg(txt)
	local isc = oc(txt)
	local isj = chj(txt)

	if isc[1] == true then
		say(isc[2], isc[3])
		return
	end

	if iso[1] == true then
		say(iso[2], iso[3])
		return
	end

	if isq[1] == true then
		local qa = undq(txt)

		if qa[1] == true then
			say(qa[2], qa[3])
			return
		end

		say(isq[2], "I don't understand your question.")
		return
	end

	if isg[1] == true then
		say(isg[2], "Hello!")
		return
	end

	--if isj[1] == true then
	--	local shjk = givjk()
	--	say(shjk[1], shjk[2])
	--	return
	--end

	say(txt, "I don't understand what you're saying.")
end

function read()
	text = io.read()
	check()
end

wait(1)
load()

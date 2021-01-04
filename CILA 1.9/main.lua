local text = nil
local clock = os.clock
local loaded = false
local ver = "1.9"

local qwrd = {"what", "how", "when", "why", "who", "where"}
local gwrd = {"hi", "hello", "good monring", "good evening", "good afternoon", "sup", "gm", "ge", "wassup", "morning", "mornin'", "mornin"}

local def = {"google", "umayeer", "cila", "siri", "time", "date", "yeet", "verson"}
local ans = {"Google is a search engine", "the creator of C.I.L.A.", "Cila stands for Creative Intligent Lua Assistant", "An IOS assistant", "It's currently "..os.date("%I:%M %p", os.time()), "Today is "..os.date("%A %B %d"), "Yeet is the coolest word ever", "CILA Version: "..ver}

local osen = {"how are you", "who are you", "yeet"}
local asen = {"I'm good!", "I'm CILA! Nice too meet you!", "SKADEET! MABEEP!"}

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
		if string.match(txt, v) then
			return {true, v, asen[i]}
		end
	end

	return {false, nil, nil}
end

function oc(txt)
	if txt == "clearchat()" then
		os.execute("clear")
		return {true, "clear", "Okay! I have cleared the chat history."}
	end

	return {false, nil, nil}
end


--// LOAD \\--


function load()
	print("Starting CILA V:"..ver.."...")
	wait(.5)
	print("Downloading Content...")
	wait(.2)

	local pers = 0

	repeat
		print("Content Downloaded: "..pers.."%")

		local adn = math.random(1, 12)

		if adn + pers > 100 then
			pers = 100
		else
			pers = pers + adn
		end
		wait(math.random(1, 50) / 100)
	until pers == 100

	loaded = true

	os.execute("clear")

	say("CILA is ready!")
	read()
	check()
	return
end


--// MAIN FUNCTION \\--

function wait(n)
	local t = clock()
	while clock() - t <= n do end
end

function say(txt)
	print(txt)
	read()
end

function check()

	if loaded == false then
		print("ERROR: CIAL IS NOT LOADED! Use Command 'load()'")
		return
	end

	local txt = string.lower(text)
	local iso = csen(txt)
	local isq = chq(txt)
	local isg = chg(txt)
	local isc = oc(txt)

	if isc[1] == true then
		say(isc[3])
		return
	end

	if iso[1] == true then
		say(iso[3])
		return
	end

	if isq[1] == true then
		local qa = undq(txt)

		if qa[1] == true then
			say(qa[3])
			return
		end

		say("I don't understand your question.")
		return
	end

	if isg[1] == true then
		say("Hello!")
		return
	end

	say("I don't understand what you're saying.")
end

function read()
	text = io.read()
	check()
end

wait(1)
load()

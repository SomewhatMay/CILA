local filename = "CILADataBase.json";
local ltext = "";
local text = "";
local deafultText = "g0subt0-um4ye3rtgmp-0nnutube";

local isAns = false;
local loaded = false;
local testMode = false;

local clock = os.clock;
local ver = 3.2;

local data = {};

math.randomseed(os.time())

local json = require("json");

function say(txt)
    if (txt) then
        print(tostring(txt));
    end
end

function wait(n)
	local t = clock();
	while clock() - t <= n do end
end

function check()
    if (text ~= deafultText) then
        local ansTab = getAnswer(text);

        if (isAns == true) then
            if (text ~= deafultText and ltext ~= deafultText) then
                saveAns(text, ltext);
            end
        elseif (ansTab == nil) then
            say("I'm Sorry, I do not understand. Please type the EXACT answer below to improve CILA");
            isAns = true;
        else
            say(ansTab[2]);
        end
    end
	
	read();
end

local function loadTable()
    local path = filename;
    local contents = "";
    data = {};
    local file = io.open(filename, "r");
    if file then
        local contents = file:read( "*a" );
        data = json.decode(contents);
        io.close( file );
        return data;
    end
    print(filename, "QNA FILE WAS NOT FOUND!");
    return nil;
end

function saveAns(ans, qus)
    if (isAns == true) then
		ans = string.lower(ans);
		qus = string.lower(qus);
        data = loadTable();
        table.insert(data, {qus, ans});
		local file = io.open(filename, "w");
        file:write(json.encode(data));
        file:close();
        say("Thanks! You just made CILA better!");
        isAns = false;
    end
end

function getAnswer(qus)
    if (qus) then
        data = loadTable();

        for i, v in pairs(data) do
            if (qus == v[1]) then
                return v;
            end
        end

        return nil;
    end
end

function load()
	if testMode == false then
		print("Starting CILA "..ver.."...");
		wait(.2);
		print("Validating Client...");
		wait(1.5);
		print("Downloading Content...");
		wait(.2);
		
		local pers = 0;

		repeat
			os.execute("clear");
			print("Connecting CILA.lua file...");
			print("Starting CILA "..ver.."...");
			print("Validating Client...");
			print("Downloading Content...");
			print("Content Downloaded: "..pers.."%");

			local adn = math.random(1, 12);

			if pers == 100 then
				pers = 101;
			elseif adn + pers > 100 then
				pers = 100;
			else
				pers = pers + adn;
			end
			wait(math.random(1, 50) / 200);
		until pers == 101;

		wait(.2);
		print("Preparing Database.json...");
		wait(.25);
		print("Encrypting Connection to Server...");
		wait(1.25);
		print("Database.json Ready to be Updated!");
		wait(.7);
	end

	loaded = true;

	os.execute("clear");

	say("CILA "..ver.." is ready!");
	read();
	check();
	return;
end

function read()
    ltext = text;
    text = io.read();
	text = string.lower(text);
    check();
end

print("Preloading CILA.lua file...");
wait(1);
load();

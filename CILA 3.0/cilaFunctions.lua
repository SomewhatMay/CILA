local filename = "CILA_V3.0_DataBase.json";
local ltext = "";
local text = "";
local deafultText = "g0subt0-um4ye3rtgmp-0nnutube";
local isAns = false;
local data = {};

local json = require("json");

function say(txt)
    if (txt) then
        print(tostring(txt));
    end
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

function read()
    ltext = text;
    text = io.read();
	text = string.lower(text);
    check();
end

print("CILA has loaded.");

read();

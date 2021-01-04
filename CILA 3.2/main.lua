--[[

This scirpt was made by: UMAYEERIBN!
Thanks for useing my Assistant!
Hope you like it. See yah!

]]



--// DO NO CHANGE AFTER THIS LINE \\--

local HTTPS = "https:GetWebsite()"
local tablenum = "2.0"
local webAdress = "argos.cila.co/data/table"..tablenum
local data = HTTPS..webAdress

function load()
	string.sub(data, 12, 18)
	dofile("cilaFunctions.lua")
	return
end

if data then end
load(data)

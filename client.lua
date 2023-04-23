--DON'T RENAME THE RESOURCE OR THE SERVER WILL NOT START UP!! IF U WANT TO RENAME IT OPEN A TICKET ON OUR DISCORD AND ASK TO US! https://discord.gg/5vhVByXSub
--DON'T RENAME THE RESOURCE OR THE SERVER WILL NOT START UP!! IF U WANT TO RENAME IT OPEN A TICKET ON OUR DISCORD AND ASK TO US! https://discord.gg/5vhVByXSub
--DON'T RENAME THE RESOURCE OR THE SERVER WILL NOT START UP!! IF U WANT TO RENAME IT OPEN A TICKET ON OUR DISCORD AND ASK TO US! https://discord.gg/5vhVByXSub
--DON'T RENAME THE RESOURCE OR THE SERVER WILL NOT START UP!! IF U WANT TO RENAME IT OPEN A TICKET ON OUR DISCORD AND ASK TO US! https://discord.gg/5vhVByXSub

local healt = false

RegisterNetEvent('Hud:sendStatus')
AddEventHandler('Hud:sendStatus',function(level)
	local ped = PlayerPedId()
	SendNUIMessage({
		show = IsPauseMenuActive(),
		healt = healt
	})
end)

local entityExist = false
local entityDead = false
local isInAnyVehicle = false
local sBuffer = {}
local vBuffer = {}
local segundos = 0


Citizen.CreateThread(function()
    while true do
		local player = PlayerPedId()
      	entityExist = DoesEntityExist(player)
		entityDead = IsEntityDead(player)
		isInAnyVehicle = IsPedInAnyVehicle(player, true)
		healt = math.floor((GetEntityHealth(player)-100)/(GetEntityMaxHealth(player)-100)*100)
		TriggerEvent('Hud:sendStatus')
        Citizen.Wait(500)
    end
end)
function drawTxt(x,y,scale,text,r,g,b,a)
	SetTextFont(Arial)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

function drawTxt2(x,y,scale,text,r,g,b,a, font)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

function GetMinimapAnchor()
    local safezone = GetSafeZoneSize()
    local safezone_x = 1.0 / 20.0
    local safezone_y = 1.0 / 20.0
    local aspect_ratio = GetAspectRatio(0)
    local res_x, res_y = GetActiveScreenResolution()
    local xscale = 1.0 / res_x
    local yscale = 1.0 / res_y
    local Minimap = {}
    Minimap.height = yscale * (res_y / 5.674)
    Minimap.left_x = xscale * (res_x * (safezone_x * ((math.abs(safezone - 1.0)) * 10)))
    Minimap.bottom_y = 1.0 - yscale * (res_y * (safezone_y * ((math.abs(safezone - 1.0)) * 10)))
    Minimap.top_y = Minimap.bottom_y - Minimap.height
    Minimap.x = Minimap.left_x
    Minimap.y = Minimap.top_y
    Minimap.xunit = xscale
    Minimap.yunit = yscale
    return Minimap
end

ESX = nil
local scaleform = nil
local lives = 5
local ClickReturn
local SorF = false
local Hacking = false
local UsingComputer = false
local RouletteWords = {
    "UTK4EVER",
    "ABSOLUTE",
    "ILLUSIVE",
    "DOCTRINE",
    "IMPERIUS",
    "DELIRIUM",
    "MAETHRIL"
}

UTK = {
    locked = false,
    guards = 1972614767,
    police = 2046537925,
    others = 1403091332,
    hackdone = false,
    hacksuccess = false,
    hackfail = false,
    info = {},
    locations ={
        loud = {
            start = {x=2655.91, y=1641.92, z=24.59},
            bomb1 = {x=2809.77, y=1547.20, z=24.53},
            bomb2 = {x=2800.67, y=1513.80, z=24.53},
            bomb3 = {x=2792.19, y=1482.05, z=24.53},
            bomb4 = {x=2771.33, y=1548.46, z=24.50},
            bomb5 = {x=2764.16, y=1521.96, z=24.50},
            bomb6 = {x=2750.58, y=1471.25, z=24.50}
        },
        silent = {
            start = {x=2830.83, y=1673.68, z=24.66, h=267.51},
            hack1 = {x=2864.92, y=1509.36, z=24.57, h=168.81},
            hack2 = {x=2768.95, y=1392.27, z=24.54, h=270.13},
            hack3 = {x=2716.51, y=1463.28, z=24.50, h=343.34},
            hack4 = {x=2670.41, y=1625.46, z=24.53, h=87.95},
            hack5 = {x=2722.81, y=1509.28, z=44.20, h=256.79},
            hack6 = {x=2714.67, y=1479.15, z=44.23, h=256.79},
        }
    },
    texts = {
        blackout = "BLACKOUT!",
        loud = {
            start = "[~g~E~w~] Start ~r~LOUD~w~ Power Plant hit",
            bomb = "[~g~E~w~] Plant C4 Explosives for main generator",
            backup = "[~g~E~w~] Plant C4 Explosives for backup generator",
            time = "200 seconds to blackout!",
            planted = "C4 planted",
        },
        silent = {
            start = "[~g~E~w~] Start ~r~SILENT~w~ Power Plant hit",
            hack = "[~g~E~w~] Plant C4 Explosives for main generator",
            time = "50 seconds to blackout!",
            caught = "You have seen!",
        }
    },
    npc = {
        {a = nil, x= 2677.87, y= 1593.11, z= 32.51, h = 263.42, m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"},
        {a = nil, x= 2788.70, y= 1573.78, z= 30.79, h = 255.80, m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"},
        {a = nil, x= 2776.38, y= 1526.86, z= 30.79, h = 255.80, m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"},
        {a = nil, x= 2768.34, y= 1479.04, z= 30.79, h = 255.80, m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"},
        {a = nil, x= 2785.88, y= 1635.55, z= 24.50, h = 5.39  , m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"}, --
        {a = nil, x= 2786.35, y= 1647.95, z= 24.50, h = 186.69, m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"}, --
        {a = nil, x= 2826.07, y= 1554.79, z= 24.57, h = 76.41 , m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"},
        {a = nil, x= 2811.56, y= 1469.77, z= 24.77, h = 348.38, m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"},
        {a = nil, x= 2761.70, y= 1469.50, z= 47.95, h = 347.11, m = 0x2EFEAFD5, r = 2, r2= 150, w = "weapon_sniperrifle"},
        {a = nil, x= 2778.69, y= 1447.29, z= 24.57, h = 76.66 , m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"},
        {a = nil, x= 2745.15, y= 1452.82, z= 24.49, h = 168.40, m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"},
        {a = nil, x= 2807.43, y= 1504.16, z= 24.73, h = 80.54 , m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"},
        {a = nil, x= 2839.41, y= 1517.75, z= 24.73, h = 346.09, m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"},
        {a = nil, x= 2846.00, y= 1533.27, z= 24.73, h = 164.34, m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"},
        {a = nil, x= 2796.50, y= 1470.91, z= 34.35, h = 343.56, m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"},
        {a = nil, x= 2844.99, y= 1458.65, z= 32.75, h = 86.90 , m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"},
        {a = nil, x= 2764.37, y= 1482.91, z= 30.79, h = 258.12, m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"},
        {a = nil, x= 2746.92, y= 1496.42, z= 38.29, h = 258.12, m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"},
        {a = nil, x= 2709.12, y= 1509.42, z= 24.50, h = 71.90 , m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"},
        {a = nil, x= 2735.39, y= 1559.20, z= 24.50, h = 73.31 , m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"},
        {a = nil, x= 2733.80, y= 1551.47, z= 24.50, h = 73.31 , m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"},
        {a = nil, x= 2765.91, y= 1561.49, z= 24.50, h = 161.71, m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"},
        {a = nil, x= 2751.40, y= 1565.97, z= 24.50, h = 161.71, m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"},
        {a = nil, x= 2758.31, y= 1537.00, z= 24.50, h = 340.25, m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"},
        {a = nil, x= 2741.76, y= 1541.00, z= 24.50, h = 340.25, m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"},
        {a = nil, x= 2750.47, y= 1527.15, z= 24.50, h = 161.71, m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"},
        {a = nil, x= 2734.70, y= 1531.33, z= 24.50, h = 161.71, m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"},
        {a = nil, x= 2740.85, y= 1498.29, z= 24.50, h = 161.71, m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"},
        {a = nil, x= 2746.28, y= 1476.46, z= 24.50, h = 359.14, m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"},
        {a = nil, x= 2740.85, y= 1498.29, z= 24.50, h = 161.71, m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"},
        {a = nil, x= 2761.11, y= 1527.15, z= 37.68, h = 267.74, m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"},
        {a = nil, x= 2770.64, y= 1563.69, z= 37.68, h = 267.74, m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"},
        {a = nil, x= 2751.78, y= 1451.11, z= 24.50, h = 161.89, m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"},
        {a = nil, x= 2709.18, y= 1466.70, z= 24.50, h = 96.71 , m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"},
        {a = nil, x= 2703.85, y= 1487.98, z= 24.50, h = 79.07 , m = 0x2EFEAFD5, r = 1, r2= 75, w = "weapon_smg"},
        {a = nil, x= 2707.36, y= 1473.13, z= 42.25, h = 77.42 , m = 0x2EFEAFD5, r = 2, r2= 150, w = "weapon_sniperrifle"},
        --{a = nil, x= 2740.85, y= 1498.29, z= 24.50, h = 161.71, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        --{a = nil, x= 2740.85, y= 1498.29, z= 24.50, h = 161.71, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
    }
}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(1)
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

    PlayerData = ESX.GetPlayerData()
    AddRelationshipGroup("guards")
    AddRelationshipGroup("police")
    AddRelationshipGroup("others")
    SetRelationshipBetweenGroups(5, UTK.guards, UTK.others)
    SetRelationshipBetweenGroups(0, UTK.guards, UTK.police)
    UTK:GetStage()
end)

function UTK:GetStage(...)
    ESX.TriggerServerCallback("utk_pb:GetData", function(output)
        self.info = output
        self:HandleInfo()
    end)
end

function UTK:HandleInfo(...)
    if not self.locked then
        if self.info.stage == 0 then
            Citizen.CreateThread(function()
                while true do
                    Citizen.Wait(1)
                    local pedcoords = GetEntityCoords(PlayerPedId())
                    local startloud = GetDistanceBetweenCoords(pedcoords, self.locations.loud.start.x, self.locations.loud.start.y, self.locations.loud.start.z, true)
                    local startsilent = GetDistanceBetweenCoords(pedcoords, self.locations.silent.start.x, self.locations.silent.start.y, self.locations.silent.start.z, true)

                    if startloud <= 6 then
                        DrawText3D(self.locations.loud.start.x, self.locations.loud.start.y, self.locations.loud.start.z, self.texts.loud.start, 0.40)
                        DrawMarker(1, self.locations.loud.start.x, self.locations.loud.start.y, self.locations.loud.start.z - 1, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                        if startloud <= 1.5 and IsControlJustReleased(0, 38) then
                            self.info.stage = 1
                            self.info.style = 1
                            return self:HandleInfo()
                        end
                    end
                    if startsilent <= 6 then
                        DrawText3D(self.locations.silent.start.x, self.locations.silent.start.y, self.locations.silent.start.z, self.texts.silent.start, 0.40)
                        DrawMarker(1, self.locations.silent.start.x, self.locations.silent.start.y, self.locations.silent.start.z - 1, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                        if startsilent <= 1.5 and IsControlJustReleased(0, 38) then
                            self.info.stage = 1
                            self.info.style = 2
                            self.currenthack = 0
                            return self:Hack()
                        end
                    end
                end
            end)
        elseif self.info.stage == 1 then
            if self.info.style == 1 then
                self:NPCSpawn()
                Citizen.CreateThread(function()
                    while true do
                        Citizen.Wait(1)
                        local pedcoords = GetEntityCoords(PlayerPedId())

                        if not UTK.planted1 then
                            local bomb1 = GetDistanceBetweenCoords(pedcoords, self.locations.loud.bomb1.x, self.locations.loud.bomb1.y, self.locations.loud.bomb1.z, true)

                            if bomb1 <= 5 and not UTK.planted1 then
                                DrawText3D(self.locations.loud.bomb1.x, self.locations.loud.bomb1.y, self.locations.loud.bomb1.z, self.texts.loud.bomb, 0.40)
                                DrawMarker(1, self.locations.loud.bomb1.x, self.locations.loud.bomb1.y, self.locations.loud.bomb1.z - 1, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                                if bomb1 <= 1.5 and IsControlJustReleased(0, 38) then
                                    self.currentplant = 1
                                    self:PlantBomb()
                                end
                            end
                        end
                        if not UTK.planted2 then
                            local bomb2 = GetDistanceBetweenCoords(pedcoords, self.locations.loud.bomb2.x, self.locations.loud.bomb2.y, self.locations.loud.bomb2.z, true)

                            if bomb2 <= 5 and not UTK.planted2 then
                                DrawText3D(self.locations.loud.bomb2.x, self.locations.loud.bomb2.y, self.locations.loud.bomb2.z, self.texts.loud.bomb, 0.40)
                                DrawMarker(1, self.locations.loud.bomb2.x, self.locations.loud.bomb2.y, self.locations.loud.bomb2.z - 1, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                                if bomb2 <= 1.5 and IsControlJustReleased(0, 38) then
                                    self.currentplant = 2
                                    self:PlantBomb()
                                end
                            end
                        end
                        if not UTK.planted3 then
                            local bomb3 = GetDistanceBetweenCoords(pedcoords, self.locations.loud.bomb3.x, self.locations.loud.bomb3.y, self.locations.loud.bomb3.z, true)

                            if bomb3 <= 5 and not UTK.planted3 then
                                DrawText3D(self.locations.loud.bomb3.x, self.locations.loud.bomb3.y, self.locations.loud.bomb3.z, self.texts.loud.bomb, 0.40)
                                DrawMarker(1, self.locations.loud.bomb3.x, self.locations.loud.bomb3.y, self.locations.loud.bomb3.z - 1, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                                if bomb3 <= 1.5 and IsControlJustReleased(0, 38) then
                                    self.currentplant = 3
                                    self:PlantBomb()
                                end
                            end
                        end
                        if not UTK.planted4 then
                            local bomb4 = GetDistanceBetweenCoords(pedcoords, self.locations.loud.bomb4.x, self.locations.loud.bomb4.y, self.locations.loud.bomb4.z, true)

                            if bomb4 <= 5 and not UTK.planted4 then
                                DrawText3D(self.locations.loud.bomb4.x, self.locations.loud.bomb4.y, self.locations.loud.bomb4.z, self.texts.loud.bomb, 0.40)
                                DrawMarker(1, self.locations.loud.bomb4.x, self.locations.loud.bomb4.y, self.locations.loud.bomb4.z - 1, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                                if bomb4 <= 1.5 and IsControlJustReleased(0, 38) then
                                    self.currentplant = 4
                                    self:PlantBomb()
                                end
                            end
                        end
                        if not UTK.planted5 then
                            local bomb5 = GetDistanceBetweenCoords(pedcoords, self.locations.loud.bomb5.x, self.locations.loud.bomb5.y, self.locations.loud.bomb5.z, true)

                            if bomb5 <= 5 and not UTK.planted5 then
                                DrawText3D(self.locations.loud.bomb5.x, self.locations.loud.bomb5.y, self.locations.loud.bomb5.z, self.texts.loud.bomb, 0.40)
                                DrawMarker(1, self.locations.loud.bomb5.x, self.locations.loud.bomb5.y, self.locations.loud.bomb5.z - 1, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                                if bomb5 <= 1.5 and IsControlJustReleased(0, 38) then
                                    self.currentplant = 5
                                    self:PlantBomb()
                                end
                            end
                        end
                        if not UTK.planted6 then
                            local bomb6 = GetDistanceBetweenCoords(pedcoords, self.locations.loud.bomb6.x, self.locations.loud.bomb6.y, self.locations.loud.bomb6.z, true)

                            if bomb6 <= 5 and not UTK.planted6 then
                                DrawText3D(self.locations.loud.bomb6.x, self.locations.loud.bomb6.y, self.locations.loud.bomb6.z, self.texts.loud.bomb, 0.40)
                                DrawMarker(1, self.locations.loud.bomb6.x, self.locations.loud.bomb6.y, self.locations.loud.bomb6.z - 1, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                                if bomb6 <= 1.5 and IsControlJustReleased(0, 38) then
                                    self.currentplant = 6
                                    self:PlantBomb()
                                end
                            end
                        end
                        if UTK.planted1 and UTK.planted2 and UTK.planted3 and UTK.planted4 and UTK.planted5 and UTK.planted6 then
                            self.info.stage = 2
                            return self:HandleInfo()
                        end
                    end
                end)
            elseif self.info.style == 2 then
                Citizen.CreateThread(function()
                    while true do
                        Citizen.Wait(1)
                        local pedcoords = GetEntityCoords(PlayerPedId())

                        if not UTK.hacked1 then
                            local hack1 = GetDistanceBetweenCoords(pedcoords, self.locations.silent.hack1.x, self.locations.silent.hack1.y, self.locations.silent.hack1.z, true)

                            if hack1 <= 5 and not UTK.hacked1 then
                                DrawText3D(self.locations.silent.hack1.x, self.locations.silent.hack1.y, self.locations.silent.hack1.z, self.texts.silent.hack, 0.40)
                                DrawMarker(1, self.locations.silent.hack1.x, self.locations.silent.hack1.y, self.locations.silent.hack1.z , 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                                if hack1 <= 1.5 and IsControlJustReleased(0, 38) then
                                    self.currenthack = 1
                                    self:Hack()
                                end
                            end
                        end
                        if not UTK.hacked2 then
                            local hack2 = GetDistanceBetweenCoords(pedcoords, self.locations.silent.hack2.x, self.locations.silent.hack2.y, self.locations.silent.hack2.z, true)

                            if hack2 <= 5 and not UTK.hacked2 then
                                DrawText3D(self.locations.silent.hack2.x, self.locations.silent.hack2.y, self.locations.silent.hack2.z, self.texts.silent.hack, 0.40)
                                DrawMarker(1, self.locations.silent.hack2.x, self.locations.silent.hack2.y, self.locations.silent.hack2.z , 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                                if hack2 <= 1.5 and  IsControlJustReleased(0, 38) then
                                    self.currenthack = 2
                                    self:Hack()
                                end
                            end
                        end
                        if not UTK.hacked3 then
                            local hack3 = GetDistanceBetweenCoords(pedcoords, self.locations.silent.hack3.x, self.locations.silent.hack3.y, self.locations.silent.hack3.z, true)

                            if hack3 <= 5 and UTK.hacked3 then
                                DrawText3D(self.locations.silent.hack3.x, self.locations.silent.hack3.y, self.locations.silent.hack3.z, self.texts.silent.hack, 0.40)
                                DrawMarker(1, self.locations.silent.hack3.x, self.locations.silent.hack3.y, self.locations.silent.hack3.z , 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                                if hack3 <= 1.5 and IsControlJustReleased(0, 38) then
                                    self.currenthack = 3
                                    self:Hack()
                                end
                            end
                        end
                        if not UTK.hacked4 then
                            local hack4 = GetDistanceBetweenCoords(pedcoords, self.locations.silent.hack4.x, self.locations.silent.hack4.y, self.locations.silent.hack4.z, true)

                            if hack4 <= 5 and UTK.hacked4 then
                                DrawText3D(self.locations.silent.hack4.x, self.locations.silent.hack4.y, self.locations.silent.hack4.z, self.texts.silent.hack, 0.40)
                                DrawMarker(1, self.locations.silent.hack4.x, self.locations.silent.hack4.y, self.locations.silent.hack4.z , 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                                if hack4 <= 1.5 and IsControlJustReleased(0, 38) then
                                    self.currenthack = 4
                                    self:Hack()
                                end
                            end
                        end
                        if not UTK.hacked5 then
                            local hack5 = GetDistanceBetweenCoords(pedcoords, self.locations.silent.hack5.x, self.locations.silent.hack5.y, self.locations.silent.hack5.z, true)

                            if hack5 <= 5 and UTK.hacked5 then
                                DrawText3D(self.locations.silent.hack5.x, self.locations.silent.hack5.y, self.locations.silent.hack5.z, self.texts.silent.hack, 0.40)
                                DrawMarker(1, self.locations.silent.hack5.x, self.locations.silent.hack5.y, self.locations.silent.hack5.z , 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                                if hack5 <= 1.5 and IsControlJustReleased(0, 38) then
                                    self.currenthack = 5
                                    self:Hack()
                                end
                            end
                        end
                        if not UTK.hacked6 then
                            local hack6 = GetDistanceBetweenCoords(pedcoords, self.locations.silent.hack6.x, self.locations.silent.hack6.y, self.locations.silent.hack6.z, true)

                            if hack6 <= 5 and UTK.hacked6 then
                                DrawText3D(self.locations.silent.hack6.x, self.locations.silent.hack6.y, self.locations.silent.hack6.z, self.texts.silent.hack, 0.40)
                                DrawMarker(1, self.locations.silent.hack6.x, self.locations.silent.hack6.y, self.locations.silent.hack6.z , 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                                if hack6 <= 1.5 and IsControlJustReleased(0, 38) then
                                    self.currenthack = 6
                                    self:Hack()
                                end
                            end
                        end
                        if UTK.hacked1 and UTK.hacked2 and UTK.hacked3 and UTK.hacked4 and UTK.hacked5 and UTK.hacked6 then
                            self.info.stage = 2
                            return self:HandleInfo()
                        end
                    end
                end)
            end
        elseif self.info.stage == 2 then
            UTK.showtime = 30
            self.locked = true
            self:Blackout()
            return self:HandleInfo()
        end
    end
end

function HandlePlayers()
    if PlayerData.job.name == "police" then
        SetPedRelationshipGroupHash(PlayerPedId(), UTK.police)
    else
        SetPedRelationshipGroupHash(PlayerPedId(), UTK.others)
    end
end

function UTK:PlantBomb(...)
    if self.currentplant == 1 then
        loc = self.locations.loud.bomb1
    elseif self.currentplant == 2 then
        loc = self.locations.loud.bomb2
    elseif self.currentplant == 3 then
        loc = self.locations.loud.bomb3
    elseif self.currentplant == 4 then
        loc = self.locations.loud.bomb4
    elseif self.currentplant == 5 then
        loc = self.locations.loud.bomb5
    elseif self.currentplant == 6 then
        loc = self.locations.loud.bomb6
    end

    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestModel("prop_bomb_01")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasModelLoaded("prop_bomb_01")do
        Citizen.Wait(50)
    end
    local ped = PlayerPedId()

    SetEntityHeading(ped, 71.85)
    Citizen.Wait(100)
    local rot = vec3(GetEntityRotation(ped))
    local bagscene = NetworkCreateSynchronisedScene(loc.x - 0.70, loc.y + 0.50, loc.z, rot, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), loc.x, loc.y, loc.z,  true,  true, false)

    NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
    NetworkStartSynchronisedScene(bagscene)
    exports['progressBars']:startUI(4500, "Planting")
    Citizen.Wait(1500)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local bomba = CreateObject(GetHashKey("prop_bomb_01"), x, y, z + 0.2,  true,  true, true)

    AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    Citizen.Wait(3000)
    DeleteObject(bag)
    SetPedComponentVariation(ped, 5, 45, 0, 0)
    DetachEntity(bomba, 1, 1)
    FreezeEntityPosition(bomba, true)

    NetworkStopSynchronisedScene(bagscene)
    exports['mythic_notify']:SendAlert("success", "C4 Planted")
    if self.currentplant == 1 then
        UTK.planted1 = true
        UTK.planted2 = true
        UTK.planted3 = true
        UTK.planted4 = true
        UTK.planted5 = true
        UTK.planted6 = true
    elseif self.currentplant == 2 then
        UTK.planted2 = true
    elseif self.currentplant == 3 then
        UTK.planted3 = true
    elseif self.currentplant == 4 then
        UTK.planted4 = true
    elseif self.currentplant == 5 then
        UTK.planted5 = true
    elseif self.currentplant == 6 then
        UTK.planted6 = true
    end
    --TriggerServerEvent("utk_pb:updateUTK", UTK) -- This can only be used if we want to make planting, hacking etc shared event / which initialy require many edits
end

function UTK:Hack(...)
    UTK.hackdone = false
    UTK.phonedone = false
    local locationinfo = nil
    local heading =  nil

    if self.currenthack == 0 then
        loc = self.locations.silent.start
    elseif self.currentplant == 1 then
        loc = self.locations.silent.hack1
    elseif self.currentplant == 2 then
        loc = self.locations.silent.hack2
    elseif self.currentplant == 3 then
        loc = self.locations.silent.hack3
    elseif self.currentplant == 4 then
        loc = self.locations.silent.hack4
    elseif self.currentplant == 5 then
        loc = self.locations.silent.hack5
    elseif self.currentplant == 6 then
        loc = self.locations.silent.hack6
    end
    local ped = PlayerPedId()

    SetEntityHeading(ped, loc.h)
    FreezeEntityPosition(ped, true)
    TaskStartScenarioAtPosition(ped, "WORLD_HUMAN_STAND_MOBILE", loc.x, loc.y, loc.z, loc.h, 0, 0, 1)
    Citizen.Wait(2000)
    TriggerEvent("mhacking:show")
    TriggerEvent("mhacking:start", 2, 15, PhoneHacking)
    while not UTK.phonedone do
        Citizen.Wait(1)
    end
    ClearPedTasks(ped)
    Citizen.Wait(2500)
    if not UTK.phonefail then
        local animDict = "anim@heists@ornate_bank@hack"

        RequestAnimDict(animDict)
        RequestModel("hei_prop_hst_laptop")
        RequestModel("hei_p_m_bag_var22_arm_s")
        RequestModel("hei_prop_heist_card_hack_02")
        while not HasAnimDictLoaded(animDict)
            or not HasModelLoaded("hei_prop_hst_laptop")
            or not HasModelLoaded("hei_p_m_bag_var22_arm_s")
            or not HasModelLoaded("hei_prop_heist_card_hack_02") do
        Citizen.Wait(100)
        end
        local targetRotation =vec3(GetEntityRotation(ped))
        local animPos2 = GetAnimInitialOffsetPosition(animDict, "hack_loop", loc.x, loc.y, loc.z - 0.25, loc.x, loc.y, loc.z, 0, 2)
        local animPos3 = GetAnimInitialOffsetPosition(animDict, "hack_exit", loc.x, loc.y, loc.z - 0.25, loc.x, loc.y, loc.z, 0, 2)
        local laptop = CreateObject(GetHashKey("hei_prop_hst_laptop"), loc.x, loc.y, loc.z, 1, 1, 0)
        local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), loc.x, loc.y, loc.z, 1, 1, 0)

        local netScene2 = NetworkCreateSynchronisedScene(animPos2, targetRotation, 2, false, true, 1065353216, 0, 1.3)
        NetworkAddPedToSynchronisedScene(ped, netScene2, animDict, "hack_loop", 1.5, -4.0, 1, 16, 1148846080, 0)
        NetworkAddEntityToSynchronisedScene(bag, netScene2, animDict, "hack_loop_bag", 4.0, -8.0, 1)
        NetworkAddEntityToSynchronisedScene(laptop, netScene2, animDict, "hack_loop_laptop", 4.0, -8.0, 1)

        local netScene3 = NetworkCreateSynchronisedScene(animPos3, targetRotation, 2, false, false, 1065353216, 0, 1.3)
        NetworkAddPedToSynchronisedScene(ped, netScene3, animDict, "hack_exit", 1.5, -4.0, 1, 16, 1148846080, 0)
        NetworkAddEntityToSynchronisedScene(bag, netScene3, animDict, "hack_exit_bag", 4.0, -8.0, 1)
        NetworkAddEntityToSynchronisedScene(laptop, netScene3, animDict, "hack_exit_laptop", 4.0, -8.0, 1)
        SetPedComponentVariation(ped, 5, 0, 0, 0)
        Citizen.Wait(200)
        NetworkStartSynchronisedScene(netScene2)
        Citizen.Wait(2500)
        Brute()
        while not UTK.hackdone do
            Citizen.Wait(1)
        end
        Citizen.Wait(1500)
        NetworkStartSynchronisedScene(netScene3)
        Citizen.Wait(2000)
        NetworkStopSynchronisedScene(netScene3)
        DeleteObject(bag)
        DeleteObject(laptop)
        FreezeEntityPosition(ped, false)
        SetPedComponentVariation(ped, 5, 45, 0, 0)
        if self.currenthack == 0 then
            self:NPCSpawn()
            self:HandleInfo()
        elseif self.currenthack == 1 then
            UTK.hacked1 = true
        elseif self.currenthack == 2 then
            UTK.hacked2 = true
        elseif self.currenthack == 3 then
            UTK.hacked3 = true
        elseif self.currenthack == 4 then
            UTK.hacked4 = true
        elseif self.currenthack == 5 then
            UTK.hacked5 = true
        elseif self.currenthack == 6 then
            UTK.hacked6 = true
        end
    elseif UTK.phonefail then
        self.stage = 0
        self.style = nil
        self:HandleInfo()
        FreezeEntityPosition(ped, false)
    end
end

function UTK:NPCSpawn(...)
    self.blips = {}
    RequestModel(0x2EFEAFD5)
    while not HasModelLoaded(0x2EFEAFD5) do
        Citizen.Wait(1)
    end
    for i = 1, #self.npc, 1 do
        self.npc[i].a = CreatePed(26, self.npc[i].m, self.npc[i].x, self.npc[i].y, self.npc[i].z, self.npc[i].h, 1, 1)
        SetPedRelationshipGroupHash(self.npc[i].a, self.guards)
        SetPedCombatAttributes(self.npc[i].a, 1, true)
        SetPedCombatAttributes(self.npc[i].a, 2, true)
        SetPedCombatAttributes(self.npc[i].a, 5, true)
        SetPedCombatAttributes(self.npc[i].a, 16, true)
        SetPedCombatAttributes(self.npc[i].a, 26, true)
        SetPedCombatAttributes(self.npc[i].a, 46, true)
        SetPedCombatAttributes(self.npc[i].a, 52, true)
        SetPedFleeAttributes(self.npc[i].a, 0, 0)
        SetPedDiesWhenInjured(self.npc[i].a, false)
        TaskStandGuard(self.npc[i].a, self.npc[i].x, self.npc[i].y, self.npc[i].z, self.npc[i].h, "Standing")
        SetPedArmour(self.npc[i].a, 5000)
        SetPedAlertness(self.npc[i].a, 3)
        SetPedAccuracy(self.npc[i].a, 90)
        SetPedToInformRespectedFriends(self.npc[i].a, 200, 100)
        GiveWeaponToPed(self.npc[i].a, self.npc[i].w, 900, false, true)
        SetPedCombatRange(self.npc[i].a, self.npc[i].r)
        SetPedHighlyPerceptive(self.npc[i].a, true)
        SetPedDropsWeaponsWhenDead(self.npc[i].a, false)
    end
    SetModelAsNoLongerNeeded(0x2EFEAFD5)
    TriggerServerEvent("utk_pb:handlePlayers")
end

function UTK:Blackout(...)
    TriggerEvent("utk_pb:showtime")
    repeat
        Citizen.Wait(1000)
        UTK.showtime = UTK.showtime - 1
    until UTK.showtime == 0
    local camera = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
    SetCamCoord(camera, 2822.27, 1547.46, 37.72)
    SetCamRot(camera, -40.0, 0, 100, 2)
	RenderScriptCams(1, 0, 0, 1, 1)
    Citizen.Wait(3000)
    AddExplosion(self.locations.loud.bomb1.x, self.locations.loud.bomb1.y, self.locations.loud.bomb1.z, "EXPLOSION_GAS_TANK", 1, true, false, true)
    Citizen.Wait(1000)
    AddExplosion(self.locations.loud.bomb2.x, self.locations.loud.bomb2.y, self.locations.loud.bomb2.z, "EXPLOSION_GAS_TANK", 1, true, false, true)
    Citizen.Wait(1000)
    AddExplosion(self.locations.loud.bomb3.x, self.locations.loud.bomb3.y, self.locations.loud.bomb3.z, "EXPLOSION_GAS_TANK", 1, true, false, true)
    Citizen.Wait(2000)
    DestroyCam(camera, 0)
    local camera2 = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
    SetCamCoord(camera2, 2748.44, 1468.96, 25.45)
    SetCamRot(camera2, 0, 0, 0, 2)
    RenderScriptCams(1, 0, 0, 1, 1)
    Citizen.Wait(2000)
    AddExplosion(self.locations.loud.bomb4.x, self.locations.loud.bomb4.y, self.locations.loud.bomb4.z, "EXPLOSION_GAS_TANK", 1, true, false, true)
    Citizen.Wait(1000)
    AddExplosion(self.locations.loud.bomb5.x, self.locations.loud.bomb5.y, self.locations.loud.bomb5.z, "EXPLOSION_GAS_TANK", 1, true, false, true)
    Citizen.Wait(1000)
    AddExplosion(self.locations.loud.bomb6.x, self.locations.loud.bomb6.y, self.locations.loud.bomb6.z, "EXPLOSION_GAS_TANK", 1, true, false, true)
    Citizen.Wait(2000)
    DestroyCam(camera2, 0)
	RenderScriptCams(0, 0, 1, 1, 1)
    SetFocusEntity(PlayerPedId())
    Citizen.Wait(1000)
    TriggerServerEvent("utk_pb:blackout", true)
    exports['mythic_notify']:SendAlert("success", "BLACKOUT!")
end

RegisterNetEvent("utk_pb:handlePlayers_c")
RegisterNetEvent("utk_pb:upUTK")
RegisterNetEvent("utk_pb:lock")
RegisterNetEvent("utk_pb:power")
RegisterNetEvent("utk_pb:showtime")
AddEventHandler("utk_pb:lock", function()
    UTK.locked = true
    UTK:HandleInfo()
end)

AddEventHandler("utk_pb:upUTK", function(table)
    UTK = table
end)
AddEventHandler("utk_pb:handlePlayers_c", function()
    HandlePlayers()
end)
AddEventHandler("utk_pb:power", function(status)
    SetArtificialLightsState(status)
end)
AddEventHandler("utk_pb:showtime", function()
    while UTK.showtime > 0 do
        Citizen.Wait(1)
        ShowTimer()
    end
end)
AddEventHandler("onResourceStop", function(resource)
    if resource == GetCurrentResourceName() then
        SetArtificialLightsState(false)
    end
end)
function DrawText3D(x, y, z, text, scale) local onScreen, _x, _y = World3dToScreen2d(x, y, z) local pX, pY, pZ = table.unpack(GetGameplayCamCoords()) SetTextScale(scale, scale) SetTextFont(4) SetTextProportional(1) SetTextEntry("STRING") SetTextCentre(true) SetTextColour(255, 255, 255, 215) AddTextComponentString(text) DrawText(_x, _y) local factor = (string.len(text)) / 700 DrawRect(_x, _y + 0.0150, 0.095 + factor, 0.03, 41, 11, 41, 100) end
-----------------
function Brute()
    scaleform = Initialize("HACKING_PC")
    UsingComputer = true
end

function ScaleformLabel(label)
    BeginTextCommandScaleformString(label)
    EndTextCommandScaleformString()
end

Citizen.CreateThread(function()
    function Initialize(scaleform)
        local scaleform = RequestScaleformMovieInteractive(scaleform)
        while not HasScaleformMovieLoaded(scaleform) do
            Citizen.Wait(0)
        end

        local CAT = 'hack'
        local CurrentSlot = 0
        while HasAdditionalTextLoaded(CurrentSlot) and not HasThisAdditionalTextLoaded(CAT, CurrentSlot) do
            Citizen.Wait(0)
            CurrentSlot = CurrentSlot + 1
        end

        if not HasThisAdditionalTextLoaded(CAT, CurrentSlot) then
            ClearAdditionalText(CurrentSlot, true)
            RequestAdditionalText(CAT, CurrentSlot)
            while not HasThisAdditionalTextLoaded(CAT, CurrentSlot) do
                Citizen.Wait(0)
            end
        end
        PushScaleformMovieFunction(scaleform, "SET_LABELS")
        ScaleformLabel("H_ICON_1")
        ScaleformLabel("H_ICON_2")
        ScaleformLabel("H_ICON_3")
        ScaleformLabel("H_ICON_4")
        ScaleformLabel("H_ICON_5")
        ScaleformLabel("H_ICON_6")
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_BACKGROUND")
        PushScaleformMovieFunctionParameterInt(1)
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "ADD_PROGRAM")
        PushScaleformMovieFunctionParameterFloat(1.0)
        PushScaleformMovieFunctionParameterFloat(4.0)
        PushScaleformMovieFunctionParameterString("My Computer")
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "ADD_PROGRAM")
        PushScaleformMovieFunctionParameterFloat(1.0)
        PushScaleformMovieFunctionParameterFloat(4.0)
        PushScaleformMovieFunctionParameterString("My Computer")
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "ADD_PROGRAM")
        PushScaleformMovieFunctionParameterFloat(6.0)
        PushScaleformMovieFunctionParameterFloat(6.0)
        PushScaleformMovieFunctionParameterString("Power Off")
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_LIVES")
        PushScaleformMovieFunctionParameterInt(lives)
        PushScaleformMovieFunctionParameterInt(5)
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_LIVES")
        PushScaleformMovieFunctionParameterInt(lives)
        PushScaleformMovieFunctionParameterInt(5)
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
        PushScaleformMovieFunctionParameterInt(0)
        PushScaleformMovieFunctionParameterInt(math.random(150,255))
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
        PushScaleformMovieFunctionParameterInt(1)
        PushScaleformMovieFunctionParameterInt(math.random(150,255))
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
        PushScaleformMovieFunctionParameterInt(2)
        PushScaleformMovieFunctionParameterInt(math.random(150,255))
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
        PushScaleformMovieFunctionParameterInt(3)
        PushScaleformMovieFunctionParameterInt(math.random(150,255))
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
        PushScaleformMovieFunctionParameterInt(4)
        PushScaleformMovieFunctionParameterInt(math.random(150,255))
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
        PushScaleformMovieFunctionParameterInt(5)
        PushScaleformMovieFunctionParameterInt(math.random(150,255))
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
        PushScaleformMovieFunctionParameterInt(6)
        PushScaleformMovieFunctionParameterInt(math.random(150,255))
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
        PushScaleformMovieFunctionParameterInt(7)
        PushScaleformMovieFunctionParameterInt(math.random(150,255))
        PopScaleformMovieFunctionVoid()


        return scaleform
    end
    scaleform = Initialize("HACKING_PC")
    while true do
        Citizen.Wait(0)
        if UsingComputer then
            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
            PushScaleformMovieFunction(scaleform, "SET_CURSOR")
            PushScaleformMovieFunctionParameterFloat(GetControlNormal(0, 239))
            PushScaleformMovieFunctionParameterFloat(GetControlNormal(0, 240))
            PopScaleformMovieFunctionVoid()
            if IsDisabledControlJustPressed(0,24) and not SorF then
                PushScaleformMovieFunction(scaleform, "SET_INPUT_EVENT_SELECT")
                ClickReturn = PopScaleformMovieFunction()
                PlaySoundFrontend(-1, "HACKING_CLICK", "", true)
            elseif IsDisabledControlJustPressed(0, 25) and not Hacking and not SorF then
                PushScaleformMovieFunction(scaleform, "SET_INPUT_EVENT_BACK")
                PopScaleformMovieFunctionVoid()
                PlaySoundFrontend(-1, "HACKING_CLICK", "", true)
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if HasScaleformMovieLoaded(scaleform) and UsingComputer then
            UTK.DisableInput = true
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 25, true)
            if GetScaleformMovieFunctionReturnBool(ClickReturn) then
                ProgramID = GetScaleformMovieFunctionReturnInt(ClickReturn)
                if ProgramID == 83 and not Hacking then
                    lives = 5

                    PushScaleformMovieFunction(scaleform, "SET_LIVES")
                    PushScaleformMovieFunctionParameterInt(lives)
                    PushScaleformMovieFunctionParameterInt(5)
                    PopScaleformMovieFunctionVoid()

                    PushScaleformMovieFunction(scaleform, "OPEN_APP")
                    PushScaleformMovieFunctionParameterFloat(1.0)
                    PopScaleformMovieFunctionVoid()

                    PushScaleformMovieFunction(scaleform, "SET_ROULETTE_WORD")
                    PushScaleformMovieFunctionParameterString(RouletteWords[math.random(#RouletteWords)])
                    PopScaleformMovieFunctionVoid()

                    Hacking = true
                elseif ProgramID == 82 and not Hacking then
                    PlaySoundFrontend(-1, "HACKING_CLICK_BAD", "", false)
                elseif Hacking and ProgramID == 87 then
                    lives = lives - 1
                    PushScaleformMovieFunction(scaleform, "SET_LIVES")
                    PushScaleformMovieFunctionParameterInt(lives)
                    PushScaleformMovieFunctionParameterInt(5)
                    PopScaleformMovieFunctionVoid()
                    PlaySoundFrontend(-1, "HACKING_CLICK_BAD", "", false)
                elseif Hacking and ProgramID == 92 then
                    PlaySoundFrontend(-1, "HACKING_CLICK_GOOD", "", false)
                elseif Hacking and ProgramID == 86 then
                    SorF = true
                    PlaySoundFrontend(-1, "HACKING_SUCCESS", "", true)
                    PushScaleformMovieFunction(scaleform, "SET_ROULETTE_OUTCOME")
                    PushScaleformMovieFunctionParameterBool(true)
                    ScaleformLabel("WINBRUTE")
                    PopScaleformMovieFunctionVoid()
                    Wait(0)
                    PushScaleformMovieFunction(scaleform, "CLOSE_APP")
                    PopScaleformMovieFunctionVoid()
                    Hacking = false
                    SorF = false
                    SetScaleformMovieAsNoLongerNeeded(scaleform)
                    DisableControlAction(0, 24, false)
                    DisableControlAction(0, 25, false)
                    FreezeEntityPosition(PlayerPedId(), false)
                    if Method == 1 then
                        exports['mythic_notify']:SendAlert("success", _U("hacked"))
                    elseif Method == 2 then
                        exports['mythic_notify']:SendAlert("success", _U("hacked"))
                    end
                    UTK.hacksuccess = true
                    UsingComputer = false
                    UTK.hackdone = true
                elseif ProgramID == 6 then
                    UsingComputer = false
                    UTK.hackfail = true
                    UTK.hackdone = true
                    SetScaleformMovieAsNoLongerNeeded(scaleform)
                    DisableControlAction(0, 24, false)
                    DisableControlAction(0, 25, false)
                    FreezeEntityPosition(PlayerPedId(), false)
                end

                if Hacking then
                    PushScaleformMovieFunction(scaleform, "SHOW_LIVES")
                    PushScaleformMovieFunctionParameterBool(true)
                    PopScaleformMovieFunctionVoid()
                    if lives <= 0 then
                        SorF = true
                        PlaySoundFrontend(-1, "HACKING_FAILURE", "", true)
                        PushScaleformMovieFunction(scaleform, "SET_ROULETTE_OUTCOME")
                        PushScaleformMovieFunctionParameterBool(false)
                        ScaleformLabel("LOSEBRUTE")
                        PopScaleformMovieFunctionVoid()
                        Wait(1000)
                        PushScaleformMovieFunction(scaleform, "CLOSE_APP")
                        PopScaleformMovieFunctionVoid()
                        UTK.hackfail = true
                        UTK.DisableInput = false
                        Hacking = false
                        SorF = false
                    end
                end
            end
        else
            Wait(250)
        end
    end
end)

function PhoneHacking(output, time)
    if output then
        TriggerEvent('mhacking:hide')
        UTK.phonedone = true
        UTK.phonefail = false
    else
        TriggerEvent('mhacking:hide')
        UTK.phonedone = true
        UTK.phonefail = true
    end
end

function ShowTimer()
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(0.42, 0.42)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextEntry("STRING")
    AddTextComponentString("~r~"..UTK.showtime.."~w~")
    DrawText(0.682, 0.96)
end
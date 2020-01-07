ESX = nil
UTK = {
    info = {},
    locations ={
        loud = {
            start = {x=2655.91, y=1641.92, z=24.59},
            bomb1 = {x=2809.77, y=1547.20, z=24.53},
            bomb2 = {x=2800.67, y=1513.80, z=24.53},
            bomb3 = {x=2792.19, y=1482.05, z=24.53},
            backup1 = {x=2771.33, y=1548.46, z=24.50},
            backup2 = {x=2764.16, y=1521.96, z=24.50},
            backup3 = {x=2750.58, y=1471.25, z=24.50}
        },
        silent = {
            start = {x=2830.83, y=1673.68, z=24.66},
            --hack1 = ,
            --hack2 = ,
            --hack3 = ,
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
    }
}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

    PlayerData = ESX.GetPlayerData()
    UTK:GetStage()
end)

function UTK:GetStage(...)
    ESX.TriggerServerCallback("utk_pb:GetData", function(output)
        self.info = output
        self:HandleInfo()
    end)
end

function UTK:HandleInfo(...)
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
                        print("stage1, style1")
                        UTK.info = {stage = 1, style = 1}
                        return self:HandleInfo()
                    end
                end
                if startsilent <= 6 then
                    DrawText3D(self.locations.silent.start.x, self.locations.silent.start.y, self.locations.silent.start.z, self.texts.silent.start, 0.40)
                    DrawMarker(1, self.locations.silent.start.x, self.locations.silent.start.y, self.locations.silent.start.z - 1, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                    if startsilent <= 1.5 and IsControlJustReleased(0, 38) then
                        print("stage2, style2")
                        UTK.info = {stage = 1, style = 2}
                        return self:HandleInfo()
                    end
                end
            end
        end)
    elseif self.info.stage == 1 then
        if self.info.style == 1 then
            Citizen.CreateThread(function()
                while true do
                    Citizen.Wait(1)
                    local pedcoords = GetEntityCoords(PlayerPedId())

                    if not Planted1 then
                        bomb1 = GetDistanceBetweenCoords(pedcoords, self.locations.loud.bomb1.x, self.locations.loud.bomb1.y, self.locations.loud.bomb1.z, true)
                    end
                    if not Planted2 then
                        bomb2 = GetDistanceBetweenCoords(pedcoords, self.locations.loud.bomb2.x, self.locations.loud.bomb2.y, self.locations.loud.bomb2.z, true)
                    end
                    if not Planted3 then
                        bomb3 = GetDistanceBetweenCoords(pedcoords, self.locations.loud.bomb3.x, self.locations.loud.bomb3.y, self.locations.loud.bomb3.z, true)
                    end

                    if bomb1 <= 5 and not UTK.planted1 then
                        DrawText3D(self.locations.loud.bomb1.x, self.locations.loud.bomb1.y, self.locations.loud.bomb1.z, self.texts.loud.bomb, 0.40)
                        DrawMarker(1, self.locations.loud.bomb1.x, self.locations.loud.bomb1.y, self.locations.loud.bomb1.z - 1, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                        if bomb1 <= 1.5 and IsControlJustReleased(0, 38) then
                            self.currentplant = 1
                            self:PlantBomb()
                        end
                    end
                    if bomb2 <= 5 and not UTK.planted2 then
                        DrawText3D(self.locations.loud.bomb2.x, self.locations.loud.bomb2.y, self.locations.loud.bomb2.z, self.texts.loud.bomb, 0.40)
                        DrawMarker(1, self.locations.loud.bomb2.x, self.locations.loud.bomb2.y, self.locations.loud.bomb2.z - 1, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                        if bomb2 <= 1.5 and IsControlJustReleased(0, 38) then
                            self.currentplant = 2
                            self:PlantBomb()
                        end
                    end
                    if bomb3 <= 5 and not UTK.planted3 then
                        DrawText3D(self.locations.loud.bomb3.x, self.locations.loud.bomb3.y, self.locations.loud.bomb3.z, self.texts.loud.bomb, 0.40)
                        DrawMarker(1, self.locations.loud.bomb3.x, self.locations.loud.bomb3.y, self.locations.loud.bomb3.z - 1, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                        if bomb3 <= 1.5 and IsControlJustReleased(0, 38) then
                            self.currentplant = 3
                            self:PlantBomb()
                        end
                    end
                end
            end)
        --[[elseif self.style == 2 then
            Citizen.CreateThread(function()
                while true do
                    Citizen.Wait(1)
                    local pedcoords = GetEntityCoords(PlayerPedId())
                    local hack1 = GetDistanceBetweenCoords(pedcoords, self.locations.silent.hack1, true)
                    local hack2 = GetDistanceBetweenCoords(pedcoords, self.locations.silent.hack2, true)
                    local hack3 = GetDistanceBetweenCoords(pedcoords, self.locations.silent.hack3, true)

                    if hack1 <= 5 then
                        DrawText3D(self.locations.silent.hack1, self.texts.silent.hack)
                    end
                    if hack2 <= 5 then
                        DrawText3D(self.locations.silent.hack2, self.texts.silent.hack)
                    end
                    if hack3 <= 5 then
                        DrawText3D(self.locations.silent.hack3, self.texts.silent.hack)
                    end
                end
            end)]]
        end
    end
end

--function UTK:CheckPress(...)

--end

function UTK:StartLoud(...)

end

function UTK:PlantBomb(...)
    if self.currentplant == 1 then
        loc = self.locations.loud.bomb1
    elseif self.currentplant == 2 then
        loc = self.locations.loud.bomb2
    elseif self.currentplant == 3 then
        loc = self.locations.loud.bomb3
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
    elseif self.currentplant == 2 then
        UTK.planted2 = true
    elseif self.currentplant == 3 then
        UTK.planted3 = true
    end
end

--function UTK:Hack(...)

--end

function DrawText3D(x, y, z, text, scale) local onScreen, _x, _y = World3dToScreen2d(x, y, z) local pX, pY, pZ = table.unpack(GetGameplayCamCoords()) SetTextScale(scale, scale) SetTextFont(4) SetTextProportional(1) SetTextEntry("STRING") SetTextCentre(true) SetTextColour(255, 255, 255, 215) AddTextComponentString(text) DrawText(_x, _y) local factor = (string.len(text)) / 700 DrawRect(_x, _y + 0.0150, 0.095 + factor, 0.03, 41, 11, 41, 100) end
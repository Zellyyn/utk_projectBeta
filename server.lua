ESX = nil
local info = {stage = 0, style = 0}

RegisterServerEvent("utk_pb:updateUTK")
RegisterServerEvent("utk_pb:upStage")
RegisterServerEvent("utk_pb:lock")
RegisterServerEvent("utk_pb:handlePlayers")
RegisterServerEvent("utk_pb:blackout")

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback("utk_pb:GetData", function(source, cb)
    cb(info)
end)

ESX.RegisterServerCallback("utk_pb:CheckItem", function(source, cb, itemname)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = xPlayer.getInventoryItem(itemname)["count"]

    if item >= 1 then
        cb(true)
    else
        cb(false)
    end
end)

AddEventHandler("utk_pb:updateUTK", function(table)
    local xPlayers = ESX.GetPlayers()

    for i = 1, #xPlayers, 1 do
        TriggerClientEvent("utk_pb:upUTK", xPlayers[i], table)
    end
end)

AddEventHandler("utk_pb:upStage", function(value)
    local xPlayers = ESX.GetPlayers()

    for i = 1, #xPlayers, 1 do
        TriggerClientEvent("utk_pb:upStage", xPlayers[i], value)
    end
end)

AddEventHandler("utk_pb:lock", function()
    local xPlayers = ESX.GetPlayers()

    for i = 1, #xPlayers, 1 do
        if xPlayers[i] ~= source then
            TriggerClientEvent("utk_pb:lock", xPlayers[i])
        end
    end
end)

AddEventHandler("utk_pb:handlePlayers", function()
    local xPlayers = ESX.GetPlayers()

    for i = 1, #xPlayers, 1 do
        TriggerClientEvent("utk_pb:handlePlayers_c", xPlayers[i])
    end
end)

AddEventHandler("utk_pb:blackout", function(status)
    local xPlayers = ESX.GetPlayers()

    for i = 1, #xPlayers, 1 do
        TriggerClientEvent("utk_pb:power", xPlayers[i], status)
    end
    BlackoutTimer()
end)

function BlackoutTimer()
    local timer = 30
    repeat
        Citizen.Wait(1000)
        timer = timer - 1
    until timer == 0
    local xPlayers = ESX.GetPlayers()

    for i = 1, #xPlayers, 1 do
        TriggerClientEvent("utk_pb:power", xPlayers[i], false)
    end
end
ESX = nil
local info = {stage = 0, style = 0}

RegisterServerEvent("utk_pb:upStage")

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

AddEventHandler("utk_pb:upStage", function(value)
    local xPlayers = ESX.GetPlayers()

    for i = 1, #xPlayers, 1 do
        TriggerClientEvent("utk_pb:upStage", xPlayers[i], value)
    end
end)


ESX = nil
local info = {stage = 0, style = 0}
RegisterServerEvent("utk_pb:updateUTK")
RegisterServerEvent("utk_pb:upStage")
RegisterServerEvent("utk_pb:lock")
RegisterServerEvent("utk_pb:handlePlayers")

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

AddEventHandler("utk_pb:handlePlayers", function(table)
    local xPlayers = ESX.GetPlayers()
    print("1")
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        print("2")
        if xPlayer.job.name == "police" then -- you may want to add off-duty police job here too if you use it
            TriggerClientEvent("utk_pb:handlePolice", xPlayers[i], table)
            print("3")
        else
            TriggerClientEvent("utk_pb:handleOthers", xPlayers[i], table)
            print("4")
        end
    end
end)
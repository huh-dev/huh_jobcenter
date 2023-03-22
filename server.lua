ESX = nil

ESX = exports["es_extended"]:getSharedObject() -- lavet til den nyere version af ESX Legacy.


-- Brug følgende event, hvis du bruger en ældre version af esx og fjern den overstående.

--[[
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 
--]]


RegisterServerEvent("huh_jobcenter:job1") 
AddEventHandler('huh_jobcenter:job1', function(job)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.setJob("mail", 0)
end)

RegisterServerEvent("huh_jobcenter:job2") 
AddEventHandler('huh_jobcenter:job2', function(job)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.setJob("taxi", 0)

end)

RegisterServerEvent("huh_jobcenter:job3") 
AddEventHandler('huh_jobcenter:job3', function(job)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.setJob("garbage", 0)

end)

-- Eksempel på server.lua

--[[
RegisterServerEvent("huh_jobcenter:job4") 
AddEventHandler('huh_jobcenter:job4', function(job)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.setJob("trucker", 0)

end)
--]]

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

require 'config'

RegisterServerEvent('getCharacterName')
AddEventHandler('getCharacterName', function()
 
    local xPlayer = ESX.GetPlayerFromId(source)
    local _source = source
    local identifier = xPlayer.getIdentifier() -- Ersetze "GetRockstarIdFromSource" durch deine Methode zum Abrufen der Rockstar ID

   local result = MySQL.Sync.fetchAll("SELECT `firstname`, `lastname` FROM `users` WHERE `identifier`=@identifier", {["@identifier"] = identifier})

    local firstname, lastname

    if result and result[1] then
        firstname = result[1].firstname
        lastname = result[1].lastname
    else
        firstname = Config.DefaultNames.firstname
        lastname = Config.DefaultNames.lastname
    end

    TriggerClientEvent('setCharacterName', _source, firstname, lastname)
end)



require 'config'
-- ZEIT FIRST / LASTNAME AN
local firstname = Config.DefaultNames.firstname
local lastname = Config.DefaultNames.lastname

Citizen.CreateThread(function()
    while true do
        local player = PlayerId()
        local id = GetPlayerServerId(player)

        TriggerServerEvent('getCharacterName')

        Citizen.Wait(10000) -- Wait 10s

        SetRichPresenceWithCharacterName(id, firstname, lastname) -- Update Richpresence

        Citizen.Wait(5000) -- Update each 5 seconds
    end
end)

-- Event-Handler zum Empfangen der Vornamen und Nachnamen des Charakters vom Server
RegisterNetEvent('setCharacterName')
AddEventHandler('setCharacterName', function(first, last)
    firstname = first
    lastname = last
end)

-- Funktion zum Setzen der Rich Presence mit den erhaltenen Daten
function SetRichPresenceWithCharacterName(id, firstname, lastname)
    local name = firstname .. " " .. lastname

    SetDiscordAppId(Config.Discord.AppId) -- Verwende die Client-ID aus der Konfiguration
    SetRichPresence("ID: " .. id .. " | " .. name)

    SetDiscordRichPresenceAsset(Config.Discord.LargeAsset) -- Großes Logo-Schlüssel
    SetDiscordRichPresenceAssetText(Config.Discord.LargeAssetText) -- Text für großes Logo

    SetDiscordRichPresenceAssetSmall(Config.Discord.SmallAsset) -- Kleines Logo-Schlüssel
    SetDiscordRichPresenceAssetSmallText(Config.Discord.SmallAssetText) -- Text für kleines Logo

    SetDiscordRichPresenceAction(0, Config.Discord.Action1Text, Config.Discord.Action1Url)
    SetDiscordRichPresenceAction(1, Config.Discord.Action2Text, Config.Discord.Action2Url)
end

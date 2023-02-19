Citizen.CreateThread(function()
  while true do
    local players = #GetActivePlayers()
    local playerName = "Unknown" -- Default name if player not found
    MySQL.Async.fetchAll("SELECT CONCAT(`firstname`, ' ', `lastname`) AS `name` FROM `users` WHERE `identifier` = @identifier", {['@identifier'] = GetPlayerIdentifiers(PlayerId())[1]}, function(result)
      if result[1] then
        playerName = result[1].name
      end
    end)
    SetRichPresence("Playing on ESX | "..players.." players online | "..playerName)
    SetDiscordAppId("YOUR_CLIENT_ID_HERE")
    SetDiscordRichPresenceAsset("YOUR_DISCORD_ASSET_NAME")
    SetDiscordRichPresenceAssetText("YOUR_ASSET_TEXT")
    SetDiscordRichPresenceAssetSmall("YOUR_SMALL_ASSET_NAME")
    SetDiscordRichPresenceAssetSmallText("YOUR_SMALL_ASSET_TEXT")
    Citizen.Wait(60000) -- Refresh rate (in milliseconds)
  end
end)

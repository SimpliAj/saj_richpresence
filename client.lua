-- Define the function that will be called when the resource starts
exports.DiscordRP = function()
    -- Get the player's character name
    local playerName = GetPlayerName(PlayerId())
    
    -- Set the Rich Presence status with the player's character name
    DiscordRPC.updatePresence({
        state = "Playing as " .. playerName,
        largeImageKey = "fivem_logo",
        largeImageText = "FiveM",
        startTimestamp = os.time(),
        endTimestamp = os.time() + 3600
    })
end

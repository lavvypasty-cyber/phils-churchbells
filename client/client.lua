local RSGCore = exports['rsg-core']:GetCoreObject()

local manualCooldowns = {}

for i = 1, #Config.Locations do
    manualCooldowns[i] = 0
end

CreateThread(function()
    Wait(5000)
    for i, loc in ipairs(Config.Locations) do
        local promptCoords = loc.prompt.coords or (loc.coords - vector3(0, 0, 3))
        exports['rsg-core']:createPrompt(
            'phils-churchbell-' .. i,
            promptCoords,
            RSGCore.Shared.Keybinds[Config.KeyBind],
            loc.prompt.label or "Ring Bell",
            {
                type = 'client',
                event = 'phils-churchbell:client:ringBell',
                args = { i },
            }
        )
    end
end)

RegisterNetEvent('phils-churchbell:client:ringBell', function(index)
    if not index then return end
    local loc = Config.Locations[index]
    if not loc then return end

    local now = GetGameTimer()
    if manualCooldowns[index] > now then return end
    manualCooldowns[index] = now + 10000

    TriggerServerEvent('phils-churchbell:server:playBell', loc.coords, loc.soundFile, loc.volume, loc.soundDistance)
end)

AddEventHandler('onResourceStop', function(res)
    if res ~= GetCurrentResourceName() then return end
    for i = 1, #Config.Locations do
        exports['rsg-core']:deletePrompt('phils-churchbell-' .. i)
    end
end)

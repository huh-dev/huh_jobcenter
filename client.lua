local spawnped = false

-- OX Target system, benyt dit eget hvis du ønsker 
exports.ox_target:addSphereZone({
    coords = vec3(236.6006, -409.1221, 47.9243), -- ændrer disse koordinater
    size = vec3(2, 2, 2),
    rotation = 257.0,
    debug = false,
    options = {
        {
            name = 'open_jobcenter',
            event = 'huh_jobcenter:åben',
            icon = 'fa-solid fa-suitcase',
            label = 'Åben Jobcenter'
        }
    }
})

-- Joncenterets context menu, bygget op på ox context menu
RegisterNetEvent('huh_jobcenter:åben', function(job)
    lib.registerContext({
        id = 'jobcenter_menu',
        title = 'Jobcenter',
        onExit = function()
        end,
        options = {
            {
                title = 'Postnord',
                description = 'Aflever pakker uden og inden for byen!',
                onSelect = function(args)
                    lib.notify({
                        title = 'Jobcenter',
                        description = 'Du valgte Postnord, som dit nye arbejde! Tilykke',
                        type = 'inform'
                    })
                end,
                event = 'huh_jobcenter:job1'
            },
            {
                title = 'Taxa',
                description = 'Kør folk rundt i byen!',
                onSelect = function(args)
                    lib.notify({
                        title = 'Jobcenter',
                        description = 'Du valgte Taxa, som dit nye arbejde! Tilykke',
                        type = 'inform'
                    })
                end,
                event = 'huh_jobcenter:job2'
            },
            {
                title = 'Skraldemand',
                description = 'Kør rundt og saml skrald!',
                onSelect = function(args)
                    lib.notify({
                        title = 'Jobcenter',
                        description = 'Du valgte Skraldemand, som dit nye arbejde! Tilykke',
                        type = 'inform'
                    })
                end,
                event = 'huh_jobcenter:job3'
            },
            --[[ Eksempel
            {
                title = 'Job navn',
                description = 'Job beskrivelse',
                onSelect = function(args)
                    lib.notify({
                        title = 'Jobcenter',
                        description = 'Du valgte Jobnavn, som dit nye arbejde! Tilykke',
                        type = 'inform'
                    })
                end,
                event = 'job event'
            },
            --]]
        }
    })
    lib.showContext('jobcenter_menu')
end)


-- PED spawn 
Citizen.CreateThread(function()
    while true do
        if spawnped == false then
            spawnped = true
            RequestModel(GetHashKey('a_m_y_beachvesp_01'))
            while not HasModelLoaded(GetHashKey('a_m_y_beachvesp_01')) do
                Wait(1)
            end

            ped1 = CreatePed(4, GetHashKey('a_m_y_beachvesp_01'), 236.6006, -409.1221, 47.9243-1, 340.2708, false, true) -- ændrer disse koordinater
            FreezeEntityPosition(ped1, true)
            SetEntityInvincible(ped1, true)
            SetBlockingOfNonTemporaryEvents(ped1, true)
        end
        Citizen.Wait(10000)
    end
end)


-- EventHandlers - opret en ny, når du tilføjer et nyt job under server.lua
AddEventHandler('huh_jobcenter:job1', function(job)
	TriggerServerEvent("huh_jobcenter:job1")
end)

AddEventHandler('huh_jobcenter:job2', function(job)
	TriggerServerEvent("huh_jobcenter:job2")
end)


AddEventHandler('huh_jobcenter:job3', function(job)
	TriggerServerEvent("huh_jobcenter:job3")
end)

-- Eksempel

--[[
AddEventHandler('huh_jobcenter:job4', function(job)
	TriggerServerEvent("huh_jobcenter:job4")
end)
--]]


-- Ikon på mappet
CreateThread(function()
	local blip = AddBlipForCoord(236.6006, -409.1221, 47.9243) -- ændrer disse koordinater

	SetBlipSprite (blip, 480)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 0.7)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName('Jobcenter')
	EndTextCommandSetBlipName(blip)
end)
        
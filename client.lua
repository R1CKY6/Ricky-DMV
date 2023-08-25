-- DMV School 
-- Tech Development - https://discord.gg/tHAbhd94vS
local ESX = exports.es_extended:getSharedObject()

postNUI = function(data)
    SendNUIMessage(data)
end

OpenDMV = function()
    ESX.TriggerServerCallback('ricky-dmv:getData', function(licenses, money, bank) 
        postNUI({
            type = "SET_CONFIG",
            config = Config
        })
        postNUI({
            type = "SET_MONEY",
            contanti = bank,
            banca = bank
        })
        postNUI({
            type = "OPEN",
            licenses = licenses,
            license = Config.License
        })
        SetNuiFocus(true, true)
        TriggerScreenblurFadeIn(500)
    end)
end

RegisterNUICallback('close', function()
    SetNuiFocus(false, false)
    TriggerScreenblurFadeOut(500)
end)

RegisterNUICallback('removeMoney', function(data)
    local account = data.account
    local amount = tonumber(data.amount)
    TriggerServerEvent('ricky-dmv:removeMoney', account, money)
end)

RegisterNetEvent('ricky-dmv:updateLicense')
AddEventHandler('ricky-dmv:updateLicense', function()
    ESX.TriggerServerCallback('ricky-dmv:getData', function(licenses) 
        postNUI({
            type = "UPDATE_LICENSE",
            licenses = licenses,
        })
    end)
end)

RegisterNUICallback('theoryOk', function(data)
    local license = data.license
    onCompleteTheory(license)
end)

RegisterNUICallback('practiceOk', function(data)
    local license = data.license
    onCompletePractice(license)
end)


local step = 0
local maxSpeed = nil
local sleep = 1000
local error = 0

SetUpMarker = function()
    step = step + 1
    local randomNumber = math.random(1, #Config.PracticeCoords)
    local coords = Config.PracticeCoords[randomNumber]
    coords = coords[step]
    if coords == nil then
        ESX.Game.DeleteVehicle(GetVehiclePedIsIn(PlayerPedId(), false))
        postNUI({
            type = "DISPLAY_RISULTATO",
            errori = error,
        })
        SetNuiFocus(true, true)
        TriggerScreenblurFadeIn(500)
        step = 0
        sleep = 1000
        return
    end
    maxSpeed = coords.speedLimit or nil
    coords = coords.coordinate
    SetNewWaypoint(coords.x, coords.y)
    sleep = 0
    Citizen.CreateThread(function()
        while true do
          Citizen.Wait(sleep)
          DrawMarker(Config.MarkerSettings.type, coords.x, coords.y, coords.z, 0, 0, 0, 0, 0, 0, Config.MarkerSettings.size, Config.MarkerSettings.color, 100, Config.MarkerSettings.bump, true, 2, Config.MarkerSettings.rotate, false, false, false)
          local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
            if vehicle ~= nil then
                local speed = GetEntitySpeed(vehicle) * Config.SpeedMultiplier
                if maxSpeed ~= nil and speed > maxSpeed then
                    sleep = 1000
                    error = error + 1
                    ESX.ShowNotification(Config.Lang[Config.Language]["speed_error"], "error")
                else
                    sleep = 0
                end
            end
          local distance = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, GetEntityCoords(PlayerPedId()), true)
          if distance < 1.5 then
            SetUpMarker()
            break 
          end
         end
      end)
end


RegisterNUICallback('startPractice', function(data)
    local license = data.license 
    for k,v in pairs(Config.License) do 
        if v.id == license then
            local vehicle = v.vehicle
            ESX.Game.SpawnVehicle(vehicle.model, vehicle.coords, vehicle.heading, function(veh) 
                SetVehicleNumberPlateText(veh, vehicle.plate)
                SetPedIntoVehicle(PlayerPedId(), veh, -1)
            end)
        end
    end
    SetUpMarker()
end)


local sleep2 = 1000
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(sleep2)
     for k,v in pairs(Config.DMVSchool) do 
        DrawMarker(Config.MarkerSettings.type, v.x, v.y, v.z, 0, 0, 0, 0, 0, 0, Config.MarkerSettings.size, Config.MarkerSettings.color, 100, Config.MarkerSettings.bump, true, 2, Config.MarkerSettings.rotate, false, false, false)

        local distance = GetDistanceBetweenCoords(v.x, v.y, v.z, GetEntityCoords(PlayerPedId()), true)
        if distance < 5.5 then
            sleep2 = 0
            ESX.ShowHelpNotification(Config.Lang[Config.Language]["open_dmv"])
            if IsControlJustReleased(0, 38) then
                OpenDMV()
            end
        else
            sleep2 = 1000
        end
    end
   end
end)
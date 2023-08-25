-- DMV School 
-- Tech Development - https://discord.gg/tHAbhd94vS

local ESX = exports.es_extended:getSharedObject()

ESX.RegisterServerCallback('ricky-dmv:getData', function(source, cb)
    local licenses = Config.License
    local xPlayer = ESX.GetPlayerFromId(source)
    local result =  MySQL.Sync.fetchAll("SELECT * FROM user_licenses WHERE owner = @identifier", {
        ['@identifier'] = xPlayer.identifier,
    })
    for k,v in pairs(licenses) do 
        v.theory = false
        v.practice = false
        for i=1, #result, 1 do
            local coso = result[i]

            if coso.type == v.id then
                v.theory = true
                v.practice = true
            elseif coso.type == v.id.."dmv" then
                v.theory = true
                v.practice = false
            end
        end
    end
    cb(licenses, xPlayer.getAccount('money').money, xPlayer.getAccount('bank').money)
end)


AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        for k,v in pairs(Config.License) do
            local result =  MySQL.Sync.fetchAll("SELECT * FROM licenses WHERE type = @type", {
                  ['@type'] = v.id,
            }) 
            if result == nil or result[1] == nil then
                MySQL.Async.execute("INSERT INTO licenses (type, label) VALUES (@type, @label)", {
                    ['@type'] = v.id,
                    ['@label'] = v.label,
                }) 
            end
        end

        for k,v in pairs(Config.License) do
            local result =  MySQL.Sync.fetchAll("SELECT * FROM licenses WHERE type = @type", {
                  ['@type'] = v.id.."dmv",
            }) 
            if result == nil or result[1] == nil then
                MySQL.Async.execute("INSERT INTO licenses (type, label) VALUES (@type, @label)", {
                    ['@type'] = v.id.."dmv",
                    ['@label'] = v.label.." DMV",
                }) 
            end
        end
    end
end)


RegisterServerEvent('ricky-dmv:givelicense')
AddEventHandler('ricky-dmv:givelicense', function(license)
    TriggerEvent('esx_license:addLicense', source, license)
    TriggerClientEvent('ricky-dmv:updateLicense', source)
end)


RegisterServerEvent('ricky-dmv:removeMoney')
AddEventHandler('ricky-dmv:removeMoney', function(account, money)
  local src = source
  local xPlayer = ESX.GetPlayerFromId(src)
  
  xPlayer.removeAccountMoney(account, money)
end)
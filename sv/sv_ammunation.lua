--//  By Kingder#0001
--//  For HebergTonServ.fr

ESX = nil
TriggerEvent(Ammunation.typeESX, function(obj) ESX = obj end)

ESX.RegisterServerCallback('verifsitaleppapd', function(source, cb, type)
    CheckLicense(source, 'weapon', cb)
end)

function CheckLicense(source, type, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = xPlayer.identifier

	MySQL.Async.fetchAll('SELECT COUNT(*) as count FROM user_licenses WHERE type = @type AND owner = @owner', {
		['@type']  = type,
		['@owner'] = identifier
	}, function(result)
		if tonumber(result[1].count) > 0 then
			cb(true)
		else
			cb(false)
		end

	end)
end

RegisterServerEvent('envoislemisper')
AddEventHandler('envoislemisper', function(weapon)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()

	if playerMoney >= 50000 then
    MySQL.Async.execute('INSERT INTO user_licenses (type, owner) VALUES (@type, @owner)', {
        ['@type'] = weapon,
        ['@owner'] = xPlayer.identifier
    })
	    xPlayer.removeMoney(50000)
	    TriggerClientEvent('esx:showNotification', source, "<C>~g~Achat réussis !")
	else
		TriggerClientEvent('esx:showNotification', source, "<C>~r~Vous n'avez pas assez !")
	end
end)


RegisterNetEvent('envoislitembatard')
AddEventHandler('envoislitembatard', function(anubis)

	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()

	if playerMoney >= (anubis.Price) then
		xPlayer.addInventoryItem(anubis.Value, 1)
		xPlayer.removeMoney(anubis.Price)
        TriggerClientEvent('esx:showNotification', source, "<C>~g~Merci de votre achat.")
	else
		TriggerClientEvent('esx:showNotification', source, "<C>~r~Vous n'avez pas assez !")
	end
end)

RegisterServerEvent('envoislarmebatard')
AddEventHandler('envoislarmebatard', function(Anubis)

    local xPlayer = ESX.GetPlayerFromId(source)
    local playerMoney = xPlayer.getMoney()

    if playerMoney >= (Anubis.Price) then

        if not xPlayer.hasWeapon(Anubis.Value) then

            xPlayer.addWeapon(Anubis.Value, 990)
            xPlayer.removeMoney(Anubis.Price)
            TriggerClientEvent('esx:showNotification', source, '<C>~g~Merci de votre achat.')
        else
            TriggerClientEvent('esx:showNotification', source, '<C>~r~Vous avez déjà cette arme')
        end
        else
        TriggerClientEvent('esx:showNotification', source, "<C>~r~Vous n'avez pas assez d'argent !")
    end
end)

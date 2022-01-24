--//  By Kingder#0001
--//  For HebergTonServ.fr

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent(Ammunation.typeESX, function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

if Ammunation.blips_Ammunation then
    CreateThread(function()
        for k, v in pairs(Ammunation.Position) do
            local blipsAmmunation = AddBlipForCoord(v.x, v.y, v.z)

            SetBlipSprite (blipsAmmunation, Ammunation.blips_sprite)
            SetBlipScale  (blipsAmmunation, Ammunation.blips_taille)
            SetBlipColour (blipsAmmunation, Ammunation.blips_colour)
            SetBlipAsShortRange(blipsAmmunation, true)

            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(Ammunation.blips_name)
            EndTextCommandSetBlipName(blipsAmmunation)
        end
    end)
end


local openAmmunation = false 
local MainAmmunation = RageUI.CreateMenu(Ammunation.Title, "~o~Bienvenue~s~")
local subAmmunation = RageUI.CreateSubMenu(MainAmmunation, Ammunation.Title, "~o~Accessoires~s~")
local subAmmunation2 = RageUI.CreateSubMenu(MainAmmunation, Ammunation.Title, "~o~Armes blanches~s~")
local subAmmunation3 = RageUI.CreateSubMenu(MainAmmunation, Ammunation.Title, "~o~Armes à feu~s~")
local subAmmunation4 = RageUI.CreateSubMenu(MainAmmunation, Ammunation.Title, "~o~Permis d'armes~s~")
MainAmmunation.Closed = function()
  openAmmunation = false
  SetPlayerControl(PlayerId(), true, 12)
end

AmmunationOpen = function() 
	if openAmmunation == false then 
		openAmmunation = true 
		SetPlayerControl(PlayerId(), false, 12)
		RageUI.Visible(MainAmmunation, true)
		CreateThread(function()
		while openAmmunation do 
		   RageUI.IsVisible(MainAmmunation,function() 


		if Ammunation.active_accessoires then
			RageUI.Button("Accessoires", nil, {RightLabel = "~b~→"}, true , {}, subAmmunation)
		end

		if Ammunation.active_armesblanches then
			RageUI.Button("Armes blanches", nil, {RightLabel = "~b~→"}, true , {}, subAmmunation2)
		end

	if Ammunation.active_calibre == true then
			
		if Ammunation.Permis.use_ppa == true and ppa == false then
			RageUI.Button("Armes à feu", nil, {}, false, {})
			RageUI.Button("Permis de port d'armes", nil, {RightLabel = "150 000~g~$"}, true , {}, subAmmunation4)
		end

		if Ammunation.Permis.use_ppa == true and ppa == true then
			RageUI.Button("Armes à feu", nil, {RightLabel = "~b~→"}, true, {}, subAmmunation3)
		end


        if Ammunation.Permis.use_ppa == false then
            RageUI.Button("Armes à feu", nil, {RightLabel = "~b~→"}, true , {}, subAmmunation3)
        end

	end


		end) 

		RageUI.IsVisible(subAmmunation,function() 

		for k, v in pairs(Ammunation.Accessoires) do
			RageUI.Button("Acheter ~g~"..v.Label.."", nil, {RightLabel = "→ ~s~"..v.Price.."~g~$~s~"}, true , {
				onSelected = function()
					TriggerServerEvent("droplitembatard", v)
 				end
			})
		end

	end)

		RageUI.IsVisible(subAmmunation2,function() 

			for k, v in pairs(Ammunation.Blanches) do
				RageUI.Button("Acheter ~g~"..v.Label.."", nil, {RightLabel = "→ ~s~"..v.Price.."~g~$~s~"}, true , {
					onSelected = function()
					    TriggerServerEvent("droplitembatard", v)
					end
				})
			end

		end)

		RageUI.IsVisible(subAmmunation3,function() 

			for k, v in pairs(Ammunation.Calibre) do
				RageUI.Button("Acheter ~g~"..v.Label.."", nil, {RightLabel = "→ ~s~"..v.Price.."~g~$~s~"}, true , {
					onSelected = function()
					    TriggerServerEvent("droplitembatard", v)
					end
				})
			end

		end)

		RageUI.IsVisible(subAmmunation4, function()

			RageUI.Button("Permis de port d'arme", nil, {RightLabel = "~b~→ ~s~150 000~g~$"}, true , {
				onSelected = function()
					TriggerServerEvent("envoislemisper", "weapon")
					RageUI.CloseAll()
					openAmmunation = false
				end
			})

		end)
		Wait(0)
	end
 end)
end
end


CreateThread(function()
	while true do
		local wait = 750
		local playerCoords = GetEntityCoords(PlayerPedId())

		for k, v in pairs(Ammunation.Position) do

        local distance = GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, true)

		if (distance < 5.0 and distance > 1.5) then
            wait = 0
        	DrawMarker(Ammunation.TypeMarker, v.x, v.y, v.z+0.90, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Ammunation.MarkerTaille.x, Ammunation.MarkerTaille.y, Ammunation.MarkerTaille.z, Ammunation.MarkerColour.r, Ammunation.MarkerColour.g, Ammunation.MarkerColour.b, 255, Ammunation.MarkerIsJump, Ammunation.MarkerTracker, false, Ammunation.MarkerIsTourned)  
        end
			
        if distance <= 1.5 then
        	wait = 0
        	Visual.Subtitle(Ammunation.TifleForOpenMenu, 1) 

         if IsControlJustPressed(1, 51) then
            if Ammunation.Permis.use_ppa == true then
                ESX.TriggerServerCallback('verifsitaleppapd', function(cb)         
                    print("verif ppa")   
                    if cb then
                        ppa = true 
                        print("PPA IT'S OK ")
                        else 
                         ppa = false   
                         print("PPA IT'S NOT OK ")
                    end
                  end)
                end
				AmmunationOpen()
            end
        end
    end
        Wait(wait)
	end
end)

ESX = nil
local PlayerData = {}
local jobName = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
    if ESX == nil then
        TriggerServerEvent('snw_showJobs:badState', "^5[SNW_SHOWJOB]^0 Script ^1ERROR^0")
    else
        TriggerServerEvent('snw_showJobs:goodState', "^5[SNW_SHOWJOB]^0 Script is started ^2Successfully^0")
    end
    if Config.debug == true then
        if ESX == nil then
            print("Can't load the ESX library")
        else
            print("ESX is succesfully loaded")
        end
    end
end)

local jobbb = false
Citizen.CreateThread(function()
    RegisterCommand('job', function()
        jobbb = not jobbb
        if jobbb == true then
            while ESX.IsPlayerLoaded() == false do
                Citizen.Wait(1)
            end
            if ESX.IsPlayerLoaded() == true then
                Citizen.Wait(0)
                if Config.debug == true then
                    print(ESX.GetPlayerData().job.label)
                end
                local posX = Config.text.xpos
                local posY = Config.text.ypos
                local string = "STRING"
                local scale = Config.text.scale
                local font = Config.text.font
                local outline = Config.text.outline
                local fost = ESX.GetPlayerData().job.label
                    --SECOND LAYER
                local posX2 = Config.text2.xpos
                local posY2 = Config.text2.ypos
                local scale2 = Config.text2.scale
                local font2 = Config.text2.font
                local outline = Config.text.outline
                local fost2 = ESX.GetPlayerData().job.grade_label
                if Config.debug == true then
                    print("Succesfully loaded")
                end
                while jobbb do
                    Citizen.Wait(0)
                    if not IsHudHidden() then
                        SetTextScale(scale, scale)
                        SetTextFont(font)
                        SetTextOutline(outline)
                        BeginTextCommandDisplayText(string)
                        AddTextComponentSubstringPlayerName(ESX.GetPlayerData().job.label)
                        EndTextCommandDisplayText(posX, posY)
                        --SECOND LAYER
                        SetTextScale(scale2, scale2)
                        SetTextFont(font2)
                        SetTextOutline(outline2)
                        BeginTextCommandDisplayText(string)
                        AddTextComponentSubstringPlayerName(ESX.GetPlayerData().job.grade_label)
                        EndTextCommandDisplayText(posX2, posY2)
                    end
                end
            else
                Citizen.Wait(0)
                print("Succesfully loaded")
            end
            if Config.debug == true then
                if playerJobdata == nil then
                    print("The script can't load any data")
                else
                    print("The script can load datas but can't start up")
                end
            end
            return
        end
    end,false)
end)



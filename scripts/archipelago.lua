local Act = require("act")

ScriptHost:LoadScript("scripts/autotracking/item_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/location_mapping.lua")

CUR_INDEX = -1
--SLOT_DATA = nil

chapter_costs = {}

-- Set up the default chapter information

local chapter_act_info = {
    Spaceship_WaterRift_Gallery = Act.new(0),
    Spaceship_WaterRift_MailRoom = Act.new(0),

    chapter1_tutorial = Act.new(1, {"intro"}),
    chapter1_barrelboss = Act.new(1, {"chapter1_tutorial"}),
    chapter1_cannon_repair = Act.new(1, {"chapter1_tutorial"}),
    chapter1_boss = Act.new(1, {"chapter1_barrelboss", "chapter1_cannon_repair"}),
    harbor_impossible_race = Act.new(1, {"mafiatown_lava", "mafiatown_goldenvault"}),
    mafiatown_lava = Act.new(1, {"chapter1_boss"}),
    mafiatown_goldenvault = Act.new(1, {"chapter1_boss"}),
    TimeRift_Cave_Mafia = Act.new(1),
    TimeRift_Water_Mafia_Easy = Act.new(-1),
    TimeRift_Water_Mafia_Hard = Act.new(-1),

    DeadBirdStudio = Act.new(2, {"intro"}),
    chapter3_murder = Act.new(2, {"DeadBirdStudio"}),
    moon_camerasnap = Act.new(2, {"DeadBirdStudio"}),
    trainwreck_selfdestruct = Act.new(2, {"chapter3_murder", "moon_camerasnap"}),
    moon_parade = Act.new(2, {"chapter3_murder", "moon_camerasnap"}),
    award_ceremony = Act.new(2, {"trainwreck_selfdestruct", "moon_parade"}),
    chapter3_secret_finale = Act.new(2, {"trainwreck_selfdestruct", "moon_parade"}),
    TimeRift_Cave_BirdBasement = Act.new(2),
    TimeRift_Water_TWreck_Panels = Act.new(-2),
    TimeRift_Water_TWreck_Parade = Act.new(-2),

    subcon_village_icewall = Act.new(3, {"intro"}),
    subcon_cave = Act.new(3),
    chapter2_toiletboss = Act.new(3),
    vanessa_manor_attic = Act.new(3),
    subcon_maildelivery = Act.new(3),
    snatcher_boss = Act.new(3, {"subcon_village_icewall", "subcon_cave", "chapter2_toiletboss", "vanessa_manor_attic", "subcon_maildelivery"}),
    TimeRift_Cave_Raccoon = Act.new(3),
    TimeRift_Water_Subcon_Hookshot = Act.new(-3),
    TimeRift_Water_Subcon_Dwellers = Act.new(-3),

    AlpineFreeRoam = Act.new(4, {"intro"}),
    AlpineSkyline_Finale = Act.new(4),
    TimeRift_Cave_Alps = Act.new(4),
    TimeRift_Water_Alp_Goats = Act.new(4),
    TimeRift_Water_AlpineSkyline_Cats = Act.new(-4),

    TheFinale_FinalBoss = Act.new(5, {"intro"}),
    TimeRift_Cave_Tour = Act.new(0),

    Cruise_Boarding = Act.new(6, {"intro"}),
    Cruise_Working = Act.new(6, {"Cruise_Boarding"}),
    Cruise_Sinking = Act.new(6, {"Cruise_Working"}),
    Cruise_WaterRift_Slide = Act.new(-6),
    Cruise_CaveRift_Aquarium = Act.new(6),

    MetroFreeRoam = Act.new(7, {"intro"}),
    Metro_Escape = Act.new(7),
    Metro_CaveRift_RumbiFactory = Act.new(7)
}

-- Setup for auto map switching
map_table = {
    hub_spaceship = "Spaceship",

    mafia_town = "Mafia Town",
    mafia_town_night = "Mafia Town",
    mafia_town_lava = "Mafia Town",
    mafia_hq = "Mafia Town",
    mafia_town_dw_ufo = "Mafia Town",

    deadbirdstudio = "Dead Bird Studio",
    chapter3_murder = "Dead Bird Studio",
    themoon = "Dead Bird Studio",
    trainwreck_selfdestruct = "Dead Bird Studio",
    dead_cinema = "Dead Bird Studio",

    deadbirdbasement = "Dead Bird Basement",
    djgrooves_boss = "Dead Bird Basement",

    subconforest = "Subcon Forest",
    subcon_cave = "Subcon Forest",
    vanessa_manor = "Subcon Forest",

    alpsandsails = "Alpine Skyline",

    -- placeholders for the DLC
    -- ship_main = "Boat",
    -- ship_sinking = "Boat",

    -- DLC_Metro = "Nyakuza Metro"
}

--I initialise HatOrder in onClear but need to read the table during item checks
HatOrder = {}

FLAG_CODES = {
}

function has_value (t, val)
    for i, v in ipairs(t) do
        if v == val then return 1 end
    end
    return 0
end

function dump_table(o, depth)
    if depth == nil then
        depth = 0
    end
    if type(o) == 'table' then
        local tabs = ('\t'):rep(depth)
        local tabs2 = ('\t'):rep(depth + 1)
        local s = '{\n'
        for k, v in pairs(o) do
            if type(k) ~= 'number' then
                k = '"' .. k .. '"'
            end
            s = s .. tabs2 .. '[' .. k .. '] = ' .. dump_table(v, depth + 1) .. ',\n'
        end
        return s .. tabs .. '}'
    else
        return tostring(o)
    end
end


function onClear(slot_data)
    --SLOT_DATA = slot_data
    CUR_INDEX = -1

    -- reset locations
    for _, v in pairs(LOCATION_MAPPING) do
        if v[1] then
            local obj = Tracker:FindObjectForCode(v[1])
            if obj then
                if v[1]:sub(1, 1) == "@" then
                    obj.AvailableChestCount = obj.ChestCount
                else
                    obj.Active = false
                end
            end
        end
    end
    -- reset items
    for _, v in pairs(ITEM_MAPPING) do
        if v[1] and v[2] then
            if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: clearing item %s of type %s", v[1], v[2]))
            end
            local obj = Tracker:FindObjectForCode(v[1])
            if obj then
                if v[2] == "toggle" then
                    obj.Active = false
                elseif v[2] == "progressive" then
                    obj.CurrentStage = 0
                    obj.Active = false
                elseif v[2] == "consumable" then
                    obj.AcquiredCount = 0
                elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                    print(string.format("onClear: unknown item type %s for code %s", v[2], v[1]))
                end
            elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: could not find object for code %s", v[1]))
            end
        end
    end

    --reset HatOrder
    HatOrder = {}

    if slot_data == nil  then
        print("welp")
        return
    end
    
    if slot_data['Hat1'] then
        SprintHatCost = slot_data['SprintYarnCost']
        BrewingHatCost = slot_data['BrewingYarnCost']
        IceHatCost = slot_data['IceYarnCost']
        DwellerMaskCost = slot_data['DwellerYarnCost']
        TimeHatCost = slot_data['TimeStopYarnCost']

        function GetHat(hatnum)
            SPRINT = 0
            BREWING = 1
            ICE = 2
            DWELLER = 3
            TIME_STOP = 4
            if hatnum == 0 then return 'sprint', SprintHatCost end
            if hatnum == 1 then return 'brewer', BrewingHatCost end
            if hatnum == 2 then return 'ice', IceHatCost end
            if hatnum == 3 then return 'dweller', DwellerMaskCost end
            if hatnum == 4 then return 'timestop', TimeHatCost end
        end

        for i=1, 5 do
            k, v = GetHat(slot_data['Hat'..i])
            HatOrder[i] = { [k] = v }
        end
        --[[ debug stuff, in case autochecking hats still needs work
        print("Hat1: "..slot_data['Hat1'])
        print("Hat2: "..slot_data['Hat2'])
        print("Hat3: "..slot_data['Hat3'])
        print("Hat4: "..slot_data['Hat4'])
        print("Hat5: "..slot_data['Hat5'])
        print(dump_table(HatOrder))
        ]]
    end

    --set data storage keys
    map_key = string.format("ahit_currentmap_%s", Archipelago.PlayerNumber)
    completed_acts_key = string.format("ahit_clearedacts_%s", Archipelago.PlayerNumber)

    Archipelago:SetNotify({map_key, completed_acts_key})
    Archipelago:Get({map_key, completed_acts_key})

    if slot_data['ShuffleStorybookPages'] then
        local obj = Tracker:FindObjectForCode("pages")
        local val = slot_data['ShuffleStorybookPages']
        if obj then
            obj.Active = val
        end
    end

    if slot_data['ShuffleActContracts'] then
        local obj = Tracker:FindObjectForCode("contract")
        local val = slot_data['ShuffleActContracts']
        if obj then
            obj.Active = val
        end
    end

    if slot_data['ShuffleSubconPaintings'] then
        local obj = Tracker:FindObjectForCode("paintings")
        local stage = slot_data['ShuffleSubconPaintings']
        if obj then
            obj.CurrentStage = stage
        end
    end

    if slot_data['ShuffleAlpineZiplines'] then
        local obj = Tracker:FindObjectForCode("ziplines_logic")
        local stage = slot_data['ShuffleAlpineZiplines']
        if obj then
            obj.CurrentStage = stage
        end
    end

    if slot_data['UmbrellaLogic'] then
        local obj = Tracker:FindObjectForCode("umbrella_logic")
        local val = slot_data['UmbrellaLogic']
        if obj then
            obj.Active = val
        end
    end

    if slot_data['LogicDifficulty'] then
        local obj = Tracker:FindObjectForCode("difficulty")
        local val = slot_data['LogicDifficulty']
        if obj then
            obj.CurrentStage = val + 1
        end
    end

    if slot_data['CTRLogic'] then
        local obj = Tracker:FindObjectForCode("ctrlogic")
        local val = slot_data['CTRLogic']
        if obj then
            obj.CurrentStage = val
        end
    end

    if slot_data['BadgeSellerItemCount'] then
        local obj = Tracker:FindObjectForCode("@Mafia Town/Badge Seller/Scammed")
        local val = slot_data['BadgeSellerItemCount']
        if obj then
            obj.AvailableChestCount = val
        end
    end

    -- set hash table to randomized acts
    for chapter_number = 1,7 do
        local chapter = string.format('Chapter%dCost', chapter_number)
        if slot_data[chapter] and slot_data[chapter] >= 0 then
            chapter_costs[chapter_number] = slot_data[chapter]
        end
    end

    for key, act in pairs(chapter_act_info) do
        if act and slot_data[key] then
            act:setActName(slot_data[key])
        end
    end

    -- ahit important slot_data variables
    --[[ 
    slot_data["RandomizeHatOrder"]  --not handling this atm, assuming it's on
    ["Hat5"]
    ["Hat2"]
    ["Hat4"]
    ["Hat1"]
    ["Hat3"]
    ["SprintYarnCost"]
    ["BrewingYarnCost"]
    ["IceYarnCost"]
    ["DwellerYarnCost"]
    ["TimeStopYarnCost"]

    ["ShuffleActContracts"]  --not handling this atm, assuming it's on
    ["ShuffleStorybookPages"]  --not handling this atm, assuming it's on
    ["CTRWithSprint"]
    ["SDJLogic"]

    -- I think the above marked variables don't even need handling, they'd
    -- still get tracked but are just hidden from view - so no changes necessary
    -- also I believe the Hat1..5 slot data still exists with hat rando off 
    -- (just populated 0..4) so that would still work too
    ]]--

    --print(dump_table(slot_data))
end

-- There's no explicit event on receiving hats so I fetched the hat order and cost
-- for each hat on Clear, then here I count how many yarn has been received
function updateYarn(yarn)
    count = yarn.AcquiredCount
    --print("Yarn: "..(yarn.AcquiredCount))
    for k,v in ipairs(HatOrder) do
        for l,w in pairs(v) do
            local obj = Tracker:FindObjectForCode(l)
            obj.Active = count >= w
            count = count - w
        end
    end
end

--called when map is changed
function changedMap(current_map, previous_map)
    -- should start disabled?
    -- add button to disable auto switching
    internal_map_name = map_table[current_map]
    
    if internal_map_name == nil then
        print("Could not find map name; Setting to Spaceship")
        internal_map_name = "Spaceship"
    end
    Tracker:UiHint("ActivateTab", internal_map_name)
end

--funky time
function updateAccessibleLevelsByTimepieces()
    local timepieces = Tracker:FindObjectForCode("timepiece")
    local chapters_to_keep = {}

    for chapter, cost in ipairs(chapter_costs) do
        if cost <= timepieces.AcquiredCount then
            --unlock the intro levels if we meet the chapter cost and the act name isnt empty
            for key, act in pairs(chapter_act_info) do
                if act.chapter == chapter and act.act_requirements[1] == "intro" and act.act_name ~= "" then
                    act:setIsAccessible(true)
                    print(act.act_name .. " is accessible at location " .. key)
                end
            end

            --unlock the rifts behind the chapter doors if you have the required item
            local brewer = Tracker:FindObjectForCode("brewer")
            local dweller = Tracker:FindObjectForCode("dweller")

            if chapter == 2 and brewer.Active then
                chapter_act_info["Spaceship_WaterRift_Gallery"].setIsAccessible(true)
            elseif chapter == 3 and dweller.Active then
                chapter_act_info["Spaceship_WaterRift_MailRoom"].setIsAccessible(true)
            end
        else
            chapters_to_keep[chapter] = cost
        end
    end
    chapter_costs = chapters_to_keep
end

function updateAccessibleLevelsByRelics(relic_type, relic_count)
    local relic_chapter
    local relic_chapter_number

    --convert relic type to the internal chapter name only if we have the correct amount of relics
    if relic_type == "burgerrelic" and relic_count >= 2 then
        relic_chapter = "TimeRift_Cave_Mafia"
        relic_chapter_number = 1
    elseif relic_type == "trainrelic" and relic_count >= 2 then
        relic_chapter = "TimeRift_Cave_BirdBasement"
        relic_chapter_number = 2
    elseif relic_type == "uforelic" and relic_count >= 4 then
        relic_chapter = "TimeRift_Cave_Raccoon"
        relic_chapter_number = 3
    elseif relic_type == "crayonrelic" and relic_count >= 4 then
        relic_chapter = "TimeRift_Cave_Alps"
        relic_chapter_number = 4
    elseif relic_type == "cakerelic" and relic_count >= 4 then
        relic_chapter = "Cruise_CaveRift_Aquarium"
        relic_chapter_number = 6
    elseif relic_type == "jewelryrelic" and relic_count >= 4 then
        relic_chapter = "Metro_CaveRift_RumbiFactory"
        relic_chapter_number = 7
    end

    -- Funky stuff required for checking if you can reach the portal
    if relic_chapter then
        local canAccess = false

        for _, act in pairs(chapter_act_info) do
            --chapters 2 and 6 rifts can only be accessed from one specific act
            --chapter 3 rift has an act that makes it only accessible if on expert difficulty, otherwise it needs either painting shuffle to be off or on a specific stage or for the expert diffuclty to be enabled
            --chapters 1, 4, and 7 can be accessed from any of their acts
            if relic_chapter_number == 2 and act.act_name == "DeadBirdStudio" and act.isAccessible then
                canAccess = true
                break
            elseif relic_chapter_number == 3 and act.chapter == relic_chapter_number and act.isAccessible then
                local paintings = Tracker:FindObjectForCode("paintings")
                local difficulty = Tracker:FindObjectForCode("difficulty")

                if (act.act_name == "snatcher_boss" and difficulty.CurrentStage == 4) or act.act_name ~= "snatcher_boss" then
                    if paintings.CurrentStage == 0 or paintings.CurrentStage == 4 or difficulty.CurrentStage >= 0 then
                        canAccess = true
                    end
                end
                break
            elseif relic_chapter_number == 6 and act.act_name == "Cruise_Boarding" and act.isAccessible then
                canAccess = true
                break
            elseif act.isAccessible and act.chapter == relic_chapter_number then
                canAccess = true
                break
            end

        end

        if canAccess then
            chapter_act_info[relic_chapter]:setIsAccessible(true)
            print(chapter_act_info[relic_chapter]:getActName() .. " is accessible at location " .. relic_chapter)
        end
    end
end

function updateAccessibleLevelsByCompletedLevels(completed_acts)
    local chapter_counts = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [6] = 0
    }
    
    for key, act in pairs(chapter_act_info) do
        if act.act_name ~= "" then
            local allRequirementsMet = true

            if act.act_requirements and act.act_requirements[1] ~= "" then
                for _, act_requirement in ipairs(act.act_requirements) do
                    --handle normal level unlocks
                    if act:getActRequirements() and not containsItem(completed_acts, act_requirement) then
                        allRequirementsMet = false
                        break
                    end
                end
            
                if allRequirementsMet and act then
                    act:setIsAccessible(true)
                    print(act.act_name .. " is accessible at location " .. key)
                end
            end

            --increase completion amounts of chapters for time rifts
            if act.chapter and act.act_name then
                for _, completed_act in pairs(completed_acts) do
                    if act.act_name == completed_act then
                        if chapter_counts[act.chapter] then
                            chapter_counts[act.chapter] = chapter_counts[act.chapter] + 1
                        end
                    end
                end
            end

            --check if rift requirements are met
            if act.isAccessible and act.chapter == 1 then
                if chapter_counts[1] >= 6 then
                    chapter_act_info["TimeRift_Water_Mafia_Hard"]:setIsAccessible(true)
                elseif chapter_counts[1] >= 4 then
                    chapter_act_info["TimeRift_Water_Mafia_Easy"]:setIsAccessible(true)
                end
            end
        
            if chapter_counts[2] >= 3 and act.isAccessible and act.act_name == "chapter3_murder" then
                chapter_act_info["TimeRift_Water_TWreck_Panels"]:setIsAccessible(true)
            end
        
            if chapter_counts[2] >= 5 and act.isAccessible and (act.act_name == "moon_camerasnap" or act.act_name == "moon_parade") then
                chapter_act_info["TimeRift_Water_TWreck_Parade"]:setIsAccessible(true)
            end
            
            local paintings = Tracker:FindObjectForCode("paintings")
            local difficulty = Tracker:FindObjectForCode("difficulty")

            if (act.act_name == "snatcher_boss" and difficulty.CurrentStage == 4) or (act.act_name ~= "snatcher_boss" and act.chapter == 3) and act.isAccessible then
                if chapter_counts[3] >= 3 and (paintings.CurrentStage == 0 or paintings.CurrentStage == 2 or difficulty.CurrentStage >= 0)  then
                    chapter_act_info["TimeRift_Water_Subcon_Hookshot"]:setIsAccessible(true)
                end

                if chapter_counts[3] >= 5 and (paintings.CurrentStage == 0 or paintings.CurrentStage == 4 or difficulty.CurrentStage >= 0)  then
                    chapter_act_info["TimeRift_Water_Subcon_Dwellers"]:setIsAccessible(true)
                end
            end
        
            if chapter_counts[6] >= 2 and act.isAccessible and act.act_name == "Cruise_Boarding" then
                chapter_act_info["Cruise_WaterRift_Slide"]:setIsAccessible(true)
            end
        end
    end
end

--Tracker Handlers

function onItem(index, item_id, item_name, player_number)
    if index <= CUR_INDEX then
        return
    end
    local is_local = player_number == Archipelago.PlayerNumber
    CUR_INDEX = index;
    local v = ITEM_MAPPING[item_id]
    if not v or not v[1] then
        --print(string.format("onItem: could not find item mapping for id %s", item_id))
        return
    end
    local obj = Tracker:FindObjectForCode(v[1])
    if obj then
        if v[2] == "toggle" then
            obj.Active = true
        elseif v[2] == "progressive" then
            if obj.Active then
                obj.CurrentStage = obj.CurrentStage + 1
            else
                obj.Active = true
            end
        elseif v[2] == "consumable" then
            obj.AcquiredCount = obj.AcquiredCount + obj.Increment
            if v[1] == 'yarn' then --extra handling for hat autotracking
                updateYarn(obj)
            elseif v[1] == 'timepiece' then
                updateAccessibleLevelsByTimepieces()
            elseif string.find(v[1], "relic") then
                updateAccessibleLevelsByRelics(v[1], obj.CurrentStage)
            end
        elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
            print(string.format("onItem: unknown item type %s for code %s", v[2], v[1]))
        end
        --print("onItem: Updated item check "..v[1])
    else
        print(string.format("onItem: could not find object for code %s", v[1]))
    end
end

--called when a location gets cleared
function onLocation(location_id, location_name)
    local v = LOCATION_MAPPING[location_id]
    if not v or not v[1] then
        print(string.format("onLocation: could not find location mapping for id %s", location_id))
        return
    end
    local obj = Tracker:FindObjectForCode(v[1])
    if obj then
        if v[1]:sub(1, 1) == "@" then
            obj.AvailableChestCount = obj.AvailableChestCount - 1
        else
            obj.Active = true
        end
        --print("onLocation: checked spot "..v[1])
    else
        print(string.format("onLocation: could not find object for code %s", v[1]))
    end
end

function onEvent(key, new_value, old_value)
    if key == map_key then
        changedMap(new_value, old_value)
    elseif key == completed_acts_key then
        updateAccessibleLevelsByCompletedLevels(new_value)
        updateAccessibleLevelsByTimepieces()
    end
end

Archipelago:AddClearHandler("clear handler", onClear)
Archipelago:AddRetrievedHandler("event handler", onEvent)
Archipelago:AddSetReplyHandler("event launch handler", onEvent)
Archipelago:AddItemHandler("item handler", onItem)
Archipelago:AddLocationHandler("location handler", onLocation)

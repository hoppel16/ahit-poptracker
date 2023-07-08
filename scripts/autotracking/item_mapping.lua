-- use this file to map the AP item ids to your items
-- first value is the code of the target item and the second is the item type (currently only "toggle", "progressive" and "toggle" but feel free to expand for your needs!)
-- here are the SM items as an example: https://github.com/Cyb3RGER/sm_ap_tracker/blob/main/scripts/autotracking/item_mapping.lua
ITEM_MAPPING = {
    [300001] = {"yarn", "consumable"},

    -- Relics
--[[
    [300006] = {"Relic (Burger Patty)", "toggle"},
    [300007] = {"Relic (Burger Cushion)", "toggle"},
    [300008] = {"Relic (Mountain Set)", "toggle"},
    [300009] = {"Relic (Train)", "toggle"},
    [300010] = {"Relic (UFO)", "toggle"},
    [300011] = {"Relic (Cow)", "toggle"},
    [300012] = {"Relic (Cool Cow)", "toggle"},
    [300013] = {"Relic (Tin-foil Hat Cow)", "toggle"},
    [300014] = {"Relic (Crayon Box)", "toggle"},
    [300015] = {"Relic (Red Crayon)", "toggle"},
    [300016] = {"Relic (Blue Crayon)", "toggle"},
    [300017] = {"Relic (Green Crayon)", "toggle"},
]]--

    -- Badges
    -- [300024] = {"Projectile Badge", "toggle"},
    -- [300025] = {"Fast Hatter Badge", "toggle"},
    -- [300026] = {"Hover Badge", "toggle"},
    [300027] = {"hookshot", "toggle"},
    -- [300028] = {"Item Magnet Badge", "toggle"},
    -- [300029] = {"No Bonk Badge", "toggle"},
    -- [300030] = {"Compass Badge", "toggle"},
    [300031] = {"scooter", "toggle"},
    -- [300043] = {"Badge Pin", "toggle"},

    -- Other
    -- [300032] = {"Rift Token", "toggle"},
    [300033] = {"umbrella", "toggle"},

    -- Garbage items
    --[[[300034] = {"25 Pons", "toggle"},
    [300035] = {"50 Pons", "toggle"},
    [300036] = {"100 Pons", "toggle"},
    [300037] = {"Health Pon", "toggle"},

    -- Traps
    [300039] = {"Baby Trap", "toggle"},
    [300040] = {"Laser Trap", "toggle"},
    [300041] = {"Parade Trap", "toggle"},

    -- DLC1 items
    [300018] = {"Relic (Cake Stand)", "toggle"},
    [300019] = {"Relic (Cake)", "toggle"},
    [300020] = {"Relic (Cake Slice)", "toggle"},
    [300021] = {"Relic (Shortcake)", "toggle"},

    -- DLC2 items
    [300022] = {"Relic (Necklace Bust)", "toggle"},
    [300023] = {"Relic (Necklace)", "toggle"},

    -- Death Wish items
    [300038] = {"One-Hit Hero Badge", "toggle"},
    [300042] = {"Camera Badge", "toggle"},
]]--
    --Time Pieces
    [300048] = {"timepiece", "consumable"}, -- Welcome to Mafia Town
    [300049] = {"timepiece", "consumable"}, -- Barrel Battle
    [300050] = {"timepiece", "consumable"}, --She Came from Outer Space
    [300051] = {"timepiece", "consumable"}, -- Down with the Mafia!
    [300052] = {"timepiece", "consumable"}, -- Cheating the Race
    [300053] = {"timepiece", "consumable"}, -- Heating Up Mafia Town
    [300054] = {"timepiece", "consumable"}, -- The Golden Vault
    [300055] = {"timepiece", "consumable"}, -- Time Rift - Sewers
    [300056] = {"timepiece", "consumable"}, -- Time Rift - Bazaar
    [300057] = {"timepiece", "consumable"}, -- Time Rift - Mafia of Cooks

    [300058] = {"timepiece", "consumable"}, -- Dead Bird Studio
    [300059] = {"timepiece", "consumable"}, -- Murder on the Owl Express
    [300060] = {"timepiece", "consumable"}, -- Train Rush
    [300061] = {"timepiece", "consumable"}, -- Picture Perfect
    [300062] = {"timepiece", "consumable"}, -- The Big Parade
    [300063] = {"timepiece", "consumable"}, -- Award Ceremony
    [300064] = {"timepiece", "consumable"}, -- Dead Bird Studio Basement
    [300065] = {"timepiece", "consumable"}, -- Time Rift - The Owl Express
    [300066] = {"timepiece", "consumable"}, -- Time Rift - The Moon
    [300067] = {"timepiece", "consumable"}, -- Time Rift - Dead Bird Studio

    [300068] = {"timepiece", "consumable"}, -- Contractual Obligations
    [300069] = {"timepiece", "consumable"}, -- The Subcon Well
    [300070] = {"timepiece", "consumable"}, -- Toilet of Doom
    [300071] = {"timepiece", "consumable"}, -- Queen Vanessa's Manor
    [300072] = {"timepiece", "consumable"}, -- Mail Delivery Service
    [300073] = {"timepiece", "consumable"}, -- Your Contract Has Expired
    [300074] = {"timepiece", "consumable"}, -- Time Rift - Pipe
    [300075] = {"timepiece", "consumable"}, -- Time Rift - Village
    [300076] = {"timepiece", "consumable"}, -- Time Rift - Sleepy Subcon

    [300077] = {"timepiece", "consumable"}, -- The Birdhouse
    [300078] = {"timepiece", "consumable"}, -- The Lava Cake
    [300079] = {"timepiece", "consumable"}, -- The Twilight Bell
    [300080] = {"timepiece", "consumable"}, -- The Windmill
    [300081] = {"timepiece", "consumable"}, -- The Illness has Spread
    [300082] = {"timepiece", "consumable"}, -- Time Rift - The Twilight Bell
    [300083] = {"timepiece", "consumable"}, -- Time Rift - Curly Tail Trail
    [300084] = {"timepiece", "consumable"}, -- Time Rift - Alpine Skyline

    [300085] = {"timepiece", "consumable"}, -- Time Rift - Gallery
    [300086] = {"timepiece", "consumable"}, -- Time Rift - The Lab

    [300087] = {"timepiece", "consumable"}, -- Time's End - The Finale
--[[
    --Contracts
    [300200] = {"Snatcher's Contract - The Subcon Well", "toggle"},
    [300201] = {"Snatcher's Contract - Toilet of Doom", "toggle"},
    [300202] = {"Snatcher's Contract - Queen Vanessa's Manor", "toggle"},
    [300203] = {"Snatcher's Contract - Mail Delivery Service", "toggle"}
]]--
}
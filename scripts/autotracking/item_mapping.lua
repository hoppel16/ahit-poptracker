-- use this file to map the AP item ids to your items
-- first value is the code of the target item and the second is the item type (currently only "toggle", "progressive" and "toggle" but feel free to expand for your needs!)
-- here are the SM items as an example: https://github.com/Cyb3RGER/sm_ap_tracker/blob/main/scripts/autotracking/item_mapping.lua
ITEM_MAPPING = {
    [2000300001] = {"yarn", "consumable"},
    [2000300002] = {"timepiece", "consumable"},

    [2000300003] = {"paintings", "progressive"},

    -- Hats - for hat items only
    [2000300049] = {"sprint", "toggle"},
    [2000300050] = {"brewer", "toggle"},
    [2000300051] = {"ice", "toggle"},
    [2000300052] = {"dweller", "toggle"},
    [2000300053] = {"timestop", "toggle"},

    -- Relics
    [2000300006] = {"burgerrelic", "progressive"}, --Burger Patty
    [2000300007] = {"burgerrelic", "progressive"}, --Burger Cushion
    [2000300008] = {"trainrelic", "progressive"}, --Mountain Set
    [2000300009] = {"trainrelic", "progressive"}, --Train
    [2000300010] = {"uforelic", "progressive"}, --UFO
    [2000300011] = {"uforelic", "progressive"}, --Cow
    [2000300012] = {"uforelic", "progressive"}, --Cool Cow
    [2000300013] = {"uforelic", "progressive"}, --Tin-foil Hat Cow
    [2000300014] = {"crayonrelic", "progressive"}, --Crayon Box
    [2000300015] = {"crayonrelic", "progressive"}, --Red Crayon
    [2000300016] = {"crayonrelic", "progressive"}, --Blue Crayon
    [2000300017] = {"crayonrelic", "progressive"}, --Green Crayon

    -- Badges
    -- [2000300024] = {"Projectile Badge", "toggle"},
    -- [2000300025] = {"Fast Hatter Badge", "toggle"},
    -- [2000300026] = {"Hover Badge", "toggle"},
    [2000300027] = {"hookshot", "toggle"},
    -- [2000300028] = {"Item Magnet Badge", "toggle"},
    [2000300029] = {"nobonk", "toggle"},
    -- [2000300030] = {"Compass Badge", "toggle"},
    [2000300031] = {"scooter", "toggle"},
    -- [2000300043] = {"Badge Pin", "toggle"},

    -- Other
    -- [2000300032] = {"Rift Token", "toggle"},
    [2000300033] = {"umbrella", "toggle"},

    -- Garbage items
    -- [2000300034] = {"25 Pons", "toggle"},
    -- [2000300035] = {"50 Pons", "toggle"},
    -- [2000300036] = {"100 Pons", "toggle"},
    -- [2000300037] = {"Health Pon", "toggle"},

    -- Traps
    -- [2000300039] = {"Baby Trap", "toggle"},
    -- [2000300040] = {"Laser Trap", "toggle"},
    -- [2000300041] = {"Parade Trap", "toggle"},

    -- DLC1 items
    [2000300018] = {"cakerelic", "progressive"}, --Cake Stand
    [2000300019] = {"cakerelic", "progressive"}, --Cake
    [2000300020] = {"cakerelic", "progressive"}, --Cake Slice
    [2000300021] = {"cakerelic", "progressive"}, --Shortcake

    -- DLC2 items
    [2000300022] = {"jewelryrelic", "toggle"}, --Necklace Bust
    [2000300023] = {"jewelryrelic", "toggle"}, --Necklace

    -- Death Wish items
    -- [2000300038] = {"One-Hit Hero Badge", "toggle"},
    -- [2000300042] = {"Camera Badge", "toggle"},

    --Contracts
    -- [2000300200] = {"Snatcher's Contract - The Subcon Well", "toggle"},
    -- [2000300201] = {"Snatcher's Contract - Toilet of Doom", "toggle"},
    -- [2000300202] = {"Snatcher's Contract - Queen Vanessa's Manor", "toggle"},
    -- [2000300203] = {"Snatcher's Contract - Mail Delivery Service", "toggle"}

    -- Ziplines
    [2000300204] = {"birdzipline", "toggle"},
    [2000300205] = {"cakezipline", "toggle"},
    [2000300206] = {"windmillzipline", "toggle"},
    [2000300207] = {"bellzipline", "toggle"},
}

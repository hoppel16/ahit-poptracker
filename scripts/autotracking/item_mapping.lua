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
    [2000300027] = {"hookshot", "toggle"},
    -- [300028] = {"Item Magnet Badge", "toggle"},
    [2000300029] = {"nobonk", "toggle"},
    -- [300030] = {"Compass Badge", "toggle"},
    [2000300031] = {"scooter", "toggle"},
    -- [300043] = {"Badge Pin", "toggle"},

    -- Other
    -- [300032] = {"Rift Token", "toggle"},
    [2000300033] = {"umbrella", "toggle"},

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

    --Contracts
    [300200] = {"Snatcher's Contract - The Subcon Well", "toggle"},
    [300201] = {"Snatcher's Contract - Toilet of Doom", "toggle"},
    [300202] = {"Snatcher's Contract - Queen Vanessa's Manor", "toggle"},
    [300203] = {"Snatcher's Contract - Mail Delivery Service", "toggle"}
]]--

    -- Ziplines
    [2000300204] = {"birdzipline", "toggle"},
    [2000300205] = {"cakezipline", "toggle"},
    [2000300206] = {"windmillzipline", "toggle"},
    [2000300207] = {"bellzipline", "toggle"},
}

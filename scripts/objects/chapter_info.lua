local Act = require("objects/act")

-- Set up the default chapter information
chapter_act_info = {
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
    Cruise_CaveRift_Aquarium = Act.new(6),
    Cruise_WaterRift_Slide = Act.new(-6),

    MetroFreeRoam = Act.new(7, {"intro"}),
    Metro_Escape = Act.new(7),
    Metro_CaveRift_RumbiFactory = Act.new(7)
}

return chapter_act_info
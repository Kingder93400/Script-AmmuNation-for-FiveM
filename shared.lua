--//  By Kingder#0001
--//  For HebergTonServ.fr

Ammunation = {
    Title = "Ammunation",
    typeESX = "esx:getSharedObject",

    blips_Ammunation = true,
    blips_name = "Ammunation",
    blips_sprite = 110,
    blips_taille = 0.75,
    blips_colour = 59,

    
    TypeMarker = 20,
    MarkerTaille = {x = 0.5, y = 0.5, z = 0.5},
    MarkerColour = {r = 95, g = 73, b = 160},
    MarkerIsJump = false,
    MarkerIsTourned = false,
    MarkerTracker = true,
    TifleForOpenMenu = "<C>Appuyer sur ~p~[E]~s~ pour intéragir</C>",

    Position = {
        vector3(-662.1, -935.3, 20.8),
        vector3(810.35, -2157.39, 29.6),
        vector3(1693.4, 3759.5, 33.7),
        vector3(-330.2, 6083.8, 30.4),
        vector3(252.3, -50.0, 68.9),
        vector3(22.0, -1107.2, 28.8),
        vector3(2567.6, 294.3, 107.7),
        vector3(-1117.5, 2698.6, 17.5),
        vector3(842.4, -1033.4, 27.1),
        vector3(-1306.2, -394.0, 35.6),
        vector3(-3171.97, 1087.4, 19.84)

    },

    active_accessoires = true,
    Accessoires = {
        {Label = 'Kevlar', Value = 'kevlar', Price = 500},
    },

    active_armesblanches = true,
    Blanches = {
        {Label = 'Couteau', Value = 'WEAPON_KNIFE', Price = 1500},
        {Label = 'Machete', Value = 'WEAPON_MACHETE', Price = 1600},
    },

    active_calibre = true,
    Calibre = {
        {Label = 'Pistolet', Value = 'WEAPON_PISTOL', Price = 19000},
        {Label = 'SMG', Value = 'WEAPON_SMG', Price = 22000},
        {Label = 'AK47', Value = 'WEAPON_ASSAULTRIFLE', Price = 49190},
    },

    Permis = {
    use_ppa = true, ------utilisation du PPA ou NON

    }
}
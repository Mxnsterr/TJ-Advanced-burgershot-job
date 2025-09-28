Config = {
    Locations = { -- Locations for shops
        {
            label = 'Vlees',
            name = 'butcher_shop',
            Items = {
                { label = 'Hamburger', name = 'rawburgerpatty', price = 0 },
                { label = 'Veggie burger', name = 'veganburgerpatty', price = 0 },
                { label = 'Nuggets', name = 'nuggets', price = 0 },
            },
            target = {
                coords = vector3(-1203.97, -896.53, 13.89),
                width = 1.5,
                length = 1.2,
                heading = 34,
                minZ = 12.89,
                maxZ = 15.49,
                icon = 'fa-solid fa-box',
                label = 'Open frigo (vlees)',
                job = 'burgershot',
                action = function()
                    if Config.Inventory == 'ox' then
                        exports.ox_inventory:openInventory('shop', { type = 'butcher_shop'})
                    elseif Config.Inventory == 'qb' then
                        TriggerServerEvent('tj_burgershot:openShop', 'butcher_shop')
                    elseif Config.Inventory == 'qs' then
                        TriggerServerEvent('tj_burgershot:openShop', 'butcher_shop')
                    end
                end
            },
        },
        {
            label = 'Groenten',
            name = 'veg_shop',
            Items = {
                { label = 'Aardappel', name = 'potato', price = 0 },
                { label = 'Ui', name = 'onion', price = 0 },
                { label = 'Tomaat', name = 'tomato', price = 0 },
                { label = 'Broodje', name = 'burgerbun', price = 0 },
                { label = 'Cheddar', name = 'cheddar', price = 0 },
                { label = 'Sla', name = 'lettuce', price = 0 },
            },
            target = {
                coords = vector3(-1203.05, -897.86, 13.89),
                width = 1.5,
                length = 1.2,
                heading = 34,
                minZ = 12.89,
                maxZ = 15.49,
                icon = 'fa-solid fa-box',
                label = 'Open frigo (groenten)',
                job = 'burgershot',
                action = function()
                    if Config.Inventory == 'ox' then
                        exports.ox_inventory:openInventory('shop', { type = 'veg_shop'})
                    elseif Config.Inventory == 'qb' then
                        TriggerServerEvent('tj_burgershot:openShop', 'veg_shop')
                    elseif Config.Inventory == 'qs' then
                        TriggerServerEvent('tj_burgershot:openShop', 'veg_shop')
                    end
                end
            },
        }
    },

    Restaurants = {
        {
            job = 'burgershot', -- job required to access burgershot
            stashovi = { -- stashes
                {
                    target = {
                        coords = vector3(-1194.38, -896.78, 13.89),
                        width = 1.6,
                        length = 1.0,
                        heading = 74,
                        minZ = 12.74,
                        maxZ = 14.54,
                        icon = 'fa-solid fa-box',
                        label = 'Gebakken eten',
                        action = function()
                            if Config.Inventory == 'ox' then
                                exports.ox_inventory:openInventory('stash', { id = 'CookedFood'})
                            elseif Config.Inventory == 'qb' then
                                TriggerServerEvent('tj_burgershot:openStash', 'CookedFood')
                            elseif Config.Inventory == 'qs' then
                                TriggerServerEvent('tj_burgershot:openStash', 'CookedFood')
                            end
                        end
                    },
                    label = 'Gebakken eten',
                    name = 'CookedFood',
                    weight = 50000,
                    slots = 50,
                },
                {
                    target = {
                        coords = vector3(-1195.92, -896.37, 13.89),
                        width = 1.6,
                        length = 1.0,
                        heading = 75,
                        minZ = 12.89,
                        maxZ = 14.69,
                        icon = 'fa-solid fa-box',
                        label = 'Gemaakt eten',
                        action = function()
                            if Config.Inventory == 'ox' then
                                exports.ox_inventory:openInventory('stash', { id = 'ReadyFood'})
                            elseif Config.Inventory == 'qb' then
                                TriggerServerEvent('tj_burgershot:openStash', 'ReadyFood')
                            elseif Config.Inventory == 'qs' then
                                TriggerServerEvent('tj_burgershot:openStash', 'ReadyFood')
                            end
                        end
                    },
                    label = 'Gemaakt eten',
                    name = 'ReadyFood',
                    weight = 50000,
                    slots = 50,
                },
            },
            menu = { -- menu options
                {
                    id = 'drinks',
                    label = 'Drank menu',
                    menuName = 'drinksMenu',
                    target = {
                        coords = vector3(-1190.84, -898.97, 13.89),
                        width = 2.6,
                        length = 1.1,
                        heading = 304,
                        minZ = 12.89,
                        maxZ = 15.09,
                        icon = 'fa-solid fa-box',
                        label = 'Maak drank',
                        action = function()
                            CreateMenus()
                            lib.showContext('drinksMenu')
                        end
                    },
                    Items = { -- items in menu
                        {
                            label = 'Cola',
                            item = 'bscoke',
                            price = 80,
                            image = 'https://items.bit-scripts.com/images/drinks/burger-softdrink2.png',
                            description = 'Lekkere verfrissing',
                        },
                        {
                            label = 'Koffie',
                            item = 'bscoffee',
                            price = 80,
                            image = 'https://items.bit-scripts.com/images/food/burger-coffee.png',
                            description = 'Goed om de dag te starten',
                        },
                        {
                            label = 'Milkshake',
                            item = 'milkshake',
                            price = 80,
                            image = 'https://items.bit-scripts.com/images/food/burger-milkshake.png',
                            description = 'Ijskoude verfrissing',
                        }
                    }
                },
                {
                    id = 'food',
                    label = 'Maak eten',
                    menuName = 'making_food',
                    target = {
                        coords = vector3(-1201.26, -895.08, 13.89),
                        width = 2.5,
                        length = 1.65,
                        heading = 34,
                        minZ = 12.69,
                        maxZ = 14.29,
                        icon = 'fa-solid fa-box',
                        label = 'Maak eten',
                        action = function()
                            CreateMenus()
                            lib.showContext('making_food')
                        end
                    },
                    Items = {
                        {
                            label = 'Bleeder',
                            item = 'bleeder',
                            price = 95,
                            image = 'https://items.bit-scripts.com/images/food/burger-bleeder.png',
                            description = 'Onze meest sappige burger',
                            recipe = { -- recipe for making items
                                {
                                    label = 'Broodje',
                                    name = 'burgerbun',
                                    amount = 1,
                                },
                                {
                                    label = 'Hamburger',
                                    name = 'cookedburgerpatty',
                                    amount = 1,
                                },
                                {
                                    label = 'Gesneden sla',
                                    name = 'cutlettuce',
                                    amount = 2,
                                },
                                {
                                    label = 'Cheddar kaas',
                                    name = 'cheddar',
                                    amount = 2,
                                },
                                {
                                    label = 'Gesneden tomaat',
                                    name = 'cuttomato',
                                    amount = 2,
                                }
                            }
                        },
                        {
                            label = 'Heart stopper',
                            item = 'heartstopper',
                            price = 150,
                            image = 'https://items.bit-scripts.com/images/food/burger-heartstopper.png',
                            description = 'Voor als je je lever beu bent',
                            recipe = {
                                {
                                    label = 'Broodje',
                                    name = 'burgerbun',
                                    amount = 1,
                                },
                                {
                                    label = 'Hamburger',
                                    name = 'cookedburgerpatty',
                                    amount = 4,
                                },
                                {
                                    label = 'Gesneden sla',
                                    name = 'cutlettuce',
                                    amount = 3,
                                },
                                {
                                    label = 'Cheddar kaas',
                                    name = 'cheddar',
                                    amount = 5,
                                },
                                {
                                    label = 'Gesneden tomaat',
                                    name = 'cuttomato',
                                    amount = 3,
                                },
                            }
                        },
                        {
                            label = 'Veggie burger',
                            item = 'meatfree',
                            price = 100,
                            image = 'https://items.bit-scripts.com/images/food/dbl_hornburger.png',
                            description = 'Diervriendelijke burger',
                            recipe = {
                                {
                                    label = 'Broodje',
                                    name = 'burgerbun',
                                    amount = 1,
                                },
                                {
                                    label = 'Hamburger',
                                    name = 'cookedveganburgerpatty',
                                    amount = 2,
                                },
                                {
                                    label = 'Gesneden sla',
                                    name = 'cutlettuce',
                                    amount = 2,
                                },
                                {
                                    label = 'Gesneden tomaat',
                                    name = 'cuttomato',
                                    amount = 1,
                                },
                            }
                        },
                        {
                            label = 'Torpedo',
                            item = 'torpedo',
                            price = 95,
                            image = 'https://items.bit-scripts.com/images/food/burger-torpedo.png',
                            description = 'Een lange burger voor een lange dag',
                            recipe = {
                                {
                                    label = 'Broodje',
                                    name = 'burgerbun',
                                    amount = 1,
                                },
                                {
                                    label = 'Hamburger',
                                    name = 'cookedburgerpatty',
                                    amount = 1,
                                },
                                {
                                    label = 'Gesneden tomaat',
                                    name = 'cuttomato',
                                    amount = 2,
                                },
                                {
                                    label = 'Sliced onion',
                                    name = 'cutonion',
                                    amount = 2,
                                },
                            }
                        },
                        {
                            label = 'Moneyshot burger',
                            item = 'moneyshot',
                            price = 200,
                            image = 'https://items.bit-scripts.com/images/food/burger-moneyshot.png',
                            description = 'Voor de rijken onder ons',
                            recipe = {
                                {
                                    label = 'Broodje',
                                    name = 'burgerbun',
                                    amount = 1,
                                },
                                {
                                    label = 'Hamburger',
                                    name = 'cookedburgerpatty',
                                    amount = 2,
                                },
                                {
                                    label = 'Gesneden tomaat',
                                    name = 'cuttomato',
                                    amount = 2,
                                },
                                {
                                    label = 'Sliced onion',
                                    name = 'cutonion',
                                    amount = 2,
                                },
                                {
                                    label = 'Gesneden sla',
                                    name = 'cutlettuce',
                                    amount = 2,
                                },
                                {
                                    label = 'Cheddar kaas',
                                    name = 'cheddar',
                                    amount = 2,
                                },
                            },
                        },
                    },
                },
                {
                    id = 'cutting',
                    label = 'Snijplank',
                    menuName = 'cuttingBoard',
                    target = {
                        coords = vector3(-1194.08, -900.7, 13.89),
                        width = 1.75,
                        length = 1.2,
                        heading = 75,
                        minZ = 12.89,
                        maxZ = 14.29,
                        icon = 'fa-solid fa-box',
                        label = 'Snijplank',
                        action = function()
                            CreateMenus()
                            lib.showContext('cuttingBoard')
                        end
                    },
                    Items = {
                        {
                            label = 'Snij aardappel',
                            item = 'cutpotato',
                            recipe = {
                                {
                                    label = 'Potato',
                                    name = 'potato',
                                    amount = 1,
                                }
                            }
                        },
                        {
                            label = 'Snij ui',
                            item = 'cutonion',
                            recipe = {
                                {
                                    label = 'Onion',
                                    name = 'onion',
                                    amount = 1,
                                }
                            }
                        },
                        {
                            label = 'Snij tomaat',
                            item = 'cuttomato',
                            recipe = {
                                {
                                    label = 'Tomato',
                                    name = 'tomato',
                                    amount = 1,
                                }
                            }
                        },
                        {
                            label = 'Snij sla',
                            item = 'cutlettuce',
                            recipe = {
                                {
                                    label = 'Lettuce',
                                    name = 'lettuce',
                                    amount = 1,
                                }
                            }
                        },
                    },
                },
                {
                    id = 'cooking',
                    label = 'Grill',
                    menuName = 'bbq',
                    target = {
                        coords = vector3(-1195.36, -897.3, 13.89),
                        width = 1.5,
                        length = 0.5,
                        heading = 75,
                        minZ = 12.89,
                        maxZ = 14.09,
                        icon = 'fa-solid fa-box',
                        label = 'Grill',
                        action = function()
                            CreateMenus()
                            lib.showContext('bbq')
                        end
                    },
                    Items = {
                        {
                            label = 'Hamburger',
                            item = 'cookedburgerpatty',
                            recipe = {
                                {
                                    label = 'Rauwe hamburger',
                                    name = 'rawburgerpatty',
                                    amount = 1,
                                },
                            }
                        },
                        {
                            label = 'Veggie burger',
                            item = 'cookedveganburgerpatty',
                            recipe = {
                                {
                                    label = 'Rauwe veggie burger',
                                    name = 'veganburgerpatty',
                                    amount = 1,
                                },
                            }
                        },
                    },
                },
                {
                    id = 'deepfryer',
                    label = 'Friteuse',
                    menuName = 'deepFryer',
                    target = {
                        coords = vector3(-1196.12, -900.11, 13.89),
                        width = 2.5,
                        length = 1.0,
                        heading = 75,
                        minZ = 12.89,
                        maxZ = 14.29,
                        icon = 'fa-solid fa-box',
                        label = 'Friteuse',
                        action = function()
                            CreateMenus()
                            lib.showContext('deepFryer')
                        end
                    },
                    Items = {
                        {
                            label = 'Frieten',
                            item = 'fries',
                            price = 80,
                            image = 'https://items.bit-scripts.com/images/food/burger-fries.png',
                            description = 'Echte verse frieten',
                            recipe = {
                                {
                                    label = 'Gesneden aardappel',
                                    name = 'cutpotato',
                                    amount = 1,
                                },
                            }
                        },
                        {
                            label = 'Chicken nuggets',
                            item = 'cookednuggets',
                            price = 85,
                            image = 'https://items.bit-scripts.com/images/food/burger-shotnuggets.png',
                            description = 'Lekkere kip in een jasje',
                            recipe = {
                                {
                                    label = 'Rauwe chicken nuggets',
                                    name = 'nuggets',
                                    amount = 1,
                                },
                            }
                        },
                    },
                },
            }
        }
    }
}

Config.Framework = 'qb' -- 'esx' or 'qb'

Config.Inventory = 'qb' -- 'ox', 'qb' or 'qs' (qs is not teste so if you find and issue, contact us on discord: https://discord.gg/tbSF4N7eCb)

Config.Target = 'qb' -- 'qb' or 'ox'

Config.Appearance = 'qb' -- 'illenium', 'esx', 'qb', 'fivem'

Config.OrdersLoc = { -- locations for target for orders menu
    {
        coords = vector3(-1197.45, -892.51, 14.1),
        size = vec3(1.0, 1.0, 1.0),
        rotation = 345,
        job = "burgershot"
    },
    {
        coords = vector3(-1195.45, -893.13, 14.1),
        size = vec3(1.0, 1.0, 1.0),
        rotation = 345,
        job = "burgershot"
    },
    {
        coords = vector3(-1193.39, -893.65, 14.1),
        size = vec3(1.0, 1.0, 1.0),
        rotation = 345,
        job = "burgershot"
    },
    {
        coords = vector3(-1191.41, -894.18, 14.1),
        size = vec3(1.0, 1.0, 1.0),
        rotation = 345,
        job = "burgershot"
    },
}

Config.Ordering = { -- target location for ordering menu
    {
        coords = vector3(-1182.32, -891.52, 13.89),
        size = vec3(1.0, 2.0, 1.0),
        rotation = 300.0,
    },
    {
        coords = vector3(-1185.09, -893.48, 13.89),
        size = vec3(1.0, 2.0, 1.0),
        rotation = 300.0,
    },
    {
        coords = vector3(-1189.41, -887.19, 13.89),
        size = vec3(1.0, 2.0, 1.0),
        rotation = 300.0,
    },
    {
        coords = vector3(-1186.49, -885.28, 13.89),
        size = vec3(1.0, 2.0, 1.0),
        rotation = 300.0,
    },
}

Config.Trays = {
    vector3(-1192.83, -893.83, 13.98),
    vector3(-1190.87, -894.34, 13.98),
    vector3(-1194.8, -893.28, 13.98),
    vector3(-1196.84, -892.72, 13.98)
}

Config.Locations2 = {
    Duty = { -- duty location
        coords = vector3(-1198.53, -904.79, 14.4),
        size = {1.0, 3.0},
        heading = 305.0,
        minZ = 10.77834,
        maxZ = 13.87834,
        job = 'burgershot'
    },
    WashingHands = { -- washing hands location
        coords = vector3(-1199.59, -899.69, 14.3),
        size = {1.0, 1.2},
        heading = 35.0,
        minZ = 10.77834,
        maxZ = 13.37834,
        job = 'burgershot'
    },
}

Config.DeliveryPedModel = "MP_M_WareMech_01"
Config.DeliveryPedLocation = vector4(-1187.4, -907.23, 12.63, 96.35)
Config.DeliveryLocations = {
    vector4(-1384.5693, -976.7947, 7.9136, 301.6556), 
    vector4(850.5987, -532.6941, 56.9253, 266.6503), 
    vector4(967.1749, -451.5533, 61.7896, 217.7704), 
    vector4(976.5381, -580.3713, 58.8557, 30.6271), 
    vector4(1138.8711, -773.4993, 56.6444, 357.1865), 
    vector4(-2008.6937, 367.3537, 93.8143, 270.2294), 
    vector4(-1942.8223, 449.6412, 101.9280, 102.8495), 
    vector4(-1974.5514, 630.9545, 121.5362, 245.4470), 
    vector4(-1405.9438, 527.0224, 122.8312, 4.3520), 
}
Config.DeliveryTargetPedModels = {
    "a_f_m_fatbla_01", 
    "a_m_m_business_01",
    "s_m_m_ammucountry", 
}


Config.DeliveryItems = {
    "bleeder",
    "bscoke",
    "fries",
    "cookednuggets",
    "fries",
    "moneyshot",
    "torpedo",
    "meatfree",
    "heartstopper",
    "milkshake",
    "bscoffee"
}

Config.DeliveryMoney = { min = 500, max = 1000 }

Config.DeliveryVehSpawnCoord = vector4(-1163.8986, -891.1992, 13.1227, 123.5508)

Config.DeliveryVehicle = "boxville4"

Config.WardrobePed = "U_M_Y_BurgerDrug_01"
Config.WardrobePedLoc = vector4(-1202.32, -898.89, 12.89, 266.34)

-- Logs

Config.DiscordWebhook = '' -- Paste your discord webhook here

Config.DiscordLogo = 'https://i.postimg.cc/y8hWKkBS/logoTJ.webp' -- Paste url for your logo

Config.LogColor = 2123412 -- Here you can change color of logs (https://gist.github.com/thomasbnt/b6f455e2c7d743b796917fa3c205f812)

Config.ImagesBasePath = "nui://qb-inventory/html/images/" -- Base path for images (for qb-inventory)

Config.AllowSelfOrder = false
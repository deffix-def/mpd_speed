script_author('Denis_Mansory | deffix')
script_properties('work-in-pause')

require 'lib.moonloader'
local imgui = require 'mimgui'
local inicfg = require 'inicfg'
local encoding = require('encoding')
encoding.default = 'CP1251'
local u8 = encoding.UTF8
local tag = "{FF66FF}[mpds_speed]: {FFFFFF}"

local inicfgfile = '..//mpd_speed//mpd_speed.ini'
local inisettings = inicfg.load(inicfg.load({
    settings = {
        active = true,
        posX = 500,
        posY = 700
    }
}, inicfgfile))
inicfg.save(inisettings, inicfgfile)

local car_list = {
    [400] = "Landstalker",
    [401] = "Bravura",
    [402] = "Buffalo",
    [403] = "Linerunner",
    [404] = "Perrenial",
    [405] = "Sentinel",
    [406] = "Dumper",
    [407] = "Firetruck",
    [408] = "Trashmaster",
    [409] = "Stretch",
    [410] = "Manana",
    [411] = "Infernus",
    [412] = "Voodoo",
    [413] = "Pony",
    [414] = "Mule",
    [415] = "Cheetah",
    [416] = "Ambulance",
    [417] = "Leviathan",
    [418] = "Moonbeam",
    [419] = "Esperanto",
    [420] = "Taxi",
    [421] = "Washington",
    [422] = "Bobcat",
    [423] = "Whoopee",
    [424] = "BFInjection",
    [425] = "Hunter",
    [426] = "Premier",
    [427] = "Enforcer",
    [428] = "Securicar",
    [429] = "Banshee",
    [430] = "Predator",
    [431] = "Bus",
    [432] = "Rhino",
    [433] = "Barracks",
    [434] = "Hotknife",
    [435] = "Trailer",
    [436] = "Previon",
    [437] = "Coach",
    [438] = "Cabbie",
    [439] = "Stallion",
    [440] = "Rumpo",
    [441] = "RCBandit",
    [442] = "Romero",
    [443] = "Packer",
    [444] = "Monster",
    [445] = "Admiral",
    [446] = "Squalo",
    [447] = "Seasparrow",
    [448] = "Pizzaboy",
    [449] = "Tram",
    [450] = "Trailer",
    [451] = "Turismo",
    [452] = "Speeder",
    [453] = "Reefer",
    [454] = "Tropic",
    [455] = "Flatbed",
    [456] = "Yankee",
    [457] = "Caddy",
    [458] = "Solair",
    [459] = "Berkley's RC Van",
    [460] = "Skimmer",
    [461] = "PCJ-600",
    [462] = "Faggio",
    [463] = "Freeway",
    [464] = "RCBaron",
    [465] = "RCRaider",
    [466] = "Glendale",
    [467] = "Oceanic",
    [468] = "Sanchez",
    [469] = "Sparrow",
    [470] = "Patriot",
    [471] = "Quad",
    [472] = "Coastguard",
    [473] = "Dinghy",
    [474] = "Hermes",
    [475] = "Sabre",
    [476] = "Rustler",
    [477] = "ZR-350",
    [478] = "Walton",
    [479] = "Regina",
    [480] = "Comet",
    [481] = "BMX",
    [482] = "Burrito",
    [483] = "Camper",
    [484] = "Marquis",
    [485] = "Baggage",
    [486] = "Dozer",
    [487] = "Maverick",
    [488] = "NewsChopper",
    [489] = "Rancher",
    [490] = "FBIRancher",
    [491] = "Virgo",
    [492] = "Greenwood",
    [493] = "Jetmax",
    [494] = "Hotring",
    [495] = "Sandking",
    [496] = "BlistaCompact",
    [497] = "PoliceMaverick",
    [498] = "Boxvillde",
    [499] = "Benson",
    [500] = "Mesa",
    [501] = "RCGoblin",
    [502] = "HotringRacerA",
    [503] = "HotringRacerB",
    [504] = "BloodringBanger",
    [505] = "Rancher",
    [506] = "SuperGT",
    [507] = "Elegant",
    [508] = "Journey",
    [509] = "Bike",
    [510] = "MountainBike",
    [511] = "Beagle",
    [512] = "Cropduster",
    [513] = "Stunt",
    [514] = "Tanker",
    [515] = "Roadtrain",
    [516] = "Nebula",
    [517] = "Majestic",
    [518] = "Buccaneer",
    [519] = "Shamal",
    [520] = "hydra",
    [521] = "FCR-900",
    [522] = "NRG-500",
    [523] = "HPV1000",
    [524] = "CementTruck",
    [525] = "TowTruck",
    [526] = "Fortune",
    [527] = "Cadrona",
    [528] = "FBITruck",
    [529] = "Willard",
    [530] = "Forklift",
    [531] = "Tractor",
    [532] = "Combine",
    [533] = "Feltzer",
    [534] = "Remington",
    [535] = "Slamvan",
    [536] = "Blade",
    [537] = "Freight",
    [538] = "Streak",
    [539] = "Vortex",
    [540] = "Vincent",
    [541] = "Bullet",
    [542] = "Clover",
    [543] = "Sadler",
    [544] = "Firetruck",
    [545] = "Hustler",
    [546] = "Intruder",
    [547] = "Primo",
    [548] = "Cargobob",
    [549] = "Tampa",
    [550] = "Sunrise",
    [551] = "Merit",
    [552] = "Utility",
    [553] = "Nevada",
    [554] = "Yosemite",
    [555] = "Windsor",
    [556] = "Monster",
    [557] = "Monster",
    [558] = "Uranus",
    [559] = "Jester",
    [560] = "Sultan",
    [561] = "Stratum",
    [562] = "Elegy",
    [563] = "Raindance",
    [564] = "RCTiger",
    [565] = "Flash",
    [566] = "Tahoma",
    [567] = "Savanna",
    [568] = "Bandito",
    [569] = "FreightFlat",
    [570] = "StreakCarriage",
    [571] = "Kart",
    [572] = "Mower",
    [573] = "Dune",
    [574] = "Sweeper",
    [575] = "Broadway",
    [576] = "Tornado",
    [577] = "AT-400",
    [578] = "DFT-30",
    [579] = "Huntley",
    [580] = "Stafford",
    [581] = "BF-400",
    [582] = "NewsVan",
    [583] = "Tug",
    [584] = "Trailer",
    [585] = "Emperor",
    [586] = "Wayfarer",
    [587] = "Euros",
    [588] = "Hotdog",
    [589] = "Club",
    [590] = "FreightBox",
    [591] = "Trailer",
    [592] = "Andromada",
    [593] = "Dodo",
    [594] = "RCCam",
    [595] = "Launch",
    [596] = "PoliceCar LS",
    [597] = "PoliceCar SF",
    [598] = "PoliceCar LV",
    [599] = "PoliceRanger",
    [600] = "Picador",
    [601] = "S.W.A.T Tank",
    [602] = "Alpha",
    [603] = "Phoenix",
    [604] = "GlendaleShit",
    [605] = "SadlerShit",
    [606] = "Luggage A",
    [607] = "Luggage B",
    [608] = "Stairs",
    [609] = "Boxville",
    [610] = "Tiller",
    [611] = "UtilityTrailer",
    [1205] = "Dodge Viper",
    [1206] = "Ferrari F430",
    [1326] = "Ferrari FXX K",
    [1699] = "Ford GT",
    [3140] = "Mercedes-Maybach Vision 6",
    [3144] = 'Mercedes-Benz SLR McLaren',
    [5101] = "Bugatti Divo",
    [15600] = "Mitsubishi Starion",
    [15601] = "BMW M1",
    [15602] = "Dodge Challenger",
    [15603] = "Police Car Sheriff",
    [15604] = "DeLorean",
    [15605] = "Ford Mustang 1969",
    [15606] = "Ford Shelby GT500",
    [15607] = "Jeep Wrangler",
    [15608] = "Mercedes Benz W140",
    [15610] = "Неизвестно",
    [15611] = "Chevrolet Caprice",
    [15612] = "Chevrolet Corvette ZR1",
    [15613] = "Lampadati Magnus",
    [15614] = "Toyota Mark II",
    [15615] = "Mercedes Benz G500",
    [15616] = "Chevrolet Corvette C8",
    [15617] = "BMW E38 750I",
    [15618] = "Nissan Skyline X R34",
    [15619] = "OldsMob Cruiser 89",
    [15620] = "Bentley Continental GT",
    [15621] = "Cadillac Eldorado",
    [15622] = "Lincoln Town Car II",
    [15623] = "Lamborgini Urus",
    [15624] = "Pontiac GTO",
    [15625] = "Ford RS200",
    [15626] = "Toyota Crown XI S170",
    [15627] = "Aston Martin DB4GT",
    [15628] = "Bentley Turbo R",
    [15629] = "Morgan Aero 7",
    [15630] = "Mercedes Benz 300 SL",
    [15631] = "Nissan 350Z",
    [15632] = "Jeep Willys MB",
    [15633] = "Ford Explorer 5",
    [15635] = "Mercedes Benz GT 63S",
    [15636] = "Honda S2000",
    [15637] = "Nissan GTR 35",
    [15638] = "Mazda RX8",
    [15639] = "Mazda RX7",
    [15640] = "Toyota Supra A80",
    [15641] = "Toyota Supra A90",
    [15642] = "Yamaha R6 2017",
    [15645] = "Mercedes Benz CLS 63 AMG",
    [15646] = "STRETCH",
    [15647] = "BANANA",
    [15648] = "Bentley Continental GTC",
    [15649] = "Nissan 300ZX",
    [15650] = "Неизвестно",
    [15651] = "Mercedes Benz Maybach S650",
    [15652] = "Skoda Octavia A7",
    [15653] = "BMW M4",
    [15654] = "Audi 80",
    [15655] = "Неизвестно",
    [15656] = "The Mystery Machine",
    [15657] = "Ecto 1",
    [15658] = "Metal Grinder",
    [15659] = "Chevrolet Impala",
    [15660] = "Ferrari Enzo",
    [15661] = "Magnum Opus",
    [15664] = "BMW M3 GTR",
    [15665] = "Toyota Camry 30",
    [15666] = "Toyota Land Cruiser",
    [15667] = "Mitsubishi Lancer ES",
    [15668] = "Фургон Coca-Cola",
    [15669] = "Party Bus 1",
    [15670] = "Party Bus 2",
    [15671] = "Toyota Camry 3.5",
    [15672] = "Mitsubishi Lancer Evo X",
    [15673] = "Сосновый Вор",
    [15674] = "Lamborghini Veneno",
    [15675] = "BMW X6",
    [15676] = "Lamborghini Chiron",
    [15677] = "Lamborghini Veyron",
    [15678] = "Porsche 911 Carrera",
    [15679] = "Koenigsegg Agera",
    [15680] = "Audi R8",
    [15681] = "Mercedes Benz G6x6",
    [15682] = "BMW M4 G82",
    [15683] = "Porsche Carrera GT",
    [15684] = "Lamborghini Centenario",
    [15685] = "Dodge Charger SRT",
    [15686] = "Rolls-Royce Cullinan",
    [15687] = "BMW E34",
    [15688] = "Ford Raptor",
    [15689] = "Lamborghini Huracan",
    [15690] = "LaFerrari",
    [15691] = "BMW M5 F90",
    [15692] = "Pagani Zonda",
    [15693] = "Buzzard"
}
local move = false
local in_veh = false

local ui_meta = {
    __index = function(self, v)
        if v == "switch" then
            local switch = function()
                if self.process and self.process:status() ~= "dead" then
                    return false
                end
                self.timer = os.clock()
                self.state = not self.state

                local function bringFloatTo(from, to, start_time, duration)
                    local timer = os.clock() - start_time
                    if timer >= 0 and timer <= duration then
                        local count = timer / (duration / 100)
                        return from + (count * (to - from) / 100)
                    end
                    return (timer > duration) and to or from
                end

                self.process = lua_thread.create(function()
                    while true do wait(0)
                        local a = bringFloatTo(0.00, 1.00, self.timer, self.duration)
                        self.alpha = self.state and a or 1.00 - a
                        if a == 1.00 then break end
                    end
                end)
                return true
            end
            return switch
        end
 
        if v == "alpha" then
            return self.state and 1.00 or 0.00
        end
    end
}
local mpds = { state = false, duration = 0.4 }
setmetatable(mpds, ui_meta)

function getNearestCarWithDriver()
    local mx, my, mz = getCharCoordinates(PLAYER_PED)
    local num, driver, dist, model, speed = u8'Неизвестно', u8'Неизвестно', 999, u8'Неизвестно', u8'Неизвестно'
    for i, handle in ipairs(getAllChars()) do
        if doesCharExist(handle) and handle ~= PLAYER_PED and isCharInAnyCar(handle) then
            local ped = getDriverOfCar(storeCarCharIsInNoSave(handle))
            if doesCharExist(ped) and ped ~= PLAYER_PED and isCharInAnyCar(ped) then
                if storeCarCharIsInNoSave(ped) ~= storeCarCharIsInNoSave(PLAYER_PED) then
                    local vx, vy, vz = getCharCoordinates(ped)
                    local cDist = getDistanceBetweenCoords3d(mx, my, mz, vx, vy, vz)
                    local r, id = sampGetPlayerIdByCharHandle(ped)
                    if isCharOnScreen(ped) and isLineOfSightClear(mx, my, mz, vx, vy, vz, true, false, false, true, false) then
                        if r and cDist < dist then
                            dist = cDist
                            num = 'S' .. id .. 'AN'
                            if sampIsPlayerConnected(id) then
                                driver = sampGetPlayerNickname(id)
                            else
                                driver = u8"Не найден"
                            end
                            model = car_list[getCarModel(storeCarCharIsInNoSave(ped))] or u8'Неизвестно'
                            speed = math.floor(getCharSpeed(ped) * 3.67)
                        end
                    end
                end
            end
        end
    end
    return num, driver, dist, model, speed
end

function main()
    while not isSampAvailable() do wait(0) end
    sampRegisterChatCommand('pd_speed_move', function()
        move = true
        if not mpds.state then
            mpds.switch()
        end
        sampAddChatMessage(tag .. 'Перемещайте курсор и нажмите ЛКМ, чтобы сохранить расположение.', -1)
    end)
    sampRegisterChatCommand('pd_speed', function()
        local state = inisettings.settings.active and 'Полицейский измеритель скорости отключен!' or 'Полицейский измеритель скорости включен!'
        if inisettings.settings.active then
            if mpds.state then
                mpds.switch()
            end
        else
            if isCharInAnyCar(PLAYER_PED) and not isCharOnAnyBike(PLAYER_PED) and not isCharInAnyBoat(PLAYER_PED) and not isCharInAnyHeli(PLAYER_PED) and not isCharInAnyPlane(PLAYER_PED) then
                if not mpds.state and in_veh then
                    mpds.switch()
                end
            end
        end
        sampAddChatMessage(tag .. state, -1)
        inisettings.settings.active = not inisettings.settings.active
        inicfg.save(inisettings, inicfgfile)
    end)
    while true do
        wait(0)
        if isCharInAnyCar(PLAYER_PED) and not isCharOnAnyBike(PLAYER_PED) and not isCharInAnyBoat(PLAYER_PED) and not isCharInAnyHeli(PLAYER_PED) and not isCharInAnyPlane(PLAYER_PED) then
            if inisettings.settings.active then
                if not in_veh then
                    in_veh = true
                    if not mpds.state then
                        mpds.switch()
                    end
                end
            end
        else
            if in_veh then
                in_veh = false
                if mpds.state then
                    mpds.switch()
                end
            end
        end
        if move then
            sampToggleCursor(true, true)
            local x, y = getCursorPos()
            inisettings.settings.posX = x
            inisettings.settings.posY = y
            if isKeyJustPressed(0x01) then
                sampToggleCursor(false, false)
                move = false
                if not in_veh then
                    mpds.switch()
                end
                sampAddChatMessage(tag .. 'Местоположение полицейского измерителя скорости успешно изменено.', -1)
                inicfg.save(inisettings, inicfgfile)
            end
        end
    end
end

imgui.OnFrame(function()
    return mpds.alpha > 0.00 and (not isGamePaused() and not isPauseMenuActive())
end, function(player)
        player.HideCursor = true
        imgui.PushStyleVarFloat(imgui.StyleVar.Alpha, mpds.alpha)
        imgui.SetNextWindowPos(imgui.ImVec2(inisettings.settings.posX, inisettings.settings.posY), imgui.Cond.Always, imgui.ImVec2(1, 1))
        imgui.SetNextWindowSize(imgui.ImVec2(300, 125), imgui.Cond.Always)
        imgui.Begin('pd', _, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoTitleBar)
        local p = imgui.GetCursorScreenPos()
        local dl = imgui.GetWindowDrawList()
        dl:AddRectFilledMultiColor(p, imgui.ImVec2(p.x + 300, p.y + 125), imgui.ColorConvertFloat4ToU32({0.4, 0.0, 0.0, mpds.alpha}), imgui.ColorConvertFloat4ToU32({0.1, 0.0, 0.0, mpds.alpha}), imgui.ColorConvertFloat4ToU32({0.1, 0.0, 0.0, mpds.alpha}), imgui.ColorConvertFloat4ToU32({0.1, 0.0, 0.0, mpds.alpha}))
        imgui.SetCursorPosX((imgui.GetWindowSize().x - imgui.CalcTextSize(u8('Полицейский измеритель скорости')).x) / 2)
        imgui.SetCursorPosY(5)
        imgui.Text(u8('Полицейский измеритель скорости'))
        imgui.Separator()
        local num, driver, dist, model, speed = getNearestCarWithDriver()
        if dist == 999 then
            dist = u8'Неизвестно'
        else
            dist = math.floor(dist)
        end
        imgui.SetCursorPosX(3)
        imgui.Text(u8'Модель автомобиля: ' .. model)
        imgui.SetCursorPosX(3)
        imgui.Text(u8'Номер автомобиля: ' .. num)
        imgui.SetCursorPosX(3)
        imgui.Text(u8'Водитель: ' .. driver)
        imgui.SetCursorPosX(3)
        imgui.Text(u8'Расстояние: ' .. dist)
        imgui.SetCursorPosX(3)
        imgui.Text(u8'Скорость: ' .. speed)
        imgui.End()
        imgui.PopStyleVar()
    end
)

imgui.OnInitialize(function()
    local ImVec4 = imgui.ImVec4
    imgui.SwitchContext()
    imgui.GetStyle().Colors[imgui.Col.FrameBg]                = ImVec4(0.4, 0.0, 0.0, 1)
    imgui.GetStyle().Colors[imgui.Col.FrameBgHovered]         = ImVec4(0.5, 0, 0.0, 1)
    imgui.GetStyle().Colors[imgui.Col.FrameBgActive]          = ImVec4(0.6, 0, 0.0, 1)
    imgui.GetStyle().Colors[imgui.Col.TitleBg]                = ImVec4(0.60, 0.50, 0.70, 1)
    imgui.GetStyle().Colors[imgui.Col.TitleBgActive]          = ImVec4(0.65, 0.55, 0.75, 1)
    imgui.GetStyle().Colors[imgui.Col.TitleBgCollapsed]       = ImVec4(0.50, 0.45, 0.65, 0.51)
    imgui.GetStyle().Colors[imgui.Col.CheckMark]              = ImVec4(0.80, 0.0, 0.0, 1)
    imgui.GetStyle().Colors[imgui.Col.SliderGrab]             = ImVec4(0.75, 0.60, 0.85, 1)
    imgui.GetStyle().Colors[imgui.Col.SliderGrabActive]       = ImVec4(0.80, 0.65, 0.90, 1)
    imgui.GetStyle().Colors[imgui.Col.Button]                 = ImVec4(0.6, 0.00, 0, 1)
    imgui.GetStyle().Colors[imgui.Col.ButtonHovered]          = ImVec4(0.75, 0.00, 0, 1)
    imgui.GetStyle().Colors[imgui.Col.ButtonActive]           = ImVec4(0.9, 0.00, 0, 1)
    imgui.GetStyle().Colors[imgui.Col.Header]                 = ImVec4(0.30, 0.0, 0.0, 1)
    imgui.GetStyle().Colors[imgui.Col.HeaderHovered]          = ImVec4(0.4, 0.0, 0, 1)
    imgui.GetStyle().Colors[imgui.Col.HeaderActive]           = ImVec4(0.5, 0.0, 0.0, 1)
    imgui.GetStyle().Colors[imgui.Col.Separator]              = ImVec4(0.8, 0.0, 0.0, 1)
    imgui.GetStyle().Colors[imgui.Col.SeparatorHovered]       = ImVec4(0.9, 0.0, 0.0, 1)
    imgui.GetStyle().Colors[imgui.Col.SeparatorActive]        = ImVec4(1, 0.0, 0.0, 1)
    imgui.GetStyle().Colors[imgui.Col.ResizeGrip]             = ImVec4(0.50, 0.0, 0.0, 1)
    imgui.GetStyle().Colors[imgui.Col.ResizeGripHovered]      = ImVec4(0.6, 0, 0, 1)
    imgui.GetStyle().Colors[imgui.Col.ResizeGripActive]       = ImVec4(0.70, 0.0, 0, 1)
    imgui.GetStyle().Colors[imgui.Col.TextSelectedBg]         = ImVec4(0.70, 0.60, 0.80, 0.35)
    imgui.GetStyle().Colors[imgui.Col.Text]                   = ImVec4(1, 1, 1, 1)
    imgui.GetStyle().Colors[imgui.Col.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1)
    imgui.GetStyle().Colors[imgui.Col.WindowBg]               = ImVec4(0.95, 0.10, 0.30, 0.7)
    imgui.GetStyle().Colors[imgui.Col.ChildBg]                = ImVec4(0.9, 0.10, 0.30, 0)
    imgui.GetStyle().Colors[imgui.Col.PopupBg]                = ImVec4(0.20, 0.0, 0.0, 1)
    imgui.GetStyle().Colors[imgui.Col.Border]                 = ImVec4(0.70, 0.0, 0.0, 1)
    imgui.GetStyle().Colors[imgui.Col.BorderShadow]           = ImVec4(0, 0, 0, 0)
    imgui.GetStyle().Colors[imgui.Col.MenuBarBg]              = ImVec4(0.90, 0.30, 0.50, 1)
    imgui.GetStyle().Colors[imgui.Col.ScrollbarBg]            = ImVec4(0, 0, 0, 0.9)
    imgui.GetStyle().Colors[imgui.Col.ScrollbarGrab]          = ImVec4(0.2, 0.00, 0, 1)
    imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabHovered]   = ImVec4(0.3, 0.0, 0, 1)
    imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabActive]    = ImVec4(0.4, 0.0, 0.0, 1)
    imgui.GetStyle().Colors[imgui.Col.PlotLines]              = ImVec4(0.80, 0.0, 0.00, 1)
    imgui.GetStyle().Colors[imgui.Col.PlotLinesHovered]       = ImVec4(1.00, 0.0, 0.00, 1)
    imgui.GetStyle().Colors[imgui.Col.PlotHistogram]          = ImVec4(0.80, 0.0, 0.00, 1)
    imgui.GetStyle().Colors[imgui.Col.PlotHistogramHovered]   = ImVec4(1.00, 0.0, 0.00, 1)
    -- == Декор == --
    imgui.GetStyle().WindowPadding = imgui.ImVec2(0, 0)
    imgui.GetStyle().FramePadding = imgui.ImVec2(3.5, 3.9)
    imgui.GetStyle().ItemSpacing = imgui.ImVec2(5, 5)
    imgui.GetStyle().ItemInnerSpacing = imgui.ImVec2(2, 2)
    imgui.GetStyle().TouchExtraPadding = imgui.ImVec2(0, 0)
    imgui.GetStyle().WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
    imgui.GetStyle().IndentSpacing = 0
    imgui.GetStyle().ScrollbarSize = 15
    imgui.GetStyle().GrabMinSize = 13
    imgui.GetStyle().WindowBorderSize = 0
    imgui.GetStyle().ChildBorderSize = 2
    imgui.GetStyle().PopupBorderSize = 2
    imgui.GetStyle().FrameBorderSize = 2
    imgui.GetStyle().TabBorderSize = 2
    imgui.GetStyle().WindowRounding = 15
    imgui.GetStyle().ChildRounding = 2
    imgui.GetStyle().FrameRounding = 2
    imgui.GetStyle().PopupRounding = 2
    imgui.GetStyle().ScrollbarRounding = 1
    imgui.GetStyle().GrabRounding = 1
    imgui.GetStyle().TabRounding = 1

    local glyph_ranges = imgui.GetIO().Fonts:GetGlyphRangesCyrillic()
    imgui.GetIO().Fonts:AddFontFromFileTTF(getFolderPath(0x14) .. '\\trebucbd.ttf', 16, nil, glyph_ranges)
end)
return function(DSSModName, DSSCoreVersion, MenuProvider)

local dssmod = RegisterMod(DSSModName, 1)
local game = Game()
local sfx = SFXManager()

local dssmenu = DeadSeaScrollsMenu

local mfdat = {}
mfdat['a'] = {0,4,7,11};   mfdat['b'] = {1,4,8,12};   mfdat['c'] = {2,4,7,10};
mfdat['d'] = {3,4,8,12};   mfdat['e'] = {4,4,7,10};   mfdat['f'] = {5,4,6,9};
mfdat['g'] = {6,5,8,12};   mfdat['h'] = {7,4,8,11};   mfdat['i'] = {8,1,3,4};
mfdat['j'] = {9,4,7,11};   mfdat['k'] = {10,4,6,9};   mfdat['l'] = {11,4,8,10};
mfdat['m'] = {12,5,8,13};  mfdat['n'] = {13,4,8,10};  mfdat['o'] = {14,5,10,12};
mfdat['p'] = {15,4,7,10};  mfdat['q'] = {16,5,9,13};  mfdat['r'] = {17,4,7,10};
mfdat['s'] = {18,4,6,10};  mfdat['t'] = {19,4,7,10};  mfdat['u'] = {20,4,7,13};
mfdat['v'] = {21,5,8,13};  mfdat['w'] = {22,5,11,16}; mfdat['x'] = {23,4,6,12};
mfdat['y'] = {24,4,7,10};  mfdat['z'] = {25,4,6,9};   mfdat['0'] = {26,4,8,12};
mfdat['1'] = {27,4,8,10};  mfdat['2'] = {28,4,8,10};  mfdat['3'] = {29,4,8,10};
mfdat['4'] = {30,4,7,10};  mfdat['5'] = {31,4,8,9};   mfdat['6'] = {32,4,8,10};
mfdat['7'] = {33,4,8,10};  mfdat['8'] = {34,4,8,9};   mfdat['9'] = {35,4,8,9};
mfdat["'"] = {36,1,2,3};   mfdat['"'] = {37,3,4,5};   mfdat[':'] = {38,1,3,4};
mfdat['/'] = {39,3,6,8};	 mfdat['.'] = {40,1,2,4};  	mfdat[','] = {41,2,3,4};
mfdat['!'] = {42,2,4,6};   mfdat['?'] = {43,3,6,8};	  mfdat['['] = {44,2,4,6};
mfdat[']'] = {45,2,4,6};   mfdat['('] = {44,2,4,6};   mfdat[')'] = {45,2,4,6};
mfdat['$'] = {46,4,6,8};	 mfdat['C'] = {47,5,6,8};   mfdat['+'] = {48,5,6,8};
mfdat['-'] = {49,4,6,10};   mfdat['X'] = {50,5,6,8};   mfdat['D'] = {51,5,6,8};
mfdat['%'] = {52,4,6,8}; 	 mfdat['_'] = {54,2,4,5};		mfdat[' '] = {54,4,6,8};
mfdat['='] = {53,5,8,12};

local menusounds = {
  Pop2 = {Sound = Isaac.GetSoundIdByName("deadseascrolls_pop"), PitchVariance = .1},
  Pop3 = {Sound = Isaac.GetSoundIdByName("deadseascrolls_pop"), Pitch = .8, PitchVariance = .1},
  Open = {Sound = Isaac.GetSoundIdByName("deadseascrolls_whoosh"), Volume = .5, PitchVariance = .1},
  Close = {Sound = Isaac.GetSoundIdByName("deadseascrolls_whoosh"), Volume = .5, Pitch = .8, PitchVariance = .1}
}

local PlaySound
PlaySound = function(...) -- A simpler method to play sounds, allows ordered or paired tables.
    local args = {...}

    for i = 1, 6 do -- table.remove won't work to move values down if values inbetween are nil
        if args[i] == nil then
            args[i] = -1111
        else
            allNil = false
        end
    end

    local npc, tbl

    if type(args[1]) == "userdata" and args[1].Type then
        npc = args[1]:ToNPC()
        table.remove(args, 1)
    end

    if type(args[1]) == "table" then
        tbl = args[1]
        table.remove(args, 1)
        if type(tbl[1]) == "table" then
            for _, sound in ipairs(tbl) do
                if npc then
                    PlaySound(npc, sound)
                else
                    PlaySound(sound)
                end
            end

            return
        end
    elseif args[1] == -1111 then
        return
    end

    local soundArgs = {}
    for i, v in ipairs(args) do
        if v == -1111 then
            args[i] = nil
        end

        soundArgs[i] = args[i]
    end

    if tbl then
        if #tbl > 0 then
            soundArgs = tbl
        else
            soundArgs = {tbl.Sound, tbl.Volume, tbl.Delay, tbl.Loop, tbl.Pitch}
        end

        -- If there are any remaining args after npc and table are removed, they override volume, delay, loop, and pitch
        for i = 1, 4 do
            if args[i] ~= nil then
                soundArgs[i + 1] = args[i]
            end
        end
    end

    soundArgs[2] = soundArgs[2] or 1
    soundArgs[3] = soundArgs[3] or 0
    soundArgs[4] = soundArgs[4] or false
    soundArgs[5] = soundArgs[5] or 1

    if tbl and tbl.PitchVariance then
        local variance = math.random()
        if tbl.NegativeVariance then
            variance = variance - 0.5
        end

        soundArgs[5] = soundArgs[5] + variance * tbl.PitchVariance
    end

    if npc then
        npc:PlaySound(table.unpack(soundArgs))
    else
        sfx:Play(table.unpack(soundArgs))
    end
end


local function getScreenBottomRight()
    return game:GetRoom():GetRenderSurfaceTopLeft() * 2 + Vector(442,286)
end

local function getScreenCenterPosition()
    return getScreenBottomRight() / 2
end

local function approach(aa, bb, cc)
	cc = cc or 1
	if bb > aa then
		return math.min(aa + cc, bb)
	elseif bb < aa then
		return math.max(aa - cc, bb)
	else
		return bb
	end
end

local function Lerp(aa, bb, cc)
    return (aa + (bb - aa) * cc)
end

local function IsIn(tbl, val)
    for _, v in ipairs(tbl) do
        if v == val then
            return true
        end
    end

    return false
end

local function KeysShareVals(tbl1, tbl2)
    if not tbl1 or not tbl2 then
        return false
    end

    for k, v in pairs(tbl1) do
        if tbl2[k] ~= v then
            return false
        end
    end

    for k, v in pairs(tbl2) do
        if tbl1[k] ~= v then
            return false
        end
    end

    return true
end

local function percentify(num, multi, max, wholeOnly)
    num = math.floor(num * multi)
    local str = tostring(num)
    if num >= 10000 then
        return max
    elseif num >= 1000 then
        str = string.sub(str, 1, 2) .. "." .. string.sub(str, 3, 4)
    elseif num >= 100 then
        str = "0" .. string.sub(str, 1, 1) .. "." .. string.sub(str, 2, 3)
    elseif num >= 10 then
        str = "00." .. str
    else
        str = "00.0" .. str
    end

    if wholeOnly then
        str = string.sub(str, 1, 2)
        if string.sub(str, 1, 1) == "0" then
            str = string.sub(str, 2, 2)
        end
    end

    str = str .. "%"
    return str
end

local function roundOff(num, multiplier)
    multiplier = multiplier or 100
    return math.floor(num * multiplier) / multiplier
end

local function SafeKeyboardTriggered(key, controllerIndex)
    return Input.IsButtonTriggered(key, controllerIndex) and not Input.IsButtonTriggered(key % 32, controllerIndex)
end

local function AnyKeyboardTriggered(key, controllerIndex)
    if SafeKeyboardTriggered(key, controllerIndex) then
        return true
    end

    for i = 0, 4 do
        if SafeKeyboardTriggered(key, i) then
            return true
        end
    end

    return false
end

local function SafeKeyboardPressed(key, controllerIndex)
    return Input.IsButtonPressed(key, controllerIndex) and not Input.IsButtonPressed(key % 32, controllerIndex)
end

local inputButtonNames = {
    [-1] = "none",

    [0] = "dpad left",
    [1] = "dpad right",
    [2] = "dpad up",
    [3] = "dpad down",
    [4] = "action down",
    [5] = "action right",
    [6] = "action left",
    [7] = "action up",
    [8] = "left bumper",
    [9] = "left trigger",
    [10] = "left stick",
    [11] = "right bumper",
    [12] = "right trigger",
    [13] = "right stick",
    [14] = "select",
    [15] = "start",

    [Keyboard.KEY_KP_0] = "numpad 0",
    [Keyboard.KEY_KP_1] = "numpad 1",
    [Keyboard.KEY_KP_2] = "numpad 2",
    [Keyboard.KEY_KP_3] = "numpad 3",
    [Keyboard.KEY_KP_4] = "numpad 4",
    [Keyboard.KEY_KP_5] = "numpad 5",
    [Keyboard.KEY_KP_6] = "numpad 6",
    [Keyboard.KEY_KP_7] = "numpad 7",
    [Keyboard.KEY_KP_8] = "numpad 8",
    [Keyboard.KEY_KP_9] = "numpad 9",
    [Keyboard.KEY_KP_DECIMAL] = "numpad decimal",
    [Keyboard.KEY_KP_DIVIDE] = "numpad divide",
    [Keyboard.KEY_KP_MULTIPLY] = "numpad multiply",
    [Keyboard.KEY_KP_SUBTRACT] = "numpad subtract",
    [Keyboard.KEY_KP_ADD] = "numpad add",
    [Keyboard.KEY_KP_ENTER] = "numpad enter",
    [Keyboard.KEY_KP_EQUAL] = "numpad equal",
}

for k, v in pairs(Keyboard) do
    if not inputButtonNames[v] then
        local name = string.sub(k, 5)
        name = name:gsub("_", " ")
        name = name:lower()
        inputButtonNames[v] = name
    end
end

local function GetInputtedButtons(controllerIndex, press)
    local func = SafeKeyboardTriggered
    if press then
        func = SafeKeyboardPressed
    end

    local inputs = {}
    for i = 0, 15 do
        if func(i, controllerIndex) then
            inputs[#inputs + 1] = i
        end
    end

    for name, key in pairs(Keyboard) do
        if func(key, controllerIndex) then
            inputs[#inputs + 1] = key
        end
    end

    return inputs
end

local menuinput
local function InitializeInput()
    if not menuinput then
        menuinput = {
            raw = {
                up = -100, down = -100, left = -100, right = -100,
            },
            menu = {
                up = false, down = false, left = false, right = false,
                toggle = false, confirm = false, back = false, keybinding = false,
            },
        }
    end
end

function dssmod.getInput(pnum)
    local player = Isaac.GetPlayer(pnum)

    InitializeInput()

    local input = menuinput
    local indx = player.ControllerIndex

    local raw = input.raw
    local menu = input.menu
    if not game:IsPaused() then
        local moveinput = player:GetMovementInput()
        local moveinputang = moveinput:GetAngleDegrees()
        local digitalmovedir = math.floor(4 + (moveinputang + 45) / 90) % 4
        local movelen = moveinput:Length()

        if (movelen > .3 and digitalmovedir == 0) or
        SafeKeyboardPressed(Keyboard.KEY_RIGHT, indx) or SafeKeyboardPressed(Keyboard.KEY_D, indx) then
            raw.right = math.max(raw.right, 0) + 1
        else
            raw.right = math.max(-100, math.min(1, raw.right) - 1)
        end

        if (movelen > .3 and digitalmovedir) == 1 or
        SafeKeyboardPressed(Keyboard.KEY_DOWN, indx) or SafeKeyboardPressed(Keyboard.KEY_S, indx) then
            raw.down = math.max(raw.down, 0) + 1
        else
            raw.down = math.max(-100, math.min(1, raw.down) - 1)
        end
        if (movelen > .3 and digitalmovedir) == 2 or
        SafeKeyboardPressed(Keyboard.KEY_LEFT, indx) or SafeKeyboardPressed(Keyboard.KEY_A, indx) then
            raw.left = math.max(raw.left, 0) + 1
        else
            raw.left = math.max(-100, math.min(1, raw.left) - 1)
        end
        if (movelen > .3 and digitalmovedir) == 3 or
        SafeKeyboardPressed(Keyboard.KEY_UP, indx) or SafeKeyboardPressed(Keyboard.KEY_W, indx) then
            raw.up = math.max(raw.up, 0) + 1
        else
            raw.up = math.max(-100, math.min(1, raw.up) - 1)
        end

        local dssmenu = DeadSeaScrollsMenu
        local ctog = dssmenu.GetGamepadToggleSetting() or 1

        local baseKey, safeKey = dssmenu.GetMenuKeybindSetting(), Keyboard.KEY_F1

        --toggle
        menu.toggle = AnyKeyboardTriggered(safeKey, indx) or
                      (ctog <= 2 and Input.IsButtonTriggered(10, indx)) or
                      ((ctog == 1 or ctog == 3) and Input.IsButtonTriggered(13, indx)) or
                      (ctog == 4 and Input.IsButtonTriggered(10, indx) and Input.IsButtonPressed(13, indx)) or
                      (ctog == 4 and Input.IsButtonTriggered(13, indx) and Input.IsButtonPressed(10, indx)) or
                      (ctog == 5 and Input.IsButtonTriggered(14, indx)) or
                      (ctog == 6 and Input.IsButtonPressed(12, indx) and Input.IsButtonTriggered(14, indx))

        if baseKey ~= -1 then
            menu.toggle = menu.toggle or AnyKeyboardTriggered(baseKey, indx)
        end

        --confirm
        menu.confirm = SafeKeyboardTriggered(Keyboard.KEY_ENTER, indx) or
                       SafeKeyboardTriggered(Keyboard.KEY_SPACE, indx) or
                       SafeKeyboardTriggered(Keyboard.KEY_E, indx) or
                       Input.IsButtonTriggered(4, indx) or
                       Input.IsButtonTriggered(7, indx)

        --back
        menu.back = SafeKeyboardTriggered(Keyboard.KEY_BACKSPACE, indx) or
                    SafeKeyboardTriggered(Keyboard.KEY_Q, indx) or
                    Input.IsButtonTriggered(5, indx) or
                    Input.IsButtonTriggered(6, indx)

        --directions
        menu.up = raw.up == 1 or (raw.up >= 18 and raw.up % 6 == 0)
        menu.down = raw.down == 1 or (raw.down >= 18 and raw.down % 6 == 0)
        menu.left = raw.left == 1 or (raw.left >= 18 and raw.left % 6 == 0)
        menu.right = raw.right == 1 or (raw.right >= 18 and raw.right % 6 == 0)

        menu.keybind = nil
        if menu.keybinding then
            menu.toggle = false
            menu.confirm = false
            menu.back = false
            menu.up = false
            menu.down = false
            menu.left = false
            menu.right = false
            local buttons = GetInputtedButtons(indx)
            if #buttons == 1 then
                menu.keybind = buttons[1]
            end
        end
    end
end

function dssmod.setOption(variable, setting, button, item, directorykey)
	if setting then
        if variable then
            directorykey.Settings[variable] = setting
            directorykey.SettingsChanged = true
        end

        if button and button.changefunc then
            button.changefunc(button, item)
        end
	end
end

local function hsvToRgb(h, s, v, a) --credit EmmanuelOga
  local r, g, b

  local i = math.floor(h * 6);
  local f = h * 6 - i;
  local p = v * (1 - s);
  local q = v * (1 - f * s);
  local t = v * (1 - (1 - f) * s);

  i = i % 6

  if i == 0 then r, g, b = v, t, p
  elseif i == 1 then r, g, b = q, v, p
  elseif i == 2 then r, g, b = p, v, t
  elseif i == 3 then r, g, b = p, q, v
  elseif i == 4 then r, g, b = t, p, v
  elseif i == 5 then r, g, b = v, p, q
  end

  return Color(r, g, b, a, 0, 0, 0)
end

local function bselToXY(bsel, gridx, buttons)
    local x, y = 1, 1
    local bselX, bselY
    local maxX = {}
    for i, button in ipairs(buttons) do
        if i == bsel then
            bselX, bselY = x, y
        end

        if i == #buttons then
            maxX[y] = x
            return bselX, bselY, maxX, y
        end

        local prevX = x
        x = x + (button.fullrow and gridx or 1)
        if x > gridx then
            maxX[y] = prevX
            y = y + 1
            x = 1
        end
    end
end

local function xyToBsel(x, y, gridx, buttons)
    local x2, y2 = 1, 1
    for i, button in ipairs(buttons) do
        if x2 == x and y2 == y then
            return i
        end

        x2 = x2 + (button.fullrow and gridx or 1)
        if x2 > gridx then
            y2 = y2 + 1
            x2 = 1
        end
    end
end

local menuroots = {
    main = {
        offset = Vector(-42, 10),
        titleoffset = Vector(0, -74), -- (0, -74)
        bounds = {-86, -62, 86, 79}, -- min X, min Y, max X, max Y
        height = 141,
        topspacing = 16,
        bottomspacing = 0,
        scrollersymX = -94,
        scrollersymYTop = -46,
        scrollersymYBottom = 78
    },
    tooltip = {
        offset = Vector(132, 6),
        --bounds = {-59, -52, 58, 64},
        topspacing = 0,
        bottomspacing = 0,
        height = 118
    }
}

local fontspacers = {8, 12, 16}


local function getMenuStringLength(str, fsize)
    fsize = fsize + 1
    local length = 0
    local chr = {}
    for i = 1, string.len(str) do
        local sub = string.sub(str, i, i)
        if not mfdat[sub] then
            Isaac.ConsoleOutput("Invalid character " .. sub .. "!\n")
            sub = '!'
        end

        local len = mfdat[sub][fsize]
        table.insert(chr, {sub, length})
        length = length + len + 1
    end

    return length, chr
end

function dssmod.generateDynamicSet(base, selected, fsize, clr, shine, nocursor)
    local dssmenu = DeadSeaScrollsMenu
    local menupal = dssmenu.GetPalette()
    local rainbow = menupal.Rainbow
    fsize = base.fsize or fsize or 2
    local clr1 = menupal[2]
    local clr2 = menupal[3]
    local useclr = base.clr or clr or 2
    useclr = menupal[useclr]
    local shine = base.shine or shine

    local height = 0
    local width = {} -- since buttons are arranged vertically, only the widest part of the button should count for width

    local dynamicset = {type = 'dynamicset', set = {}, pos = base.pos or Vector(0, 0)}

    local modules = {}
    if base.strpair then
        local part = base.strpair[1]
        modules[#modules + 1] = {type = 'str', str = part.str, height = 0, halign = -1, color = useclr, alpha = part.alpha, shine = shine}

        local part = base.strpair[2]
        modules[#modules + 1] = {type = 'str', str = part.str, halign = 1, color = clr2, alpha = part.alpha, shine = shine, select = false}
    elseif base.str then
        modules[#modules + 1] = {type = 'str', str = base.str, color = useclr, alpha = 1, shine = shine}

        if base.substr then
            local subsize = base.substr.size or math.max(1, fsize - 1)
            modules[#modules + 1] = {type = 'str', str = base.substr.str, size = subsize, color = clr2, alpha = base.substr.alpha or .8, shine = shine, pos = Vector(0, -2), select = false}
        end
    elseif base.strset then
        for i, str in ipairs(base.strset) do
            local newstr = {type = 'str', str = str}
            if i ~= 1 then
                newstr.select = false
            end

            modules[#modules + 1] = newstr
        end
    elseif base.spr then
        modules[#modules + 1] = {type = 'spr', fontcolor = useclr, color = base.spr.color, sprite = base.spr.sprite, center = base.spr.center, centerx = base.spr.centerx, centery = base.spr.centery, width = base.spr.width, height = base.spr.height, float = base.spr.float, shadow = base.spr.shadow, invisible = base.spr.invisible, scale = base.spr.scale}
    end

    if base.variable or base.setting then
        local sizedown = math.max(1, fsize - 1)
        local setting = {type = 'str', settingscursor = not base.keybind, size = sizedown, color = clr2, alpha = .8, shine = shine, pos = Vector(0, -2), select = false}
        setting.min = base.min
        setting.max = base.max
        setting.setting = base.setting
        if base.slider then
            setting.slider = true
            setting.increment = base.increment
            setting.str = ''
            for i = 1, math.ceil(base.max / base.increment) do
                setting.str = setting.str..'i'
            end
        elseif base.choices then
            setting.choices = #base.choices
            setting.str = base.choices[base.setting]
        elseif base.max then
            setting.str = (base.pref or '')..base.setting..(base.suf or '')
        elseif base.keybind then
            if base.keybinding then
                setting.str = '[awaiting input]'
            else
                setting.str = '[' .. inputButtonNames[base.setting] .. ']'
            end
        end

        modules[#modules + 1] = setting
    end

    for _, module in ipairs(modules) do
        if module.type == 'str' then
            if module.size == nil then module.size = fsize end
            if module.height == nil then module.height = fontspacers[module.size] end

            local fullstr = module.str
            if type(module.str) == "table" then
                fullstr = ''
                for _, val in ipairs(module.str) do
                    fullstr = fullstr .. val.str
                end
            end

            local length, chr = getMenuStringLength(fullstr, module.size)
            module.len = length
            module.chr = chr
            width[#width + 1] = length
        else
            width[#width + 1] = module.width
        end

        if module.nocursor == nil then module.nocursor = nocursor end
        if module.colorselect == nil then module.colorselect = base.colorselect end
        if module.select == nil then module.select = selected end
        if module.usemenuclr == nil then module.usemenuclr = base.usemenuclr end
        if module.usecolorize == nil then module.usecolorize = base.usecolorize end
        if module.palcolor == nil then module.palcolor = base.palcolor end
        if module.glowcolor == nil then module.glowcolor = base.glowcolor end
        if module.glowtime == nil then module.glowtime = base.glowtime end
        if module.noclip == nil then module.noclip = base.noclip end
        if module.cursoroff == nil then module.cursoroff = base.cursoroff end

        module.ref = base

        height = height + module.height
        module.rainbow = rainbow or nil
        table.insert(dynamicset.set, module)
    end

    dynamicset.width = math.max(table.unpack(width))
    dynamicset.height = height

    if base.fullrow then dynamicset.fullrow = true end

    return dynamicset
end

function dssmod.generateMenuDraw(item, scenter, input, root, tbl)
    local dssmenu = DeadSeaScrollsMenu
    local menupal = dssmenu.GetPalette()
    local rainbow = menupal.Rainbow

    local drawings = {}
    local mroot = menuroots[root]
    local valign = item.valign or 0
    local halign = item.halign or 0
    local fsize = item.fsize or 3
    local spacers = {8, 12, 16}
    local spacer = spacers[fsize]
    local nocursor = (item.nocursor or item.scroller)
    local width = 82
    local seloff = 0

    local dynamicset = {
        type = 'dynamicset',
        set = {},
        valign = valign,
        halign = halign,
        width = width,
        height = 0,
        pos = Vector(0, 0),
        centeritems = item.centeritems
    }

    if item.gridx then
        dynamicset.gridx = item.gridx
        dynamicset.widest = 0
        dynamicset.highest = 0
    end

    --buttons
    local bsel = item.bsel
    if item.buttons then
        for i, btn in ipairs(item.buttons) do
            if not btn.forcenodisplay then
                local btnset = dssmod.generateDynamicSet(btn, bsel == i, fsize, item.clr, item.shine, nocursor)

                if dynamicset.widest then
                    if btnset.width > dynamicset.widest then
                        dynamicset.widest = btnset.width
                    end
                end

                if dynamicset.highest then
                    if btnset.height > dynamicset.highest then
                        dynamicset.highest = btnset.height
                    end
                end

                table.insert(dynamicset.set, btnset)

                dynamicset.height = dynamicset.height + btnset.height

                if bsel == i then
                    seloff = dynamicset.height - btnset.height / 2
                end
            end
        end
    end

    --tooltip
    if item.strset or item.strpair or item.str or item.spr then
        local itemset = dssmod.generateDynamicSet(item)
        dynamicset.height = dynamicset.height + itemset.height
        table.insert(dynamicset.set, itemset)
    end

    if dynamicset.gridx then
        dynamicset.height = 0

        local gridx, gridy = 1, 1
        local rowDrawings = {}
        for i, drawing in ipairs(dynamicset.set) do
            if drawing.fullrow then
                if #rowDrawings > 0 then
                    rowDrawings = {}
                    gridy = gridy + 1
                end

                gridx = math.ceil(dynamicset.gridx / 2)
                drawing.halign = -2
            end

            drawing.gridxpos = gridx
            drawing.gridypos = gridy

            rowDrawings[#rowDrawings + 1] = drawing

            local highestInRow, widestInRow, bselInRow
            for _, rowDrawing in ipairs(rowDrawings) do
                if not highestInRow or rowDrawing.height > highestInRow then
                    highestInRow = rowDrawing.height
                end

                if not widestInRow or rowDrawing.width > widestInRow then
                    widestInRow = rowDrawing.width
                end

                bselInRow = bselInRow or rowDrawing.bselinrow or bsel == i
            end

            for _, rowDrawing in ipairs(rowDrawings) do
                rowDrawing.highestinrow = highestInRow
                rowDrawing.widestinrow = widestInRow
                rowDrawing.bselinrow = bselInRow
            end

            gridx = gridx + 1
            if gridx > dynamicset.gridx or i == #dynamicset.set or drawing.fullrow or (dynamicset.set[i + 1] and dynamicset.set[i + 1].fullrow) then
                dynamicset.height = dynamicset.height + highestInRow
                if bselInRow then
                    seloff = dynamicset.height - highestInRow / 2
                end

                rowDrawings = {}
                gridy = gridy + 1
                gridx = 1
            end
        end
    end

    local yOffset = -(dynamicset.height / 2)

    if mroot.bounds then
        if yOffset < mroot.bounds[2] + mroot.topspacing then
            yOffset = mroot.bounds[2] + mroot.topspacing
        end
    end

    if not item.noscroll then
        if item.scroller then
            item.scroll = item.scroll or 0
            if input.down then
                item.scroll = item.scroll + 16
            elseif input.up then
                item.scroll = item.scroll - 16
            end

            local halfheight = dynamicset.height / 2
            item.scroll = math.max(mroot.height / 2, math.min(item.scroll, dynamicset.height - mroot.height / 2))
            --item.scroll = math.min(math.max(item.scroll, 80), height - 48)
            seloff = item.scroll
        end

        if dynamicset.height > mroot.height - (mroot.topspacing + mroot.bottomspacing) then
            seloff = -seloff + mroot.height / 2
            seloff = math.max(-dynamicset.height + mroot.height - mroot.bottomspacing, math.min(0, seloff))
            if item.vscroll then
                item.vscroll = Lerp(item.vscroll, seloff, .2)
            else
                item.vscroll = seloff
            end
            dynamicset.pos = Vector(0, item.vscroll)
        end
    end

    dynamicset.pos = dynamicset.pos + Vector(0, yOffset) --+ Vector(0, 64 * valign)
    table.insert(drawings, dynamicset)

    --scroll indicator
    if item.scroller and item.scroll then
        local jumpy = (game:GetFrameCount() % 20) / 10
        if item.scroll > mroot.height / 2 then
            local sym = {type = 'sym', frame = 9, pos = Vector(mroot.scrollersymX, mroot.scrollersymYTop - jumpy)}
            table.insert(drawings, sym)
        end

        if item.scroll < dynamicset.height - mroot.height / 2 then
            local sym = {type = 'sym', frame = 10, pos = Vector(mroot.scrollersymX, mroot.scrollersymYBottom + jumpy)}
            table.insert(drawings, sym)
        end
    end

    --title
    if item.title then
        local title = {type = 'str', str = item.title, size = 3, color = menupal[3], pos = mroot.titleoffset, halign = 0, underline = true, bounds = false}
        title.rainbow = rainbow or nil
        table.insert(drawings, title)
    end

    for _, drawing in ipairs(drawings) do
        if drawing.bounds == nil then drawing.bounds = mroot.bounds end
        if drawing.root == nil then drawing.root = scenter + mroot.offset end
    end

    return drawings
end

function dssmod.drawMenu(tbl, tab)
	local dtype = tab.type
	local scale = tab.scale or Vector(1, 1)
	local root = tab.root or getScreenCenterPosition()
	local pos = tab.pos or Vector(0, 0)
	local mpos = Isaac.WorldToScreen(Input.GetMousePosition(true)) * 2
    local dssmenu = DeadSeaScrollsMenu
    local uispr = tbl.MenuSprites or dssmenu.GetDefaultMenuSprites()
	local font = uispr.Font
	local menuspr = uispr.Face
	local menupal = dssmenu.GetPalette()
	local update = tab.update or false
	local alpha = tab.alpha or 1
	local color = tab.color or (tab.sprite and not tab.usemenuclr and Color(1, 1, 1, 1, 0, 0, 0)) or menupal[tab.palcolor or 2]
    local fontcolor = tab.fontcolor or color
    if type(fontcolor) == "number" then
        fontcolor = menupal[fontcolor]
    end

    local shine = tab.shine or 0
    local bottomcutoff = false

    if tab.glowcolor then
        local glowLength = tab.glowtime or 60
        local glowTime = game:GetFrameCount() % glowLength
        local percent
        if glowTime <= (glowLength / 2) then
            percent = glowTime / (glowLength / 2)
        else
            percent = (glowTime - (glowLength / 2)) / (glowLength / 2)
            percent = 1 - percent
        end

        if type(tab.glowcolor) == "number" then
            color = Color.Lerp(color, menupal[tab.glowcolor], percent)
            fontcolor = Color.Lerp(fontcolor, menupal[tab.glowcolor], percent)
        else
            color = Color.Lerp(color, tab.glowcolor, percent)
            fontcolor = Color.Lerp(fontcolor, tab.glowcolor, percent)
        end
    end

	if tab.rainbow then
        local hue = pos.Y % 256
        if tab.glowcolor then
            local glowLength = tab.glowtime or 60
            local glowTime = game:GetFrameCount() % glowLength
            hue = hue + (glowTime / glowLength) * 255
            hue = hue % 256
        end

        color = hsvToRgb(hue / 255, 1, 1, 1)
        fontcolor = hsvToRgb(hue / 255, 1, 1, 1)
	end

    if tab.colorselect and not tab.select then
        alpha = alpha / 2
    end

	color = Color(color.R, color.G, color.B, alpha, shine, shine, shine)
    if tab.usecolorize then
        local r, g, b = color.R, color.G, color.B
        color = Color(1, 1, 1, alpha, shine, shine, shine)
        color:SetColorize(r, g, b, 1)
    end

    fontcolor = Color(fontcolor.R, fontcolor.G, fontcolor.B, alpha, shine, shine, shine)
	local fnames = {'12', '16', '24'}
	local scaler = {8, 12, 16}

    local selectCursorPos
    local settingsCursorXPlace

	if dtype == 'dot' then
		menuspr.Color = color
		menuspr:SetFrame("Sym", 6)
		menuspr:Render(root + pos, Vector(0, 0), Vector(0, 0))
	elseif dtype == 'sym' then
		menuspr.Color = color
		menuspr:SetFrame("Sym", tab.frame or 6)
		menuspr:Render(root + pos, Vector(0, 0), Vector(0, 0))
	elseif dtype == 'spr' then
		local uspr = tab.sprite
        local floaty = 0
        if tab.float then
            floaty = Vector(0, tab.float[1]):Rotated((game:GetFrameCount() * tab.float[2]) % 360)
            floaty = floaty.Y
        end

        if (tab.center or tab.centerx) and tab.width then
            pos = pos - Vector(tab.width / 2 * scale.X, 0)
        end

        if (tab.center or tab.centery) and tab.height then
            pos = pos - Vector(0, tab.height / 2 * scale.Y)
        end

        pos = pos + Vector(0, floaty)

        local clipt = 0
        local clipb = 0
        if tab.bounds and not tab.noclip then
            clipt = math.min(math.max(0, tab.bounds[2] - pos.Y))
            clipb = math.min(math.max(0, (pos.Y + tab.height - 16) - tab.bounds[4]))
        end

        if clipt + clipb >= tab.height then
            bottomcutoff = clipb >= tab.height
        else
    		uspr.Scale = scale
    		if tab.shadow then
    			uspr.Color = Color(0, 0, 0, alpha / 2, 0, 0, 0)
    			uspr:Render(root + pos + scale, Vector(0, clipt), Vector(0, clipb))
    		end

            if not tab.invisible then
          		uspr.Color = color

                tab.ref.renderedtopos = root + pos
          		uspr:Render(root + pos, Vector(0, clipt), Vector(0, clipb))
            end
        end

        selectCursorPos = pos + Vector(-12, tab.height / 2 * scale.Y)
	elseif dtype == 'str' then
		tab.size = tab.size or 1
		tab.str = tab.str or 'nostring'
		tab.halign = tab.halign or 0
		tab.valign = tab.valign or 0

		local str = tab.str
        local fullstr = str
        if type(str) == "table" then
            fullstr = ''
            for _, val in ipairs(str) do
                fullstr = fullstr .. val.str
            end
        end

		local idx = tab.size + 1
        if not tab.chr or not tab.len then
            tab.len, tab.chr = getMenuStringLength(fullstr, tab.size)
        end

		--drawing string
		local fname = fnames[tab.size]
		local myscale = scaler[tab.size]
		font.Scale = scale
        -- horizontal alignment is handled by text when it is drawn, vertical alignment is handled by main generator
		local xoff = ((tab.halign == 0 and tab.len / -2) or (tab.halign == 1 and tab.len * -1) or 0) + ((tab.parentwidth or 82) * tab.halign)
        if tab.halign == -2 then
            xoff = 0
        end

        local yoff = ((tab.valign == 0 and -.5) or (tab.valign == 1 and -1) or 0) * (myscale)
        if tab.valign == -2 then
            yoff = 0
        end

		local clipt = 0
		local clipb = 0
		local usepos = pos + Vector(xoff, yoff)

		local wtf = tab.size == 1 and -8 or tab.size == 2 and -4 or 0
		if tab.bounds and not tab.noclip then
			clipt = math.min(math.max(0, tab.bounds[2] - (usepos.Y)), myscale) -- myscale
			clipb = math.min(math.max(0, (usepos.Y + wtf) - tab.bounds[4]), myscale)
		end

        if clipt + clipb >= myscale then
            bottomcutoff = clipb >= myscale
        else
    		for i, chr in ipairs(tab.chr) do
                local substr
                local usecolor = fontcolor
                if type(str) == "table" then
                    local j = 0
                    for _, val in ipairs(str) do
                        if not substr and i <= (j + string.len(val.str)) then
                            substr = val
                        end

                        j = j + string.len(val.str)
                    end
                end

                if substr then
                    if substr.color then
                        if type(substr.color) == "number" then
                            usecolor = menupal[substr.color]
                        else
                            usecolor = substr.color
                        end
                    end
                end

                font.Color = usecolor

    			local fpos = usepos + Vector(chr[2], 0)
                if tab.slider then
                    local iii = math.ceil(tab.max / tab.increment)
                    if i > iii * (tab.setting / tab.max) then
                        font.Color = Color(usecolor.R, usecolor.G, usecolor.B, tab.alpha / 2, 0, 0, 0)
                    end
                end

    			if (not tab.bounds) or (clipt < myscale and clipb < myscale) then
                    if tab.hintletter then
                        if tab.hintletter == chr[1] then
                            font.Color = Color(usecolor.R, usecolor.G, usecolor.B, alpha * 0.83, 0, 0, 0)
                        else
                            font.Color = Color(usecolor.R, usecolor.G, usecolor.B, alpha, 0, 0, 0)
                        end
                    end

    				font:SetFrame(fname, mfdat[chr[1] ][1])
    				font:Render(root + fpos, Vector(0, clipt), Vector(0, clipb))
    			end
    		end

    		--underline
    		if tab.underline then
    			menuspr:SetFrame("Sym", 0)
    			menuspr.Color = fontcolor
    			menuspr:Render(root + pos + Vector(0, 16), Vector(0, 0), Vector(0, 0))
    		end
        end

        selectCursorPos = pos + Vector(xoff - 12, 3 - tab.size)
        if tab.size == 1 then
            selectCursorPos = pos + Vector(xoff - 6, 1 - tab.size)
        end

        settingsCursorXPlace = math.max(40, -xoff + 10)
	elseif dtype == 'dynamicset' then
		local yy = 0

        if tab.gridx and tab.centeritems then
            yy = yy + tab.highest / 2
        end

		for i, drawing in ipairs(tab.set) do
			drawing.root = root
			drawing.bounds = tab.bounds

            if tab.gridx then
                local totalwidth = tab.gridx * drawing.widestinrow
                local x = drawing.gridxpos - 1
                local xPos = (-totalwidth / 2) + Lerp(0, totalwidth - drawing.widestinrow, x / (tab.gridx - 1))
                drawing.pos = (drawing.pos or Vector(0, 0)) + pos + Vector(xPos, yy)

                if tab.centeritems then
                    local widthdiff = drawing.widestinrow - drawing.width
                    local heightdiff = drawing.highestinrow - drawing.height
                    drawing.pos = drawing.pos + Vector(widthdiff / 2 + drawing.width / 2, -heightdiff / 2 - drawing.height / 2)
                end

                if tab.set[i + 1] and tab.set[i + 1].gridypos > drawing.gridypos then
                    yy = yy + drawing.highestinrow
                end
            else
    			drawing.pos = (drawing.pos or Vector(0, 0)) + pos + Vector(0, yy)
                yy = yy + (drawing.height or 16)
            end

            drawing.halign = drawing.halign or tab.halign
			drawing.width = drawing.width or tab.width or 82
            drawing.parentwidth = tab.parentwidth or tab.width or drawing.width or 82
		end

		local yo = 0--(((tab.valign or -1) + 1) * yy) / -2

		for i, drawing in ipairs(tab.set) do
			drawing.pos = drawing.pos + Vector(0, yo)
			if dssmod.drawMenu(tbl, drawing) then -- returns true if cutoff
                return true
            end
		end
	end

    -- draw selected / choice arrows
    --selected
    if tab.select and not tab.nocursor and selectCursorPos then
        if tab.size == 1 then
            menuspr:SetFrame("Sym", 2)
        else
            menuspr:SetFrame("Sym", 1)
        end

        if tab.cursoroff then
            selectCursorPos = selectCursorPos + tab.cursoroff
        end

        menuspr.Color = fontcolor

        local clipt = math.min(math.max(0, tab.bounds[2] - (selectCursorPos.Y - 8)), 16)
        local clipb = math.min(math.max(0, (selectCursorPos.Y - 8) - tab.bounds[4]), 16)
        menuspr:Render(root + selectCursorPos, Vector(0, clipt), Vector(0, clipb))
    end

    -- choices
    if tab.settingscursor and settingsCursorXPlace then
        menuspr.Color = fontcolor
        if (tab.choices and tab.setting > 1) or (tab.max and tab.setting > (tab.min or 0)) then
            menuspr:SetFrame("Sym", 8)

            local sympos = pos + Vector(-settingsCursorXPlace, -1)
            local clipt = math.min(math.max(0, tab.bounds[2] - (sympos.Y - 8)), 16)
            local clipb = math.min(math.max(0, (sympos.Y - 8) - tab.bounds[4]), 16)
            menuspr:Render(root + sympos, Vector(0, clipt), Vector(0, clipb))
        end

        if (tab.choices and tab.setting < tab.choices) or (tab.max and tab.setting < tab.max) then
            menuspr:SetFrame("Sym", 7)

            local sympos = pos + Vector(settingsCursorXPlace, -1)
            local clipt = math.min(math.max(0, tab.bounds[2] - (sympos.Y - 8)), 16)
            local clipb = math.min(math.max(0, (sympos.Y - 8) - tab.bounds[4]), 16)
            menuspr:Render(root + sympos, Vector(0, clipt), Vector(0, clipb))
        end
    end

    if bottomcutoff then
        return true
    end
end

function dssmod.runMenu(tbl)
    local directory = tbl.Directory
    local directorykey = tbl.DirectoryKey
    local scenter = getScreenCenterPosition()

    local dssmenu = DeadSeaScrollsMenu
    local uispr = tbl.MenuSprites or dssmenu.GetDefaultMenuSprites()
    local menuspr = {uispr.Shadow, uispr.Back, uispr.Face, uispr.Border}
    local menumask = uispr.Mask
    local font = uispr.Font

	local menupal = dssmenu.GetPalette()
	local rainbow = menupal.Rainbow
	local root1 = scenter + Vector(-42, 10)
	local root2 = scenter + Vector(132, 6)

    -- initialize sprites
    directorykey.Idle = false
	if not directorykey.Init then
		for i = 1, 4 do
			menuspr[i]:Play("Dissapear") --(sic)
			menuspr[i]:SetLastFrame()
            menuspr[i]:Stop()
		end

        if not directorykey.OpenAnimation then
            directorykey.Idle = true
            directorykey.MaskAlpha = 0
        end

		directorykey.Init = true
	end

    --background sprite
    if directorykey.OpenAnimation then
        directorykey.OpenAnimation = false
        for i = 1, 4 do
            menuspr[i]:Play("Appear", true)
        end
    end

    if directorykey.CloseAnimation then
        directorykey.MaskAlpha = approach(directorykey.MaskAlpha, 1, .25)
        directorykey.Item = directory[directorykey.Main]
        directorykey.Path = {}

        if directorykey.MaskAlpha == 1 then
            directorykey.CloseAnimation = false
            for i = 1, 4 do
                menuspr[i]:Play("Dissapear", true)
            end
        end
    end

    if tbl.Exiting and not directorykey.CloseAnimation and not menuspr[3]:IsPlaying("Dissapear") then
        tbl.Exiting = nil
        return
    elseif not menuspr[3]:IsPlaying("Appear") and not menuspr[3]:IsPlaying("Dissapear") then
        for i = 1, 4 do
            menuspr[i]:Play("Idle")
        end

        if not tbl.Exiting then
            directorykey.MaskAlpha = approach(directorykey.MaskAlpha, 0, .25)
            directorykey.Idle = true
        end
    end

	menuspr[2].Color = menupal[1]
	menuspr[3].Color = menupal[1]
	for i = 1, 3 do
		menuspr[i]:Render(root1, Vector(0, 0), Vector(0, 0))
		menuspr[i]:Update()
	end

    if directorykey.Idle then
    	--INTERACTION
    	local item = directorykey.Item
        local itemswitched = false

        if item ~= directorykey.PreviousItem then
            itemswitched = true

            if item.generate then
                item.generate(item, tbl)
            end

            directorykey.PreviousItem = item
        end

        if item.update then
            item.update(item, tbl)
        end

        local input = menuinput.menu
        local psel = item.psel or 1
        local pages = item.pages
        local page
        if pages and #pages > 0 then
            page = item.pages[psel]
        end

    	local buttons = {}
        if item.buttons then
            for _, button in ipairs(item.buttons) do
                buttons[#buttons + 1] = button
            end
        end

        if page and page.buttons then
            for _, button in ipairs(page.buttons) do
                buttons[#buttons + 1] = button
            end
        end

    	local bsel = item.bsel or 1
    	local action = false
        local func = nil
        local changefunc = nil
        local prevbutton = nil
    	local dest = false
    	local button = false
    	local draw = true
        local allnosel = false

    	--buttons
    	if buttons and #buttons > 0 then
    		--button selection
    		item.bsel = math.min((item.bsel or 1), #buttons)

            allnosel = true
            for i, button in ipairs(buttons) do
                if button.generate and itemswitched then
                    button.generate(button, item, tbl)
                end

                if button.update then
                    button.update(button, item, tbl)
                end

                if button.display ~= nil or button.displayif then
                    if button.display == false or (button.displayif and not button.displayif(button, item, tbl)) then
                        button.nosel = true
                        button.forcenodisplay = true
                    elseif button.forcenodisplay then
                        button.nosel = nil
                        button.forcenodisplay = nil
                    end
                end

                if not button.nosel then
                    if allnosel and item.bsel < i then -- select the first selectable button if the currently selected button isn't selectable ex 1
                        item.bsel = i
                    end

                    allnosel = false
                end
            end

            local prevbsel = item.bsel
            if buttons[item.bsel].changefunc then
                prevbutton = buttons[item.bsel]
                changefunc = buttons[item.bsel].changefunc
            end

            if allnosel then
                item.bsel = 1
            elseif item.gridx then
                local firstLoop = true
                local tryKeepX, tryKeepY
                while buttons[item.bsel].nosel or firstLoop do
                    local x, y, maxX, maxY = bselToXY(item.bsel, item.gridx, buttons)
                    --[[
                    local x = ((item.bsel - 1) % item.gridx) + 1
                    local y = math.ceil(item.bsel / item.gridx)
                    local maxY = math.ceil(#buttons / item.gridx)
                    local maxX = ((#buttons - 1) % item.gridx) + 1 -- on maxY]]
                    if tryKeepX then
                        x = tryKeepX
                        tryKeepX = nil
                    end

                    if tryKeepY then
                        y = tryKeepY
                        tryKeepY = nil
                    end

                    if input.up then
                        y = y - 1
                    elseif input.down then
                        y = y + 1
                    elseif input.left then
                        x = x - 1
                    elseif input.right then
                        x = x + 1
                    end

                    local prevX, prevY = x, y

                    if y < 1 then
                        y = maxY
                    elseif y > maxY then
                        y = 1
                    end

                    maxX = maxX[y]
                    if x < 1 then
                        x = maxX
                    elseif x > maxX then
                        if input.down or input.up then
                            x = maxX
                        else
                            x = 1
                        end
                    end

                    item.bsel = xyToBsel(x, y, item.gridx, buttons)
                    if buttons[item.bsel].nosel then
                        if input.up or input.down then
                            tryKeepX = prevX
                        elseif input.left or input.right then
                            tryKeepY = prevY
                        end
                    end

                    --(y - 1) * item.gridx + x
                    firstLoop = nil
                end
            else
    			if input.up then
    				item.bsel = ((item.bsel - 2) % #buttons) + 1
                    while buttons[item.bsel].nosel do
              			item.bsel = ((item.bsel - 2) % #buttons) + 1
                    end
    			elseif input.down or buttons[item.bsel].nosel then
    				item.bsel = (item.bsel % #buttons) + 1
                    while buttons[item.bsel].nosel do
              			item.bsel = (item.bsel % #buttons) + 1
                    end
    			end
            end

    		bsel = item.bsel
            local bselchanged = bsel ~= prevbsel
            if not bselchanged then
                prevbutton = nil
                changefunc = nil
            end

    		dest = directory[buttons[bsel].dest]
    		button = buttons[bsel]

    		--button confirmation
    		if input.confirm and not itemswitched and not allnosel then
                if button then
                    PlaySound(menusounds.Pop2)
                    if button.action then
                        action = button.action
                    end

                    if button.func then
                        func = button.func
                    end
                end

    			if dest then
                    if not item.removefrompath then
                        table.insert(directorykey.Path, item)
                    end

                    directorykey.Item = dest
    			end
    		end

    		--button choice selection
            local buttoninteracted = false
    		if (button.variable or button.setting) and not allnosel then
    			if button.choices then
    				button.setting = button.setting or 1
    				if (input.right or input.dright) and button.setting < #button.choices then
    					button.setting = button.setting + 1
    					sfx:Play(SoundEffect.SOUND_PLOP, 1, 0, false, .9 + (.2 * (#button.choices / (#button.choices - (button.setting - 1)))))
    					dssmod.setOption(button.variable, button.setting, button, directorykey.Item, directorykey)
                        buttoninteracted = true
    				elseif (input.left or input.dleft) and button.setting > 1 then
    					button.setting = button.setting - 1
    					sfx:Play(SoundEffect.SOUND_PLOP, 1, 0, false, .9 + (.2 * (#button.choices / (#button.choices - (button.setting - 1)))))
    					dssmod.setOption(button.variable, button.setting, button, directorykey.Item, directorykey)
                        buttoninteracted = true
    				elseif input.confirm then
    					button.setting = (button.setting % #button.choices) + 1
    					sfx:Play(SoundEffect.SOUND_PLOP, 1, 0, false, .9 + (.2 * (#button.choices / (#button.choices - (button.setting - 1)))))
    					dssmod.setOption(button.variable, button.setting, button, directorykey.Item, directorykey)
                        buttoninteracted = true
    				end
    			elseif button.max then
    				local inc, min, max = button.increment or 1, button.min or 0, button.max
    				local pop = false
    				button.setting = button.setting or 0
    				if (input.right or input.dright or input.confirm) then
    					if button.setting < max then
    						button.setting = math.min(button.setting + inc, max)
    						pop = true
    					elseif input.confirm then
    						button.setting = button.min or 0
    						pop = true
    					end
    				elseif (input.left or input.dleft) and button.setting > min then
    					button.setting = math.max(button.setting - inc, min)
    					pop = true
    				end

    				if pop then
    					dssmod.setOption(button.variable, button.setting, button, directorykey.Item, directorykey)
    					sfx:Play(SoundEffect.SOUND_PLOP, 1, 0, false, .9 + (.2 * (button.setting / button.max)))
                        buttoninteracted = true
    				end
                elseif button.keybind then
                    if input.keybinding then
                        if input.keybind then
                            if (input.keybind == Keyboard.KEY_ESCAPE or input.keybind == Keyboard.KEY_BACKSPACE) and button.setting ~= -1 then
                                input.keybind = -1
                            end

                            button.setting = input.keybind
                            dssmod.setOption(button.variable, button.setting, button, directorykey.Item, directorykey)
                            input.keybinding = nil
                            button.keybinding = nil
                        end

                        buttoninteracted = true
                    elseif input.confirm then
                        button.keybinding = true
                        input.keybinding = true
                        buttoninteracted = true
                    end
    			end
    		end
    	end

    	--pages
    	if pages and #pages > 0 then
    		item.psel = math.min((item.psel or 1), #pages)
            if not buttoninteracted and not bselchanged and item.defaultpageselector then
        		if input.left then
        			item.psel = ((item.psel - 2) % #pages) + 1
        		elseif input.right then
        			item.psel = (item.psel % #pages) + 1
        		end
            end

    		psel = item.psel
    	end

        --BUTTON FUNCTIONS
        if func then
            func(button, directorykey.Item)
        end

        if changefunc then
            changefunc(prevbutton, directorykey.Item)
        end

    	--drawing
    	if draw then
            local drawings = dssmod.generateMenuDraw(item, scenter, input, "main", tbl)

            local tooltip = item.tooltip
            if button and button.tooltip then
                tooltip = button.tooltip
            end

            if tooltip then
                if tooltip.update then
                    tooltip.update(tooltip, item, button)
                end

                local drawings2 = dssmod.generateMenuDraw(tooltip, scenter, input, "tooltip")
                for _, drawing in ipairs(drawings2) do
                    drawings[#drawings + 1] = drawing
                end
            end

    		--draw
    		for i, drawing in ipairs(drawings) do
    			dssmod.drawMenu(tbl, drawing)
    		end
    	end

        --menu regressing
    	if (input.back or input.toggle) and not itemswitched then
    		if #directorykey.Path > 0 then
                PlaySound(menusounds.Pop3)
                local backItem = directorykey.Path[#directorykey.Path]
    			directorykey.Path[#directorykey.Path] = nil
                if backItem.menuname then
                    local newPath = {}
                    for _, val in ipairs(directorykey.Path) do
                        newPath[#newPath + 1] = val
                    end

                    dssmenu.OpenMenu(backItem.menuname)
                    local menu = dssmenu.Menus[backItem.menuname]
                    menu.DirectoryKey.Item = backItem
                    menu.DirectoryKey.Path = newPath
                    menu.DirectoryKey.PreviousItem = nil
                else
    			    directorykey.Item = backItem
                end
    		elseif not directorykey.PreventClosing then
                dssmenu.CloseMenu()
    		end
    	end

        --BUTTON ACTIONS
        if action then
            if action == 'resume' then
                dssmenu.CloseMenu(true)
            elseif action == "openmenu" then
                dssmenu.OpenMenu(button.menu)
            end
        end
    end

    --border
    menuspr[4]:Render(root1, Vector(0, 0), Vector(0, 0))
    menuspr[4]:Update()

    --fade mask
    if directorykey.Idle and directorykey.MaskAlpha > 0 then
        local useclr = menupal[1]
        menumask.Color = Color(useclr.R, useclr.G, useclr.B, directorykey.MaskAlpha, 0, 0, 0)
        menumask:Play("Idle", true)
        menumask:Render(root1, Vector(0, 0), Vector(0, 0))
    end

    if directorykey.Idle then
        local item = directorykey.Item
        if item.postrender then
            item.postrender(item, tbl)
        end
    end
end

function dssmod.checkMenu()
    if not menuinput then
        return false
    end

	local input = menuinput.menu
	if not input then
		return false
	end

    local dssmenu = DeadSeaScrollsMenu
    if input.toggle and not dssmenu.IsOpen() then
        if dssmenu.IsMenuSafe() then
            if dssmenu.CanOpenGlobalMenu() then
                dssmenu.OpenMenu("Menu")
            else -- if only one mod is using the menu, open its menu and ignore this one
                for k, menu in pairs(dssmenu.Menus) do -- this is non-specific to simplify copying, less to swap
                    if k ~= "Menu" then
                        dssmenu.OpenMenu(k)
                    end
                end
            end
        else
            sfx:Play(SoundEffect.SOUND_BOSS2INTRO_ERRORBUZZ, .75, 0, false, 1.5)
        end
    end

    if dssmenu.OpenedMenu then
        if dssmenu.ExitingMenu and not dssmenu.OpenedMenu.Exiting then
            dssmenu.ExitingMenu = nil
            dssmenu.OpenedMenu = nil
        else
            dssmenu.OpenedMenu.Run(dssmenu.OpenedMenu)
        end
    else
        dssmenu.ExitingMenu = nil
    end
end

function dssmod.openMenu(tbl, openedFromNothing)
    if openedFromNothing then
        tbl.DirectoryKey.OpenAnimation = true
    end

    tbl.DirectoryKey.PreviousItem = nil

    for k, item in pairs(tbl.Directory) do
        if item.buttons then
            for _, button in ipairs(item.buttons) do
                if button.load then
                    local setting = button.load(button, item, tbl)
                    button.setting = setting
                    if button.variable then
                        tbl.DirectoryKey.Settings[button.variable] = setting
                    end
                end
            end
        end
    end
end

function dssmod.closeMenu(tbl, fullClose, noAnimate)
    if fullClose and not noAnimate then
        tbl.Exiting = true
        tbl.DirectoryKey.CloseAnimation = true
    end

    tbl.DirectoryKey.Path = {}
    tbl.DirectoryKey.Main = 'main'
    tbl.DirectoryKey.PreventClosing = false
    tbl.DirectoryKey.Item = tbl.Directory[tbl.DirectoryKey.Main]

    if tbl.DirectoryKey.SettingsChanged then
        tbl.DirectoryKey.SettingsChanged = false
        for k, item in pairs(tbl.Directory) do
            if item.buttons then
                for _, button in ipairs(item.buttons) do
                    if button.store and button.variable then
                        button.store(tbl.DirectoryKey.Settings[button.variable] or button.setting, button, item, tbl)
                    end
                end
            end
        end

        MenuProvider.SaveSaveData()
    end
end

--POST RENDER
local openToggle -- only store data when menu opens / closes
function dssmod:post_render()
    local dssmenu = DeadSeaScrollsMenu
    local isCore = MenuProvider.IsMenuCore()
    local isOpen = dssmenu.IsOpen()
    if isCore or isOpen then
        dssmod.getInput(0)
    end

    if not isCore and dssmenu and openToggle ~= isOpen then -- If not in control of certain settings, be sure to store them!
        openToggle = isOpen

        local change

        local palSetting = dssmenu.GetPaletteSetting()
        if palSetting ~= MenuProvider.GetPaletteSetting() then
            change = true
            MenuProvider.SavePaletteSetting(palSetting)
        end

        if not REPENTANCE then
            local hudSetting = dssmenu.GetHudOffsetSetting()
            if hudSetting ~= MenuProvider.GetHudOffsetSetting() then
                change = true
                MenuProvider.SaveHudOffsetSetting(hudSetting)
            end
        end

        local gamepadSetting = dssmenu.GetGamepadToggleSetting()
        if gamepadSetting ~= MenuProvider.GetGamepadToggleSetting() then
            change = true
            MenuProvider.SaveGamepadToggleSetting(gamepadSetting)
        end

        local keybindSetting = dssmenu.GetMenuKeybindSetting()
        if keybindSetting ~= MenuProvider.GetMenuKeybindSetting() then
            change = true
            MenuProvider.SaveMenuKeybindSetting(keybindSetting)
        end

        local menusNotified, knownNotified = dssmenu.GetMenusNotified(), MenuProvider.GetMenusNotified()
        if not KeysShareVals(menusNotified, knownNotified) then
            change = true
            MenuProvider.SaveMenusNotified(menusNotified)
        end

        local menusPoppedUp, knownPoppedUp = dssmenu.GetMenusPoppedUp(), MenuProvider.GetMenusPoppedUp()
        if not KeysShareVals(menusPoppedUp, knownPoppedUp) then
            change = true
            MenuProvider.SaveMenusPoppedUp(menusPoppedUp)
        end

        if change then
            MenuProvider.SaveSaveData()
        end
    end
end

dssmod:AddCallback(ModCallbacks.MC_POST_RENDER, dssmod.post_render)

-- These buttons will be included in this mod's menu if it is the only active menu, or in the global menu if it exists and this mod is managing it
local function sharedButtonDisplayCondition(button, item, tbl)
    return tbl.Name == "Menu" or not dssmenu.CanOpenGlobalMenu()
end

dssmod.hudOffsetButton = {
    str = 'hud offset',
    increment = 1, max = 10,
    variable = "HudOffset",
    slider = true,
    setting = 0,
    load = function()
        return DeadSeaScrollsMenu.GetHudOffsetSetting()
    end,
    store = function(var)
        DeadSeaScrollsMenu.SaveHudOffsetSetting(var)
    end,
    displayif = function(btn, item, tbl)
        return not REPENTANCE and sharedButtonDisplayCondition(btn, item, tbl)
    end,
    tooltip = {strset = {'be sure to', 'match the', 'setting', 'in the', 'pause menu'}}
}

dssmod.gamepadToggleButton = {
    str = 'gamepad toggle',
    choices = {'either stick', 'left stick', 'right stick', 'both sticks', '[select]', '[rt] + [select]', 'keybind only'},
    variable = 'ControllerToggle',
    tooltip = {strset = {'to open', 'and close', 'this menu with', 'a controller','','[f1] always', 'works'}},
    setting = 1,
    load = function()
        return DeadSeaScrollsMenu.GetGamepadToggleSetting()
    end,
    store = function(var)
        DeadSeaScrollsMenu.SaveGamepadToggleSetting(var)
    end,
    displayif = sharedButtonDisplayCondition
}

dssmod.menuKeybindButton = {
    str = 'menu keybind',
    tooltip = {strset = {'rebinds key', 'used to open', 'this menu.', '[f1] always', 'works.'}},
    variable = 'MenuKeybind',
    keybind = true,
    setting = Keyboard.KEY_C,
    load = function()
        return DeadSeaScrollsMenu.GetMenuKeybindSetting()
    end,
    store = function(var)
        DeadSeaScrollsMenu.SaveMenuKeybindSetting(var)
    end,
    changefunc = function(button)
        DeadSeaScrollsMenu.SaveMenuKeybindSetting(button.setting)
    end,
    displayif = sharedButtonDisplayCondition
}

dssmod.paletteButton = {
    str = 'menu palette',
    variable = "MenuPalette",
    setting = 1,
    load = function()
        return DeadSeaScrollsMenu.GetPaletteSetting()
    end,
    store = function(var)
        DeadSeaScrollsMenu.SavePaletteSetting(var)
    end,
    changefunc = function(button)
        DeadSeaScrollsMenu.SavePaletteSetting(button.setting)
    end,
    displayif = sharedButtonDisplayCondition,
    generate = function(button, item, tbl)
        local dssmenu = DeadSeaScrollsMenu
        if not button.generated or button.generated ~= #dssmenu.Palettes then
            button.setting = math.min(button.setting, #dssmenu.Palettes)
            button.generated = #dssmenu.Palettes
            button.choices = {}
            for _, palette in ipairs(dssmenu.Palettes) do
                button.choices[#button.choices + 1] = palette.Name
            end
        end
    end
}

local function changelogsGenerate(item, tbl)
    item.buttons = {}

    if not item.logtable then
        item.logtable = DeadSeaScrollsMenu.Changelogs
    end

    local dir = tbl.Directory
    for _, key in ipairs(item.logtable.List) do
        local glowcolor = (DeadSeaScrollsMenu.DoesLogWantNotification(key) and 3) or nil
        if type(key) == "table" then
            item.buttons[#item.buttons + 1] = {
                str = key.Name,
                dest = key.Key,
                glowcolor = glowcolor
            }
        else
            item.buttons[#item.buttons + 1] = {
                str = dir[key].title,
                dest = key,
                glowcolor = glowcolor
            }
        end
    end
end

dssmod.changelogsButton = {
    str = 'changelogs',
    menudest = 'Menu',
    dest = 'changelogs',
    generate = function(btn)
        if DeadSeaScrollsMenu.DoesLogWantNotification(DeadSeaScrollsMenu.Changelogs) then
            btn.glowcolor = 3
        else
            btn.glowcolor = nil
        end
    end,
    displayif = function(btn, item, tbl)
        if sharedButtonDisplayCondition(btn, item, tbl) then
            return #DeadSeaScrollsMenu.Changelogs.List > 0
        end

        return false
    end
}


dssmod.menuOpenToolTip = {strset = {'toggle menu', '', 'keyboard:', '[c] or [f1]', '','controller:', 'press analog'}, fsize = 2}
local function InitializeMenuCore()
    if not dssmenu.Palettes then
        dssmenu.Palettes = {}
    end

    if not dssmenu.ExistingPalettes then
        dssmenu.ExistingPalettes = {}
    end

    if not dssmenu.Menus then
        dssmenu.Menus = {}
    end

    if not dssmenu.Changelogs then
        dssmenu.Changelogs = {Key = 'changelogs', Name = 'changelogs', List = {}}
    end

    if not dssmenu.ChangelogItems then
        dssmenu.ChangelogItems = {}
    end

    if not dssmenu.QueuedMenus then
        dssmenu.QueuedMenus = {}
    end

    function dssmenu.AddPalettes(palettes)
        for _, palette in ipairs(palettes) do
            if not dssmenu.ExistingPalettes[palette.Name] then
                dssmenu.ExistingPalettes[palette.Name] = true

                for i, color in ipairs(palette) do
                    if type(color) == "table" then
                        palette[i] = Color(color[1] / 255, color[2] / 255, color[3] / 255, 1, 0, 0, 0)
                    else
                        palette[i] = color
                    end
                end

                dssmenu.Palettes[#dssmenu.Palettes + 1] = palette
            end
        end
    end

    local function stringLineIterator(s)
        if s:sub(-1)~="\n" then s=s.."\n" end
        return s:gmatch("(.-)\n")
    end

    dssmenu.AddPalettes({
        {
            Name = "classic",
            {199, 178, 154}, -- Back
            {54, 47, 45}, -- Text
            {94, 57, 61}, -- Highlight Text
        },
        {
            Name = "soy milk",
            {255, 237, 206},
            {134, 109, 103},
            {73, 56, 67},
        },
        {
            Name = "phd",
            {224, 208, 208},
            {84, 43, 39},
            {118, 66, 72},
        },
        {
            Name = "faded polaroid",
            {219, 199, 188},
            {111, 81, 63},
            {86, 29, 37},
        },
        {
            Name = "missing page 2",
            {178, 112, 110},
            {40, 0, 0},
            {63, 13, 18},
        },
        {
            Name = "???",
            {77, 98, 139},
            {29, 36, 52},
            {156, 200, 205},
        },
        {
            Name = "succubus",
            {51, 51, 51},
            {12, 12, 12},
            {81, 10, 22},
        },
        {
            Name = "birthright",
            {214, 186, 155},
            {38, 30, 22},
            {112, 7, 0},
        },
        {
            Name = "impish",
            {170, 142, 214},
            {47, 34, 68},
            {56, 3, 6},
        },
        {
            Name = "queasy",
            {87, 125, 73},
            {32, 38, 28},
            {56, 55, 23},
        },
        {
            Name = "fruitcake",
            Rainbow = true,
            {243, 226, 226},
            {54, 47, 45},
            {64, 57, 50},
        },
        {
            Name = "delirious",
            {255, 255, 255},
            {254, 240, 53},
            {139, 104, 104},
        },
        {
            Name = "searing",
            {255, 255, 255},
            {117, 120, 125},
            {114, 137, 218},
        },
    })

    function dssmenu.GetPaletteSetting()
        local palette = MenuProvider.GetPaletteSetting()
        if palette and dssmenu.Palettes[palette] then
            return palette
        else
            MenuProvider.SavePaletteSetting(1)
            MenuProvider.SaveSaveData()
            return 1
        end
    end

    function dssmenu.SavePaletteSetting(var)
        MenuProvider.SavePaletteSetting(var)
        MenuProvider.SaveSaveData()
    end

    function dssmenu.GetPalette()
        return dssmenu.Palettes[dssmenu.GetPaletteSetting()]
    end

    function dssmenu.GetHudOffsetSetting()
        if REPENTANCE then
            return Options.HUDOffset * 10
        else
            local hudOffset = MenuProvider.GetHudOffsetSetting()
            if hudOffset then
                return hudOffset
            else
                MenuProvider.SaveHudOffsetSetting(0)
                MenuProvider.SaveSaveData()
                return 0
            end
        end
    end

    function dssmenu.SaveHudOffsetSetting(var)
        if not REPENTANCE then
            MenuProvider.SaveHudOffsetSetting(var)
            MenuProvider.SaveSaveData()
        end
    end

    function dssmenu.GetGamepadToggleSetting()
        local gamepadToggle = MenuProvider.GetGamepadToggleSetting()
        if gamepadToggle then
            return gamepadToggle
        else
            MenuProvider.SaveGamepadToggleSetting(1)
            MenuProvider.SaveSaveData()
            return 1
        end
    end

    function dssmenu.SaveGamepadToggleSetting(var)
        MenuProvider.SaveGamepadToggleSetting(var)
        MenuProvider.SaveSaveData()
    end

    function dssmenu.GetMenuKeybindSetting()
        local menuKeybind = MenuProvider.GetMenuKeybindSetting()
        if menuKeybind then
            return menuKeybind
        else
            MenuProvider.SaveMenuKeybindSetting(Keyboard.KEY_C)
            MenuProvider.SaveSaveData()
            return Keyboard.KEY_C
        end
    end

    function dssmenu.SaveMenuKeybindSetting(var)
        MenuProvider.SaveMenuKeybindSetting(var)
        MenuProvider.SaveSaveData()
    end

    function dssmenu.GetMenusNotified()
        local menusNotified = MenuProvider.GetMenusNotified()
        if menusNotified then
            return menusNotified
        else
            MenuProvider.SaveMenusNotified({})
            MenuProvider.SaveSaveData()
            return {}
        end
    end

    function dssmenu.SaveMenusNotified(var)
        MenuProvider.SaveMenusNotified(var)
        MenuProvider.SaveSaveData()
    end

    function dssmenu.GetMenusPoppedUp()
        local menusNotified = MenuProvider.GetMenusPoppedUp()
        if menusNotified then
            return menusNotified
        else
            MenuProvider.SaveMenusPoppedUp({})
            MenuProvider.SaveSaveData()
            return {}
        end
    end

    function dssmenu.SaveMenusPoppedUp(var)
        MenuProvider.SaveMenusPoppedUp(var)
        MenuProvider.SaveSaveData()
    end

    function dssmenu.GetDefaultMenuSprites()
        if not dssmenu.MenuSprites then
            dssmenu.MenuSprites = {
                Shadow = Sprite(),
                Back = Sprite(),
                Face = Sprite(),
                Mask = Sprite(),
                Border = Sprite(),
                Font = Sprite()
            }

            dssmenu.MenuSprites.Back:Load("gfx/ui/deadseascrolls/menu_back.anm2", true)
            dssmenu.MenuSprites.Face:Load("gfx/ui/deadseascrolls/menu_face.anm2", true)
            dssmenu.MenuSprites.Mask:Load("gfx/ui/deadseascrolls/menu_mask.anm2", true)
            dssmenu.MenuSprites.Border:Load("gfx/ui/deadseascrolls/menu_border.anm2", true)
            dssmenu.MenuSprites.Font:Load("gfx/ui/deadseascrolls/menu_font.anm2", true)
            dssmenu.MenuSprites.Shadow:Load("gfx/ui/deadseascrolls/menu_shadow.anm2", true)
        end

        return dssmenu.MenuSprites
    end

    function dssmenu.IsMenuSafe()
        local roomHasDanger = false
    	for _, entity in pairs(Isaac.GetRoomEntities()) do
    		if (entity:IsActiveEnemy() and not entity:HasEntityFlags(EntityFlag.FLAG_FRIENDLY))
    		or entity.Type == EntityType.ENTITY_PROJECTILE and entity:ToProjectile().ProjectileFlags & ProjectileFlags.CANT_HIT_PLAYER == 0
    		or entity.Type == EntityType.ENTITY_BOMBDROP then
    			roomHasDanger = true
    			break
    		end
    	end

    	if game:GetRoom():IsClear() and not roomHasDanger then
    		return true
    	end

    	return false
    end

    local dssdirectory = {
        main = {
            title = 'dead sea scrolls',
            buttons = {
                {str = 'resume game', action = 'resume'},
                {str = 'menu settings', dest = 'menusettings'},
                dssmod.changelogsButton
            },
            tooltip = dssmod.menuOpenToolTip
        },
        menusettings = {
            title = 'menu settings',
            buttons = {
                dssmod.hudOffsetButton,
                dssmod.gamepadToggleButton,
                dssmod.menuKeybindButton,
                dssmod.paletteButton
            },
            tooltip = dssmod.menuOpenToolTip
        },
        changelogs = {
            title = 'changelogs',
            fsize = 3,
            generate = changelogsGenerate,
            tooltip = dssmod.menuOpenToolTip
        }
    }

    if dssmenu.ChangelogItems then
        for k, v in pairs(dssmenu.ChangelogItems) do
            dssdirectory[k] = v
        end
    end

    local dssdirectorykey = {
    	Item = dssdirectory.main,
        Main = 'main',
    	Idle = false,
    	MaskAlpha = 1,
        Settings = {},
        SettingsChanged = false,
    	Path = {},
    }

    local changelogFormatCodes = {
        "{CLR1",
        "{CLR2",
        "{CLR3",
        "{SYM",
        "{FSIZE2}",
        "{FSIZE3}",
        "}"
    }

    function dssmenu.AddChangelog(...)
        local args = {...}
        local changelogText, changelogTextIndex

        if #args < 2 then
            changelogTextIndex = 1
        else
            for i = #args, 2, -1 do
                if type(args[i]) == "string" then
                    changelogTextIndex = i
                    changelogText = args[i]
                    break
                end
            end
        end

        if changelogTextIndex == 1 then
            error("DeadSeaScrollsMenu.AddChangelog requires a category arg to be placed under, before changelog text.", 2)
        end

        local categories = {}
        for i = 1, changelogTextIndex - 1 do
            categories[#categories + 1] = string.lower(args[i])
        end

        local tooltip, notify, popup, defaultFSize = args[changelogTextIndex + 1] or dssmod.menuOpenToolTip, args[changelogTextIndex + 2], args[changelogTextIndex + 3], args[changelogTextIndex + 4] or 1

        local lines = {}
        for line in stringLineIterator(changelogText) do
            lines[#lines + 1] = line
        end

        if not tooltip.strset then
            tooltip = {strset = tooltip}
        end

        local buttons = {}
        local changelogItem = {
            title = categories[#categories],
            tooltip = tooltip,
            fsize = defaultFSize,
            scroller = true,
            nocursor = true,
            buttons = buttons,
            wantspopup = popup,
            wantsnotify = notify,
            generate = function(item)
                if item.wantsnotify then
                    local notifies = DeadSeaScrollsMenu.GetMenusNotified()
                    if not notifies[item.keyindirectory] then
                        notifies[item.keyindirectory] = true
                        DeadSeaScrollsMenu.SaveMenusNotified(notifies)
                    end
                end
            end
        }

        for i, line in ipairs(lines) do
            local btn = {}
            local substrs = {}

            local formatParsingDone = false
            local strStart = 1
            local strEnd = string.len(line)
            local strIndex = strStart
            local fsize
            local subStrData = {Start = strIndex}

            while not formatParsingDone do
                local nextFormatCode, nextFormatCodeStart, nextFormatCodeEnd
                for _, code in ipairs(changelogFormatCodes) do
                    local startInd, endInd = string.find(line, code, strIndex)
                    if startInd then
                        if not nextFormatCode or nextFormatCodeStart > startInd then
                            nextFormatCode = code
                            nextFormatCodeStart = startInd
                            nextFormatCodeEnd = endInd
                        end
                    end
                end

                if nextFormatCode then
                    if nextFormatCode == "{FSIZE1}" then
                        fsize = 1
                    elseif nextFormatCode == "{FSIZE2}" then
                        fsize = 2
                    elseif nextFormatCode == "{FSIZE3}" then
                        fsize = 3
                    end

                    if string.sub(nextFormatCode, -1, -1) ~= "}" or nextFormatCode == "}" then -- substr, must be closed later
                        if subStrData then -- terminate existing substring
                            local subStrEnd = nextFormatCodeStart - 1
                            if subStrEnd > 0 then
                                local substr = string.sub(line, subStrData.Start, subStrEnd)
                                if not subStrData.NoLower then
                                    substr = string.lower(substr)
                                end

                                substrs[#substrs + 1] = {str = substr, color = subStrData.Color}
                            end
                        end

                        subStrData = {Start = nextFormatCodeStart} -- starts where code starts because code will be removed

                        if nextFormatCode == "{SYM" then
                            subStrData.NoLower = true
                        elseif nextFormatCode == "{CLR1" then
                            subStrData.Color = 1
                        elseif nextFormatCode == "{CLR2" then
                            subStrData.Color = 2
                        elseif nextFormatCode == "{CLR3" then
                            subStrData.Color = 3
                        end
                    end

                    line = string.sub(line, nextFormatCodeEnd + 1, -1) -- remove formatting code from line
                else
                    formatParsingDone = true
                end

                if subStrData.Start > string.len(line) then
                    formatParsingDone = true
                elseif formatParsingDone and subStrData.Start then
                    local substr = string.sub(line, subStrData.Start, -1)
                    if not subStrData.NoLower then
                        substr = string.lower(substr)
                    end

                    substrs[#substrs + 1] = {str = substr, color = subStrData.Color}
                end
            end

            btn.fsize = fsize
            if #substrs > 0 then
                btn.str = substrs
            else
                btn.str = ''
            end

            buttons[#buttons + 1] = btn
        end

        local changelogKey = '{'
        local changelogPath = dssmenu.Changelogs
        for i, v in ipairs(categories) do
            local found, foundIndex
            for i2, tbl in ipairs(changelogPath.List) do
                if tbl.Name == v then
                    found = tbl
                    foundIndex = i2
                    break
                end
            end

            if not found then
                changelogPath.List[#changelogPath.List + 1] = {
                    Name = v,
                    List = {}
                }
                foundIndex = #changelogPath.List
            end

            changelogPath = changelogPath.List[foundIndex]

            changelogKey = changelogKey .. v .. "{"

            if not changelogPath.Key then
                changelogPath.Key = changelogKey
            end

            if not dssdirectory[changelogKey] and i ~= #categories then
                dssdirectory[changelogKey] = {
                    title = v,
                    tooltip = dssmod.menuOpenToolTip,
                    fsize = 2,
                    buttons = {},
                    logtable = changelogPath,
                    generate = changelogsGenerate
                }
                dssmenu.ChangelogItems[changelogKey] = dssdirectory[changelogKey]
            end
        end

        local ind = #changelogPath.List + 1
        for i, v in ipairs(changelogPath.List) do
            if v == changelogKey then
                ind = i
            end
        end

        changelogPath.List[ind] = changelogKey

        changelogItem.keyindirectory = changelogKey
        dssdirectory[changelogKey] = changelogItem
        dssmenu.ChangelogItems[changelogKey] = changelogItem
    end

    function dssmenu.DoesLogWantNotification(log)
        local menusNotified = dssmenu.GetMenusNotified()
        if type(log) == "string" then
            return dssdirectory[log] and dssdirectory[log].wantsnotify and not menusNotified[log]
        elseif log.List then
            for _, val in ipairs(log.List) do
                if dssmenu.DoesLogWantNotification(val) then
                    return true
                end
            end
        end
    end

    function dssmenu.AddMenu(name, tbl)
        tbl.Name = name
        if not dssmenu.Menus[name] then
            dssmenu.MenuCount = (dssmenu.MenuCount or 0) + 1

            if name ~= "Menu" then
                dssdirectory.main.buttons[#dssdirectory.main.buttons + 1] = {str = string.lower(name), action = "openmenu", menu = name}
            end
        end

        dssmenu.Menus[name] = tbl
    end

    if dssmenu.Menus then
        for k, v in pairs(dssmenu.Menus) do
            if k ~= "Menu" then
                dssdirectory.main.buttons[#dssdirectory.main.buttons + 1] = {str = string.lower(k), action = "openmenu", menu = k}
            end
        end
    end

    local openCalledRecently
    function dssmenu.OpenMenu(name)
        openCalledRecently = true

        local openFromNothing = not dssmenu.OpenedMenu
        if not openFromNothing then
            if dssmenu.OpenedMenu.Close then
                dssmenu.OpenedMenu.Close(dssmenu.OpenedMenu, false, true, true)
            end
        else
            PlaySound(menusounds.Open)
        end

        dssmenu.OpenedMenu = dssmenu.Menus[name]

        if dssmenu.OpenedMenu.Open then
            dssmenu.OpenedMenu.Open(dssmenu.OpenedMenu, openFromNothing)
        end
    end

    function dssmenu.CloseMenu(fullClose, noAnimate)
        local shouldFullClose = fullClose or dssmenu.MenuCount <= 2 or dssmenu.OpenedMenu.Name == "Menu"
        if dssmenu.OpenedMenu and dssmenu.OpenedMenu.Close then
            dssmenu.OpenedMenu.Close(dssmenu.OpenedMenu, shouldFullClose, noAnimate)
        end

        if shouldFullClose then
            PlaySound(menusounds.Close)
        end

        if not shouldFullClose and dssmenu.OpenedMenu and dssmenu.OpenedMenu.Name ~= "Menu" then
            dssmenu.OpenMenu("Menu")
        elseif dssmenu.OpenedMenu then
            if noAnimate or not dssmenu.OpenedMenu.Exiting then -- support for animating menus out
                dssmenu.OpenedMenu = nil
            else
                dssmenu.ExitingMenu = true
            end
        end
    end

    function dssmenu.IsOpen()
        return dssmenu.OpenedMenu and not dssmenu.OpenedMenu.Exiting
    end

    function dssmenu.CanOpenGlobalMenu()
        return dssmenu.MenuCount ~= 2 or #dssmenu.Changelogs.List > 1
    end

    function dssmenu.GetCoreInput() -- allows overriding the menu's input
        return MenuProvider.GetCoreInput()
    end

    function dssmenu.OpenMenuToPath(name, item, path, preventClosing)
        local menu = dssmenu.Menus[name]
        if not menu.Directory then
            error("Unsupported menu passed to DeadSeaScrollsMenu.OpenMenuToPath.", 2)
        end

        local dir, key = menu.Directory, menu.DirectoryKey
        DeadSeaScrollsMenu.OpenMenu(name)

        key.Item = dir[item]
        key.PreviousItem = nil

        if path then
            for i, v in ipairs(path) do
                if type(v) == "string" then
                    path[i] = dir[v]
                elseif v.menu then
                    local menu2 = dssmenu.Menus[v.menu]
                    if menu2.Directory then
                        path[i] = menu2.Directory[v.item]
                        path[i].menuname = v.menu
                    else
                        error("Unsupported menu passed to DeadSeaScrollsMenu.OpenMenuToPath.", 2)
                    end
                else
                    error("Invalid path passed to DeadSeaScrollsMenu.OpenMenuToPath.", 2)
                end
            end
        end

        key.Path = path or {}
        if preventClosing then
            key.PreventClosing = true
        end

        key.Main = item
    end

    function dssmenu.QueueMenuOpen(name, item, priority)
        local placeAt = #dssmenu.QueuedMenus + 1
        for i, menu in ipairs(dssmenu.QueuedMenus) do
            if priority > menu.priority then
                placeAt = i
                break
            end
        end

        table.insert(dssmenu.QueuedMenus, placeAt, {menu = name, item = item, priority = priority})
    end

    function dssmod:DisablePlayerControlsInMenu(player)
        local open = dssmenu.IsOpen()
        if open then
            player.ControlsCooldown = math.max(player.ControlsCooldown, 15)
            player:GetData().MenuDisabledControls = true
        else
            player:GetData().MenuDisabledControls = nil
        end
    end

    dssmod:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, dssmod.DisablePlayerControlsInMenu)

    function dssmod:CheckMenuOpen()
        openCalledRecently = false
        dssmod.checkMenu()
    end

    dssmod:AddCallback(ModCallbacks.MC_POST_RENDER, dssmod.CheckMenuOpen)

    local recentGameStart = false
    function dssmod:CloseMenuOnGameStart()
        if not openCalledRecently and dssmenu.IsOpen() then
            dssmenu.CloseMenu(true, true)
        end

        recentGameStart = true
    end

    dssmod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, dssmod.CloseMenuOnGameStart)

    function dssmod:OpenQueuedMenus()
        if #dssmenu.QueuedMenus > 0 and not dssmenu.IsOpen() then
            local first, exceptFirst = dssmenu.QueuedMenus[1], nil
            if #dssmenu.QueuedMenus > 1 then
                exceptFirst = {}
                for i = #dssmenu.QueuedMenus, 2, -1 do
                    exceptFirst[#exceptFirst + 1] = dssmenu.QueuedMenus[i]
                end
            end

            dssmenu.OpenMenuToPath(first.menu, first.item, exceptFirst, false)
            dssmenu.QueuedMenus = {}
        end

        if recentGameStart then -- this is delayed from game start to allow mods to add changelogs on game start without breaking notifications / popups
            recentGameStart = nil

            local popups = dssmenu.GetMenusPoppedUp()
            local shouldSave
            for k, v in pairs(dssdirectory) do
                if v.wantspopup then
                    if not popups[k] then
                        popups[k] = true
                        dssmenu.QueueMenuOpen("Menu", k, 0)
                        shouldSave = true
                    end
                end
            end

            for k, v in pairs(popups) do
                if not dssdirectory[k] or not dssdirectory[k].wantspopup then
                    popups[k] = nil
                    shouldSave = true
                end
            end

            local notifies = dssmenu.GetMenusNotified()
            for k, v in pairs(notifies) do
                if not dssdirectory[k] or not dssdirectory[k].wantsnotify then
                    notifies[k] = nil
                    shouldSave = true
                end
            end

            if shouldSave then
                MenuProvider.SaveMenusPoppedUp(popups)
                MenuProvider.SaveMenusNotified(notifies)
                MenuProvider.SaveSaveData()
            end
        end
    end

    dssmod:AddCallback(ModCallbacks.MC_POST_UPDATE, dssmod.OpenQueuedMenus)

    function dssmenu.RemoveCallbacks()
        dssmod:RemoveCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, dssmod.DisablePlayerControlsInMenu)
        dssmod:RemoveCallback(ModCallbacks.MC_POST_RENDER, dssmod.CheckMenuOpen)
        dssmod:RemoveCallback(ModCallbacks.MC_POST_GAME_STARTED, dssmod.CloseMenuOnGameStart)
        dssmod:RemoveCallback(ModCallbacks.MC_POST_UPDATE, dssmod.OpenQueuedMenus)
    end

    dssmenu.AddMenu("Menu", {Run = dssmod.runMenu, Open = dssmod.openMenu, Close = dssmod.closeMenu, Directory = dssdirectory, DirectoryKey = dssdirectorykey})

    DeadSeaScrollsMenu = dssmenu
end

if not dssmenu or (dssmenu.CoreVersion < DSSCoreVersion) then
    if dssmenu then
        dssmenu.RemoveCallbacks()
    else
        dssmenu = {Menus = {}}
    end

    dssmenu.CoreVersion = DSSCoreVersion
    dssmenu.CoreMod = DSSModName
    DeadSeaScrollsMenu = dssmenu
end

function MenuProvider.IsMenuCore()
    return DeadSeaScrollsMenu.CoreMod == DSSModName
end

function MenuProvider.GetCoreInput()
    return menuinput
end

if MenuProvider.IsMenuCore() then
    InitializeMenuCore()
end

return dssmod

end

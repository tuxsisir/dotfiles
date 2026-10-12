---@diagnostic disable: undefined-global
-- Launch apps with Alt shortcuts
--

-- lets the `hs` CLI talk to Hammerspoon (debugging from a terminal)
require("hs.ipc")

-- Chrome profile directories depend on which account was signed in first, so
-- they differ per Mac. Override them in the untracked ~/.hammerspoon/local.lua:
--   return { chrome = { personal = { dir = "Profile 2" }, work = { dir = "Default" } } }
-- (check a profile's directory under "Profile Path" in chrome://version)
local chromeProfiles = {
	personal = { dir = "Default", title = "Sisir (Personal)" },
	work = { dir = "Profile 2", title = "Sisir (Work)" },
}

local ok, localConfig = pcall(dofile, hs.configdir .. "/local.lua")
if ok and type(localConfig) == "table" and localConfig.chrome then
	for key, override in pairs(localConfig.chrome) do
		for field, value in pairs(override) do
			chromeProfiles[key][field] = value
		end
	end
end

local function focusOrOpenChromeProfile(profileName, windowTitlePart)
	local chrome = hs.application.get("Google Chrome")
	local targetWindow = nil

	-- print("Searching for Chrome... Found: " .. tostring(chrome))
	if chrome then
		local windows = chrome:allWindows()
		-- print("windows --")
		-- print(hs.inspect(windows))
		for _, win in ipairs(windows) do
			local title = win:title()
			-- print("Checking window: %s", title)
			-- Case-insensitive search for the profile name in the title
			if win:title():lower():find(windowTitlePart:lower(), 1, true) then
				targetWindow = win
				break
			end
		end
	end

	if targetWindow then
		-- 1. Focus the specific window
		targetWindow:focus()
		-- 2. Bring the whole app to the front
		targetWindow:application():activate()
	else
		-- 3. ONLY run this if the window doesn't exist at all
		-- We use 'open -na' to ensure it handles the profile correctly
		local cmd = "open -na 'Google Chrome' --args --profile-directory='" .. profileName .. "'"
		hs.execute(cmd)
	end
end

-- Create a filter that excludes the junk
-- local myHintsFilter = hs.window.filter.new()
-- myHintsFilter:rejectApp("Stickies")
-- myHintsFilter:rejectApp("Finder") -- Optional: keep it clean
-- You can also reject specific window titles if needed
-- Set the style to be more predictable
-- hs.hints.style = "vimperator"
-- hs.hints.fontName = "Helvetica-Bold"
-- hs.hints.fontSize = 35 -- Make them BIG so you don't have to squint
--
-- -- Optional: Limit the characters to your "Power Keys" (left hand)
-- hs.hints.hintChars = {"A", "S", "D", "F", "Q", "W", "E", "R"}
--
-- hs.hotkey.bind({"alt"}, "tab", function()
--     hs.hints.windowHints()
-- end)

-- =============================================================================
-- KEYBOARD LEFT
-- =============================================================================


hs.hotkey.bind({ "alt" }, "Q", function()
	hs.application.launchOrFocus("Ghostty")
end)

-- PERSONAL PROFILE
hs.hotkey.bind({ "alt" }, "W", function()
	focusOrOpenChromeProfile(chromeProfiles.personal.dir, chromeProfiles.personal.title)
end)

hs.hotkey.bind({ "alt" }, "E", function()
	focusOrOpenChromeProfile(chromeProfiles.work.dir, chromeProfiles.work.title)
end)


hs.hotkey.bind({ "alt" }, "A", function()
     hs.application.launchOrFocus("Google Gemini")
end)

hs.hotkey.bind({ "alt" }, "F", function()
	hs.application.launchOrFocus("Finder")
end)

hs.hotkey.bind({ "alt" }, "R", function()
	hs.application.launchOrFocus("Reminders")
end)

hs.hotkey.bind({ "alt" }, "Space", function()
	hs.application.launchOrFocus("Stickies")
end)

hs.hotkey.bind({ "alt" }, "S", function()
	hs.application.launchOrFocus("Simplenote")
end)

hs.hotkey.bind({ "alt" }, "X", function()
	hs.application.launchOrFocus("X")
end)

-- =============================================================================
-- KEYBOARD RIGHT
-- =============================================================================
--

-- WORK PROFILE


hs.hotkey.bind({ "alt" }, "O", function()
	hs.application.launchOrFocus("Obsidian")
end)

hs.hotkey.bind({ "alt" }, "M", function()
	hs.application.launchOrFocus("WhatsApp")
end)

hs.hotkey.bind({ "alt" }, "N", function()
	hs.application.launchOrFocus("Notes")
end)

hs.hotkey.bind({ "alt" }, "L", function()
	hs.application.launchOrFocus("Antigravity")
end)

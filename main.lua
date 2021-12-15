
resolution = {
	x = 1280,
	y = 720
}
base_resolution = {
	x = 640,
	y = 360
}

state = 1
newlyState = true

currentLevel = {}

debuggrid = false

scenes = {}

--json = require("misc.json")

require("editor")
require("util")

function love.load()
	local resizable
	-- LÖVE for Android turns the screen to landscape if resizable is true. We do not want this.
	if love.system.getOS() == 'Android' then
		resizable = false
	else
		resizable = true
	end

	love.window.setMode(resolution.x, resolution.y, { resizable = resizable })
	love.window.setTitle("Chuzzle Mindbender Editor")
	love.graphics.setDefaultFilter( 'nearest', 'nearest', 4 )

	assets = {
		chuzz = {
			red = NewImage("chuzz1"),
			green = NewImage("chuzz2"),
			blue = NewImage("chuzz3"),
			orange = NewImage("chuzz4"),
			yellow = NewImage("chuzz5"),
			pink = NewImage("chuzz6"),
			white = NewImage("chuzz7"),
			cyan = NewImage("chuzz8"),
		},
		eyes = NewImage("eyes"),
		chuzz_bg = NewImage("chuzz_bg"),
		fonts = {
			default = love.graphics.newFont(11),
			defaultSmall = love.graphics.newFont(20),
			defaultMedium = love.graphics.newFont(24),
			defaultBig = love.graphics.newFont(40)
		},
		debug_grid = NewImage("_debug_grid")
	}

	-- Initialize the level data
	for x = 1, 6 do
		currentLevel[x] = {}
		for y = 1, 6 do
			currentLevel[x][y] = 0
		end
	end

	love.graphics.setFont(assets.fonts.default)
end

function love.update()
	if newlyState then
		if state == 1 then
			scenes.editor.init()
		end

		newlyState = false
	end

	if state == 1 then
		scenes.editor.update()
	end

	oldmousedown = love.mouse.isDown(1)

	if love.keyboard.isDown('f3') then
		if love.keyboard.isDown('g') and not oldgriddebug then
			if debuggrid then
				debuggrid = false
			else
				debuggrid = true
			end
		end
		oldgriddebug = love.keyboard.isDown('g')
	end
end

function love.draw()
	love.graphics.setBackgroundColor(0.3, 0.3, 0.4)

	if state == 1 then
		scenes.editor.draw()
	end

	love.graphics.setFont(assets.fonts.default)
	love.graphics.setColor(1,1,1)

	if debuggrid then
		for x = 0,math.ceil(resolution.x/32) do
			for y = 0,math.ceil(resolution.y/32) do
				love.graphics.draw(assets.debug_grid, ScaledX(x*32), ScaledY(y*32), 0, ScaledX(), ScaledY())
			end
		end
		love.graphics.print("Debug Grid On", 5, 460)
	end

	love.graphics.print("FPS: "..love.timer.getFPS(), 5, 10)
end

function love.resize(w, h)
	resolution.x = w
	resolution.y = h

	-- Hack for ultratall devices like my Nokia 5.4.
	if resolution.y / resolution.x > 2 then
		resolution.y = math.ceil(e.resolution.x * 1.36)
	end
end

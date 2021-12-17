
scenes.editor = {}

pointedChuzz = {
	x = -1,
	y = -1
}

function scenes.editor.init()

end

function scenes.editor.update()
	if CheckMouseCollisionScaled(3*32, 2*32, 6*32, 6*32) then
		pointedChuzz.x = math.floor(love.mouse.getX() / ScaledX(32)) - 2
		pointedChuzz.y = math.floor(love.mouse.getY() / ScaledY(32)) - 1

		if love.mouse.isDown(1) and pointedChuzz.x >= 1 and pointedChuzz.y >= 1 then
			currentLevel[pointedChuzz.x][pointedChuzz.y] = currentChuzz
		end
	else
		pointedChuzz.x = -1
		pointedChuzz.y = -1
	end
end

function scenes.editor.draw()
	love.graphics.draw(assets.chuzz_bg, ScaledX(64), ScaledY(32), 0, ScaledX(), ScaledY())
	for x,row in pairs(currentLevel) do
		for y,chuzz in pairs(row) do
			local x2 = ScaledX(64 + x * 32)
			local y2 = ScaledY(32 + y * 32)
			if pointedChuzz.x == x and pointedChuzz.y == y then
				love.graphics.setColor(1,1,1)
				love.graphics.rectangle("fill", x2, y2, ScaledX(32), ScaledY(32))
			end
			love.graphics.draw(assets.chuzz[chuzzID_IDToName(chuzz)], x2, y2, 0, ScaledX(), ScaledY())
			love.graphics.draw(assets.eyes, x2, y2, 0, ScaledX(), ScaledY())
		end
	end
end

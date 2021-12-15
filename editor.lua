
scenes.editor = {}

function scenes.editor.init()

end

function scenes.editor.update()

end

function scenes.editor.draw()
	love.graphics.draw(assets.chuzz_bg, ScaledX(64), ScaledY(32), 0, ScaledX(), ScaledY())
	for x,row in pairs(currentLevel) do
		for y,chuzz in pairs(row) do
			local x2 = ScaledX(64 + x * 32)
			local y2 = ScaledY(32 + y * 32)
			love.graphics.draw(assets.chuzz[chuzzID_IDToName(chuzz)], x2, y2, 0, ScaledX(), ScaledY())
			love.graphics.draw(assets.eyes, x2, y2, 0, ScaledX(), ScaledY())
		end
	end
end

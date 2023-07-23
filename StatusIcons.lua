-- Name:		StatusIcons.lua
-- Modified:	January 16, 2022
-- Author:		FreshFeeling (Kyle / RetroFreshTV)
-- Description:
--	Functions to draw little status icons for a Final Fantasy HUD upgrade script.

-- drawpoisonicon: draws an 8x8 poison icon (beaker) at the specified location
function drawpoisonicon (x, y, colour)
	-- default colour for details is green
	colour = colour or "green"

	gui.drawpixel(x+1, y  , {60, 60, 60})
	gui.drawpixel(x+2, y  , colour)
	gui.drawpixel(x+3, y  , colour)
	gui.drawpixel(x+4, y  , colour)
	gui.drawpixel(x+5, y  , {60, 60, 60})

	gui.drawpixel(x+2, y+1, {60, 60, 60})
	gui.drawpixel(x+3, y+1, colour)
	gui.drawpixel(x+4, y+1, {60, 60, 60})

	gui.drawpixel(x+2, y+2, {60, 60, 60})
	gui.drawpixel(x+3, y+2, colour)
	gui.drawpixel(x+4, y+2, {60, 60, 60})

	gui.drawpixel(x+2, y+3, {60, 60, 60})
	gui.drawpixel(x+3, y+3, colour)
	gui.drawpixel(x+4, y+3, {60, 60, 60})

	gui.drawpixel(x+1, y+4, {60, 60, 60})
	gui.drawpixel(x+2, y+4, colour)
	gui.drawpixel(x+3, y+4, colour)
	gui.drawpixel(x+4, y+4, colour)
	gui.drawpixel(x+5, y+4, {60, 60, 60})

	gui.drawpixel(x  , y+5, {60, 60, 60})
	gui.drawpixel(x+1, y+5, colour)
	gui.drawpixel(x+2, y+5, "gray")
	gui.drawpixel(x+3, y+5, "gray")
	gui.drawpixel(x+4, y+5, "gray")
	gui.drawpixel(x+5, y+5, colour)
	gui.drawpixel(x+6, y+5, {60, 60, 60})

	gui.drawpixel(x  , y+6, colour)
	gui.drawpixel(x+1, y+6, "gray")
	gui.drawpixel(x+2, y+6, "gray")
	gui.drawpixel(x+3, y+6, "gray")
	gui.drawpixel(x+4, y+6, "gray")
	gui.drawpixel(x+5, y+6, "gray")
	gui.drawpixel(x+6, y+6, colour)

	gui.drawpixel(x  , y+7, {60, 60, 60})
	gui.drawpixel(x+1, y+7, colour)
	gui.drawpixel(x+2, y+7, "gray")
	gui.drawpixel(x+3, y+7, "gray")
	gui.drawpixel(x+4, y+7, "gray")
	gui.drawpixel(x+5, y+7, colour)
	gui.drawpixel(x+6, y+7, {60, 60, 60})
	
end

-- drawsleepicon: draws an 8x8 sleep icon (crescent moon) at the specified location
function drawsleepicon (x, y, colour)
	-- default colour for details is white
	colour = colour or "white"

	gui.drawpixel(x+3, y  , {60, 60, 60})
	gui.drawpixel(x+4, y  , {60, 60, 60})

	gui.drawpixel(x+1, y+1, {60, 60, 60})
	gui.drawpixel(x+2, y+1, {60, 60, 60})
	gui.drawpixel(x+3, y+1, colour)
	gui.drawpixel(x+4, y+1, "gray")
	gui.drawpixel(x+5, y+1, {60, 60, 60})

	gui.drawpixel(x  , y+2, {60, 60, 60})
	gui.drawpixel(x+1, y+2, colour)
	gui.drawpixel(x+2, y+2, {60, 60, 60})
	gui.drawpixel(x+3, y+2, {60, 60, 60})
	gui.drawpixel(x+4, y+2, colour)
	gui.drawpixel(x+5, y+2, "gray")
	gui.drawpixel(x+6, y+2, {60, 60, 60})

	gui.drawpixel(x  , y+3, {60, 60, 60})
	gui.drawpixel(x+1, y+3, "gray")
	gui.drawpixel(x+2, y+3, "gray")
	gui.drawpixel(x+3, y+3, {60, 60, 60})
	gui.drawpixel(x+4, y+3, {60, 60, 60})
	gui.drawpixel(x+5, y+3, colour)
	gui.drawpixel(x+6, y+3, colour)
	gui.drawpixel(x+7, y+3, {60, 60, 60})
	
	gui.drawpixel(x+1, y+4, {60, 60, 60})
	gui.drawpixel(x+2, y+4, {60, 60, 60})
	gui.drawpixel(x+4, y+4, {60, 60, 60})
	gui.drawpixel(x+5, y+4, colour)
	gui.drawpixel(x+6, y+4, "gray")
	gui.drawpixel(x+7, y+4, {60, 60, 60})

	gui.drawpixel(x+2, y+5, {60, 60, 60})
	gui.drawpixel(x+3, y+5, {60, 60, 60})
	gui.drawpixel(x+4, y+5, colour)
	gui.drawpixel(x+5, y+5, "gray")
	gui.drawpixel(x+6, y+5, {60, 60, 60})

	gui.drawpixel(x+1, y+6, {60, 60, 60})
	gui.drawpixel(x+2, y+6, colour)
	gui.drawpixel(x+3, y+6, colour)
	gui.drawpixel(x+4, y+6, "gray")
	gui.drawpixel(x+5, y+6, {60, 60, 60})
	
	gui.drawpixel(x+2, y+7, {60, 60, 60})
	gui.drawpixel(x+3, y+7, {60, 60, 60})
	gui.drawpixel(x+4, y+7, {60, 60, 60})
	
end

-- drawstoneicon: draws an 8x8 stone icon at the specified location
function drawstoneicon (x, y, colour)
	-- default colour for details is white
	colour = colour or "white"

	gui.drawpixel(x+3, y  , colour)

	gui.drawpixel(x+2, y+1, colour)
	gui.drawpixel(x+3, y+1, colour)
	gui.drawpixel(x+4, y+1, colour)
	
	gui.drawpixel(x+1, y+2, "gray")
	gui.drawpixel(x+2, y+2, colour)
	gui.drawpixel(x+3, y+2, colour)
	gui.drawpixel(x+4, y+2, colour)
	gui.drawpixel(x+5, y+2, "gray")

	gui.drawpixel(x+1, y+3, colour)
	gui.drawpixel(x+2, y+3, "gray")
	gui.drawpixel(x+3, y+3, colour)
	gui.drawpixel(x+4, y+3, "gray")
	gui.drawpixel(x+5, y+3, "gray")
	
	gui.drawpixel(x+1, y+4, colour)
	gui.drawpixel(x+2, y+4, colour)
	gui.drawpixel(x+3, y+4, {60, 60, 60})
	gui.drawpixel(x+4, y+4, "gray")
	gui.drawpixel(x+5, y+4, "gray")
	
	gui.drawpixel(x+1, y+5, colour)
	gui.drawpixel(x+2, y+5, {60, 60, 60})
	gui.drawpixel(x+3, y+5, {60, 60, 60})
	gui.drawpixel(x+4, y+5, {60, 60, 60})
	gui.drawpixel(x+5, y+5, "gray")
	
	gui.drawpixel(x+2, y+6, {60, 60, 60})
	gui.drawpixel(x+3, y+6, {60, 60, 60})
	gui.drawpixel(x+4, y+6, {60, 60, 60})
	
	gui.drawpixel(x+3, y+7, {60, 60, 60})
	
end

-- drawdeadicon: draws an 8x8 dead icon (skull and crossbones) at the specified location
function drawdeadicon (x, y, colour)
	-- default colour for details is white
	colour = colour or "white"

	gui.drawpixel(x+2, y  , {60, 60, 60})
	gui.drawpixel(x+3, y  , "gray")
	gui.drawpixel(x+4, y  , "gray")
	gui.drawpixel(x+5, y  , {60, 60, 60})

	gui.drawpixel(x+1, y+1, {60, 60, 60})
	gui.drawpixel(x+2, y+1, "gray")
	gui.drawpixel(x+3, y+1, colour)
	gui.drawpixel(x+4, y+1, colour)
	gui.drawpixel(x+5, y+1, "gray")
	gui.drawpixel(x+6, y+1, {60, 60, 60})
	
	gui.drawpixel(x  , y+2, {60, 60, 60})
	gui.drawpixel(x+1, y+2, "gray")
	gui.drawpixel(x+2, y+2, {60, 60, 60})
	gui.drawpixel(x+3, y+2, colour)
	gui.drawpixel(x+4, y+2, colour)
	gui.drawpixel(x+5, y+2, {60, 60, 60})
	gui.drawpixel(x+6, y+2, "gray")
	gui.drawpixel(x+7, y+2, {60, 60, 60})
	
	gui.drawpixel(x  , y+3, {60, 60, 60})
	gui.drawpixel(x+1, y+3, "gray")
	gui.drawpixel(x+2, y+3, {60, 60, 60})
	gui.drawpixel(x+3, y+3, colour)
	gui.drawpixel(x+4, y+3, colour)
	gui.drawpixel(x+5, y+3, {60, 60, 60})
	gui.drawpixel(x+6, y+3, "gray")
	gui.drawpixel(x+7, y+3, {60, 60, 60})
	
	gui.drawpixel(x+1, y+4, {60, 60, 60})
	gui.drawpixel(x+2, y+4, "gray")
	gui.drawpixel(x+3, y+4, colour)
	gui.drawpixel(x+4, y+4, colour)
	gui.drawpixel(x+5, y+4, "gray")
	gui.drawpixel(x+6, y+4, {60, 60, 60})
	
	gui.drawpixel(x+1, y+5, colour)
	gui.drawpixel(x+2, y+5, {60, 60, 60})
	gui.drawpixel(x+3, y+5, {60, 60, 60})
	gui.drawpixel(x+4, y+5, {60, 60, 60})
	gui.drawpixel(x+5, y+5, {60, 60, 60})
	gui.drawpixel(x+6, y+5, colour)
	
	gui.drawpixel(x+1, y+6, {60, 60, 60})
	gui.drawpixel(x+2, y+6, {60, 60, 60})
	gui.drawpixel(x+3, y+6, colour)
	gui.drawpixel(x+4, y+6, colour)
	gui.drawpixel(x+5, y+6, {60, 60, 60})
	gui.drawpixel(x+6, y+6, {60, 60, 60})
	
	gui.drawpixel(x+1, y+7, {60, 60, 60})
	gui.drawpixel(x+2, y+7, colour)
	gui.drawpixel(x+3, y+7, {60, 60, 60})
	gui.drawpixel(x+4, y+7, {60, 60, 60})
	gui.drawpixel(x+5, y+7, colour)
	gui.drawpixel(x+6, y+7, {60, 60, 60})
end

-- drawsilenticon: draws an 8x8 silence icon ("..." speech bubble) at the specified location
function drawsilenticon (x, y, colour)
	-- default colour for details is white
	colour = colour or "white"

	gui.drawpixel(x+1, y+1, colour)
	gui.drawpixel(x+2, y+1, colour)
	gui.drawpixel(x+3, y+1, colour)
	gui.drawpixel(x+4, y+1, colour)
	gui.drawpixel(x+5, y+1, colour)
	
	gui.drawpixel(x  , y+2, colour)
	gui.drawpixel(x+1, y+2, colour)
	gui.drawpixel(x+2, y+2, colour)
	gui.drawpixel(x+3, y+2, colour)
	gui.drawpixel(x+4, y+2, colour)
	gui.drawpixel(x+5, y+2, colour)
	gui.drawpixel(x+6, y+2, colour)

	--- "..."
	gui.drawpixel(x  , y+3, colour)
	gui.drawpixel(x+1, y+3, {60, 60, 60})
	gui.drawpixel(x+2, y+3, colour)
	gui.drawpixel(x+3, y+3, {60, 60, 60})
	gui.drawpixel(x+4, y+3, colour)
	gui.drawpixel(x+5, y+3, {60, 60, 60})
	gui.drawpixel(x+6, y+3, colour)
	
	gui.drawpixel(x  , y+4, colour)
	gui.drawpixel(x+1, y+4, colour)
	gui.drawpixel(x+2, y+4, colour)
	gui.drawpixel(x+3, y+4, colour)
	gui.drawpixel(x+4, y+4, colour)
	gui.drawpixel(x+5, y+4, colour)
	gui.drawpixel(x+6, y+4, colour)
	
	gui.drawpixel(x+1, y+5, colour)
	gui.drawpixel(x+2, y+5, colour)
	gui.drawpixel(x+3, y+5, colour)
	gui.drawpixel(x+4, y+5, colour)
	gui.drawpixel(x+5, y+5, colour)
	
	gui.drawpixel(x+3, y+6, colour)
	
	gui.drawpixel(x+2, y+7, colour)
	
end

-- drawconfusedicon: draws an 8x8 confusion icon (music note) at the specified location
function drawconfusedicon (x, y, colour)
	-- default colour for details is yellow
	colour = colour or "yellow"

	gui.drawpixel(x+3, y  , colour)
	gui.drawpixel(x+4, y  , {60, 60, 60})
	
	gui.drawpixel(x+3, y+1, colour)
	gui.drawpixel(x+4, y+1, colour)
	gui.drawpixel(x+5, y+1, {60, 60, 60})
	
	gui.drawpixel(x+3, y+2, colour)
	gui.drawpixel(x+4, y+2, {60, 60, 60})
	gui.drawpixel(x+5, y+2, colour)
	gui.drawpixel(x+6, y+2, {60, 60, 60})

	gui.drawpixel(x+3, y+3, colour)
	gui.drawpixel(x+4, y+3, {60, 60, 60})
	gui.drawpixel(x+5, y+3, colour)
	gui.drawpixel(x+6, y+3, {60, 60, 60})
	
	gui.drawpixel(x+3, y+4, colour)
	gui.drawpixel(x+4, y+4, {60, 60, 60})
	
	gui.drawpixel(x+3, y+5, colour)
	gui.drawpixel(x+4, y+5, {60, 60, 60})
	
	gui.drawpixel(x+1, y+6, colour)
	gui.drawpixel(x+2, y+6, colour)
	gui.drawpixel(x+3, y+6, colour)
	gui.drawpixel(x+4, y+6, {60, 60, 60})

	gui.drawpixel(x+0, y+7, colour)
	gui.drawpixel(x+1, y+7, colour)
	gui.drawpixel(x+2, y+7, colour)
	gui.drawpixel(x+3, y+7, {60, 60, 60})
	
end

-- drawblindicon: draws an 8x8 blind icon (face with glasses) at the specified location
function drawblindicon (x, y, colour)
	-- default colour for details is sort of a caucasian-ish (?) skin tone - like a light pink
	colour = colour or {255, 182, 193}

	gui.drawpixel(x+1, y+1, colour)
	gui.drawpixel(x+2, y+1, colour)
	gui.drawpixel(x+3, y+1, colour)
	gui.drawpixel(x+4, y+1, colour)
	gui.drawpixel(x+5, y+1, colour)
	
	gui.drawpixel(x  , y+2, colour)
	gui.drawpixel(x+1, y+2, colour)
	gui.drawpixel(x+2, y+2, colour)
	gui.drawpixel(x+3, y+2, colour)
	gui.drawpixel(x+4, y+2, colour)
	gui.drawpixel(x+5, y+2, colour)
	gui.drawpixel(x+6, y+2, colour)

	-- glasses rim
	gui.drawpixel(x  , y+3, {60, 60, 60})
	gui.drawpixel(x+1, y+3, {60, 60, 60})
	gui.drawpixel(x+2, y+3, {60, 60, 60})
	gui.drawpixel(x+3, y+3, {60, 60, 60})
	gui.drawpixel(x+4, y+3, {60, 60, 60})
	gui.drawpixel(x+5, y+3, {60, 60, 60})
	gui.drawpixel(x+6, y+3, {60, 60, 60})
	
	-- glasses eye-holes top
	gui.drawpixel(x  , y+4, colour)
	gui.drawpixel(x+1, y+4, {60, 60, 60})
	gui.drawpixel(x+2, y+4, {60, 60, 60})
	gui.drawpixel(x+3, y+4, colour)
	gui.drawpixel(x+4, y+4, {60, 60, 60})
	gui.drawpixel(x+5, y+4, {60, 60, 60})
	gui.drawpixel(x+6, y+4, colour)

	-- glasses eye-holes bottom
	gui.drawpixel(x  , y+5, colour)
	gui.drawpixel(x+1, y+5, {60, 60, 60})
	gui.drawpixel(x+2, y+5, {60, 60, 60})
	gui.drawpixel(x+3, y+5, colour)
	gui.drawpixel(x+4, y+5, {60, 60, 60})
	gui.drawpixel(x+5, y+5, {60, 60, 60})
	gui.drawpixel(x+6, y+5, colour)
	
	gui.drawpixel(x+1, y+6, colour)
	gui.drawpixel(x+2, y+6, colour)
	gui.drawpixel(x+3, y+6, colour)
	gui.drawpixel(x+4, y+6, colour)
	gui.drawpixel(x+5, y+6, colour)
	
	gui.drawpixel(x+2, y+7, colour)
	gui.drawpixel(x+3, y+7, colour)
	gui.drawpixel(x+4, y+7, colour)
	
end

-- drawslowicon: draws an 8x8 slow icon (rewind symbol; left-pointing arrows) at the specified location
function drawslowicon (x, y, colour)
	-- default colour for details is white
	colour = colour or "white"

	gui.drawpixel(x+2, y+2, colour)
	gui.drawpixel(x+3, y+2, colour)
	gui.drawpixel(x+5, y+2, colour)
	gui.drawpixel(x+6, y+2, colour)
	
	gui.drawpixel(x+1, y+3, colour)
	gui.drawpixel(x+2, y+3, colour)
	gui.drawpixel(x+4, y+3, colour)
	gui.drawpixel(x+5, y+3, colour)
	
	gui.drawpixel(x  , y+4, colour)
	gui.drawpixel(x+1, y+4, colour)
	gui.drawpixel(x+3, y+4, colour)
	gui.drawpixel(x+4, y+4, colour)
	
	gui.drawpixel(x+1, y+5, colour)
	gui.drawpixel(x+2, y+5, colour)
	gui.drawpixel(x+4, y+5, colour)
	gui.drawpixel(x+5, y+5, colour)
	
	gui.drawpixel(x+2, y+6, colour)
	gui.drawpixel(x+3, y+6, colour)
	gui.drawpixel(x+5, y+6, colour)
	gui.drawpixel(x+6, y+6, colour)
	
end

-- drawfasticon: draws an 8x8 fast icon (fast forward symbol; right-pointing arrows) at the specified location
function drawfasticon (x, y, colour)
	-- default colour for details is red (sort of inspired by later FF games)
	colour = colour or "red"

	gui.drawpixel(x  , y+2, colour)
	gui.drawpixel(x+1, y+2, colour)
	gui.drawpixel(x+3, y+2, colour)
	gui.drawpixel(x+4, y+2, colour)
	
	gui.drawpixel(x+1, y+3, colour)
	gui.drawpixel(x+2, y+3, colour)
	gui.drawpixel(x+4, y+3, colour)
	gui.drawpixel(x+5, y+3, colour)
	
	gui.drawpixel(x+2, y+4, colour)
	gui.drawpixel(x+3, y+4, colour)
	gui.drawpixel(x+5, y+4, colour)
	gui.drawpixel(x+6, y+4, colour)
	
	gui.drawpixel(x+1, y+5, colour)
	gui.drawpixel(x+2, y+5, colour)
	gui.drawpixel(x+4, y+5, colour)
	gui.drawpixel(x+5, y+5, colour)
	
	gui.drawpixel(x  , y+6, colour)
	gui.drawpixel(x+1, y+6, colour)
	gui.drawpixel(x+3, y+6, colour)
	gui.drawpixel(x+4, y+6, colour)
	
end

-- drawstunicon: draws an 8x8 stun icon (pause symbol) at the specified location
function drawstunicon (x, y, colour)
	-- default colour for details is white
	colour = colour or "white"

	gui.drawpixel(x  , y  , colour)
	gui.drawpixel(x+1, y  , colour)
	gui.drawpixel(x+2, y  , {60, 60, 60})
	gui.drawpixel(x+4, y  , colour)
	gui.drawpixel(x+5, y  , colour)
	gui.drawpixel(x+6, y  , {60, 60, 60})

	gui.drawpixel(x  , y+1, colour)
	gui.drawpixel(x+1, y+1, colour)
	gui.drawpixel(x+2, y+1, {60, 60, 60})
	gui.drawpixel(x+4, y+1, colour)
	gui.drawpixel(x+5, y+1, colour)
	gui.drawpixel(x+6, y+1, {60, 60, 60})
	
	gui.drawpixel(x  , y+2, colour)
	gui.drawpixel(x+1, y+2, colour)
	gui.drawpixel(x+2, y+2, {60, 60, 60})
	gui.drawpixel(x+4, y+2, colour)
	gui.drawpixel(x+5, y+2, colour)
	gui.drawpixel(x+6, y+2, {60, 60, 60})
	
	gui.drawpixel(x  , y+3, colour)
	gui.drawpixel(x+1, y+3, colour)
	gui.drawpixel(x+2, y+3, {60, 60, 60})
	gui.drawpixel(x+4, y+3, colour)
	gui.drawpixel(x+5, y+3, colour)
	gui.drawpixel(x+6, y+3, {60, 60, 60})

	gui.drawpixel(x  , y+4, colour)
	gui.drawpixel(x+1, y+4, colour)
	gui.drawpixel(x+2, y+4, {60, 60, 60})
	gui.drawpixel(x+4, y+4, colour)
	gui.drawpixel(x+5, y+4, colour)
	gui.drawpixel(x+6, y+4, {60, 60, 60})
	
	gui.drawpixel(x  , y+5, colour)
	gui.drawpixel(x+1, y+5, colour)
	gui.drawpixel(x+2, y+5, {60, 60, 60})
	gui.drawpixel(x+4, y+5, colour)
	gui.drawpixel(x+5, y+5, colour)
	gui.drawpixel(x+6, y+5, {60, 60, 60})
	
	gui.drawpixel(x  , y+6, colour)
	gui.drawpixel(x+1, y+6, colour)
	gui.drawpixel(x+2, y+6, {60, 60, 60})
	gui.drawpixel(x+4, y+6, colour)
	gui.drawpixel(x+5, y+6, colour)
	gui.drawpixel(x+6, y+6, {60, 60, 60})
	
	gui.drawpixel(x  , y+7, {60, 60, 60})
	gui.drawpixel(x+1, y+7, {60, 60, 60})
	gui.drawpixel(x+4, y+7, {60, 60, 60})
	gui.drawpixel(x+5, y+7, {60, 60, 60})

end
-- Name:		PartyInfoIcons.lua
-- Modified:	January 16, 2022
-- Author:		FreshFeeling (Kyle / RetroFreshTV)
-- Description:
--	Upgrade the HUD for PCs for Final Fantasy. Writes no values to memory! It shouldn't affect gameplay other than
-- giving more/clearer info.

-- RAM locations

-- In-battle
inbattle_off  = 0x6BA6; -- 0 in battle, 1 out of battle

character_1_base_off		= 0x6100; -- base offset for character 1's base stats
character_2_base_off		= 0x6140; -- base offset for character 2's base stats
character_3_base_off		= 0x6180; -- base offset for character 3's base stats
character_4_base_off		= 0x61C0; -- base offset for character 4's base stats

character_1_ib_off  = 0x6802; -- base offset for character 1's in-battle stats
character_2_ib_off  = 0x6814; -- base offset for character 2's in-battle stats
character_3_ib_off  = 0x6826; -- base offset for character 3's in-battle stats
character_4_ib_off	= 0x6838; -- base offset for character 4's in-battle stats

gui_left_x      	= 201;  -- the left x coordinate of the new GUI
gui_top_y      		= 11;   -- the top y coordinate of the new GUI
gui_right_x    		= 249;  -- the right x coordinate of the new GUI
gui_char_space      = 53;   -- the amount of space allowed for each character in the new GUI

character_1_name_location	= 40;  -- position of character 1's name on screen in battle, as a y-coordinate
character_2_name_location 	= 88;  -- position of character 2's name on screen in battle, as a y-coordinate
character_3_name_location 	= 136; -- position of character 3's name on screen in battle, as a y-coordinate
character_4_name_location 	= 184; -- position of character 4's name on screen in battle, as a y-coordinate

character_1_region 	= gui_top_y;                  -- y-coordinate for the top of character 1's portion of the GUI
character_2_region 	= gui_top_y+gui_char_space;   -- y-coordinate for the top of character 2's portion of the GUI
character_3_region 	= gui_top_y+gui_char_space*2; -- y-coordinate for the top of character 3's portion of the GUI
character_4_region 	= gui_top_y+gui_char_space*3; -- y-coordinate for the top of character 4's portion of the GUI

hp_colour			= "white"; -- default colour for HP
status_colour		= "white"; -- default colour for status

refresh_time   		= 2.5; --refresh cycle time in seconds

stat_array_length   = 10;  -- number of stats that are cycled through for display
stat_array_position = 0; -- default starting position (just initialized; really doesn't matter)

hp_current_off		= 0x0A; -- offset of current HP (2 bytes)
hp_max_off			= 0x0C; -- offset of maximum HP (2 bytes)
status_off			= 0x01; -- offset of status byte

stat_name_array = {"Str.","Agi.","Int.","Vit.","Luck","Damage","Hit %","Absorb","Evade","MagDef."}; -- array with ten values corresponding to the names of the ten stat values
stat_offset_array = {0x10,0x11,0x12,0x13,0x14,0x20,0x21,0x22,0x23,0x25}; -- array with ten values corresponding to the locations of the ten stat values
stat_offset_battle_array	= {0x10,0x11,0x12,0x13,0x14,0x07,0x03,0x06,0x05,0x04}; -- array with the same stat values as used in battles

-- draw_character_hud - draws a better HUD for a single character using that character's offsets.
function draw_character_hud ( y, base_offset, ib_offset)

  -- GUI BOX --

	-- Draw GUI box for character	  
	  gui.box(gui_left_x  , y  , gui_right_x  , y+gui_char_space-2, "gray")
	  gui.box(gui_left_x+1, y+1, gui_right_x-1, y+gui_char_space-3, "white")
	  gui.box(gui_left_x+2, y+2, gui_right_x-2, y+gui_char_space-4, "gray")
	  gui.box(gui_left_x+3, y+3, gui_right_x-3, y+gui_char_space-5, "black")

  -- CHARACTER NAME --
	  
	-- Print each character's name (technically moving it from one part of the screen to another)
	-- Back when I wrote this, it made sense to me. Now I'm not sure why I did this for all four characters when everything else here only runs once. Hm.
    for i = gui_left_x+4, gui_right_x-8 do
		for j = 1, 10 do
		    local r,g,b,palette = emu.getscreenpixel(i,character_1_name_location+j,true)
			gui.drawpixel(i,character_1_region+j+3,{r, g, b,255})
			local r,g,b,palette = emu.getscreenpixel(i,character_2_name_location+j,true)
			gui.drawpixel(i,character_2_region+j+3,{r, g, b,255})
			local r,g,b,palette = emu.getscreenpixel(i,character_3_name_location+j,true)
			gui.drawpixel(i,character_3_region+j+3,{r, g, b,255})
			local r,g,b,palette = emu.getscreenpixel(i,character_4_name_location+j,true)
			gui.drawpixel(i,character_4_region+j+3,{r, g, b,255})
		end
	end
	
  -- CHARACTER HP --
	
	-- Determine character's HP colour
	-- If a character is under 25% HP, make their HP red.
	if ((memory.readword(base_offset + hp_current_off) / memory.readword(base_offset + hp_max_off))) < 0.25 then
		hp_colour = "red"
	-- If a character is over 90% HP, make their HP green.
	elseif ((memory.readword(base_offset + hp_current_off) / memory.readword(base_offset + hp_max_off))) > 0.9 then
		hp_colour = "green"
	-- Otherwise, HP is > 25% and < 90% so it's white. Default colour.
	else
		hp_colour = "white"
	end
	
  -- Print character's HP value
	gui.text(gui_left_x+4, y+14,
	memory.readword(base_offset + hp_current_off).."/"..memory.readword(base_offset + hp_max_off), hp_colour, "black")
	
  -- CHARACTER STATS --

    -- Print character's stats (rotates, with interval based on refresh_time)
	-- If the stat's in-battle value is the same as its out-of-battle value...
	if ((stat_array_position < 6) or (memory.readbyte(ib_offset + stat_offset_battle_array[stat_array_position]) == memory.readbyte(base_offset + stat_offset_array[stat_array_position]))) then
		-- ...only display a single value (no current/max format)
		gui.text(gui_left_x+4, y+24,
		  string.format("%-7s\n%3.0f",stat_name_array[stat_array_position] .. ":", memory.readbyte(base_offset + stat_offset_array[stat_array_position])),"white","black")
	else
		-- Otherwise, display both values using a current/max format
		gui.text(gui_left_x+4, y+24,
		  string.format("%-7s\n%3.0f/%-3.0f",stat_name_array[stat_array_position] .. ":", memory.readbyte(ib_offset + stat_offset_battle_array[stat_array_position]),memory.readbyte(base_offset + stat_offset_array[stat_array_position])),"white","black")
	end
	
  -- CHARACTER STATUS --
	
    -- Get the character's status byte and set default values
	character_status = memory.readbyte(base_offset + status_off)
	
	-- If the character's status byte is 1, the character is dead. Other status does not matter.
	if (character_status % 2) == 1 then
		drawdeadicon(gui_left_x+4, y+41, "white") -- draw dead icon
		gui.text(gui_left_x+14,y+41, "Dead", "red", "black") -- write "Dead"	
	-- If the character's status byte is 2, the character is petrified. Other status does not matter.
	elseif (character_status % 4) == 2 then
		drawstoneicon(gui_left_x+4, y+41, "white") -- draw stone icon
		gui.text(gui_left_x+14,y+41, "Stone", "gray", "black") -- write "Stone"
	-- If the character has at least one status (besides dead or petrify), keep checking things.
	elseif ((character_status > 0) or (memory.readbyte(ib_offset + 0x09) ~= 1)) then
		number_of_status = 0;
		status_byte_value = 4; -- This is the first value (2 squared) to check for in the status byte
		
		-- For every potential status besides dead and petrify that can be indicated in the status byte
		for status_to_check = 1, 5 do
			-- If the byte is divisible by a power of 2, add one to count the number of status
			if (character_status % (status_byte_value*2) >= status_byte_value) then
				number_of_status = number_of_status + 1
			end
			status_byte_value = status_byte_value * 2 -- Increment by squaring the value we're checking
		end
		-- Also check the hit multiplier byte for haste and slow status (separate from other status)
		if (memory.readbyte(ib_offset + 0x09)) ~= 1 then
			number_of_status = number_of_status + 1
		end
		
		-- If there's one status, print an appropriate icon and text describing it
		if (number_of_status == 1) then
			if (character_status % 8) == 4 then
				drawpoisonicon(gui_left_x+4, y+41, "green") -- draw poison icon
				gui.text(gui_left_x+14,y+41, "Poison", "green", "black") -- write "Poison"
			elseif (character_status % 16) == 8 then
				drawblindicon(gui_left_x+4, y+41, {255, 182, 193}) -- draw blind icon
				gui.text(gui_left_x+14,y+41, "Blind", "gray", "black") -- write "Blind"
			elseif (character_status % 32) == 16 then
				drawstunicon(gui_left_x+4, y+41, "white") -- draw stun icon
				gui.text(gui_left_x+14,y+41, "Stun", "gray", "black") -- write "Stun"
			elseif (character_status % 64) == 32 then
				drawsleepicon(gui_left_x+4, y+41, "white") -- draw sleep icon
				gui.text(gui_left_x+14,y+41, "Sleep", "white", "black") -- write "Sleep"
			elseif (character_status % 128) == 64 then
				drawsilenticon(gui_left_x+4, y+41, "white") -- draw silent icon
				gui.text(gui_left_x+14,y+41, "Mute", "white", "black") -- write "Mute"
			elseif (memory.readbyte(ib_offset + 0x09)) < 1 then
				drawslowicon(gui_left_x+4, y+41, "white") -- draw slow icon
				gui.text(gui_left_x+14,y+41, "Slow", "gray", "black") -- write "Slow"
			elseif (memory.readbyte(ib_offset + 0x09)) > 1 then
				drawfasticon(gui_left_x+4, y+41, "red") -- draw haste icon
				gui.text(gui_left_x+14,y+41, "Haste", "white", "black") -- write "Haste"
			end
			
		-- If there's more than one status, instead we are just going to display the various icons
		elseif (number_of_status > 1) then
			current_status_count = 0;
			
			-- Check if the character is poisoned
			if (character_status % 8) >= 4 then
				drawpoisonicon(gui_left_x+4+(current_status_count*10), y+41, "green") -- draw poison icon
				current_status_count = current_status_count + 1
			end
			if (character_status % 16) >= 8 then
				drawblindicon(gui_left_x+4+(current_status_count*10), y+41, {255, 182, 193}) -- draw blind icon
				current_status_count = current_status_count + 1
			end
			if (character_status % 32) >= 16 then
				drawstunicon(gui_left_x+4+(current_status_count*10), y+41, "white") -- draw stun icon
				current_status_count = current_status_count + 1
			end
			if (character_status % 64) >= 32 then
				drawsleepicon(gui_left_x+4+(current_status_count*10), y+41, "white") -- draw sleep icon
				current_status_count = current_status_count + 1
			end
			if (character_status % 128) >= 64 then
				drawsilenticon(gui_left_x+4+(current_status_count*10), y+41, "white") -- draw silent icon
				current_status_count = current_status_count + 1
			end
			if (memory.readbyte(ib_offset + 0x09)) < 1 then
				drawslowicon(gui_left_x+4+(current_status_count*10), y+41, "white") -- draw slow icon
				current_status_count = current_status_count + 1
			end
			if (memory.readbyte(ib_offset + 0x09)) > 1 then
				drawfasticon(gui_left_x+4+(current_status_count*10), y+41, "red") -- draw haste icon
				current_status_count = current_status_count + 1
			end
		end	
		
	end
		
end


-- Main loop!
while (true) do

  -- Attempt to determine if we're in battle! It doesn't always play nice with soft resets but it corrects after 1 battle.
  if memory.readbyte(inbattle_off) == 0 then
  
  -- Hide anything underneath the new GUI
      gui.box(gui_left_x  , gui_top_y  , gui_right_x  , gui_top_y+gui_char_space*4  , "black")

  -- This for loop re-draws the lines at the top of the battle interface
	  for i = character_1_region-1,character_1_region+4 do
		    local r,g,b,palette = emu.getscreenpixel(142,i,true)
			gui.line(130,i,141,i,{r, g, b,255})
	  end

  -- These lines remove the bounding box between the party and enemies.
  -- This is based on Kyle's personal preference and is sort of unrelated to everything else in this script.
	  local r,g,b,palette = emu.getscreenpixel(1,1,true)
	  gui.box( 128, character_1_region+4, 144, 146, {r, g, b,255})
	  
  -- This for loop re-draws the lines at the bottom of the battle interface
	  for i = 147,151 do
		    local r,g,b,palette = emu.getscreenpixel(142,i,true)
			gui.line(130, i, 141, i, {r, g, b,255})
	  end

  -- This for loop re-draws the background between the party and enemies (so it doesn't look dumb when the bounding box is removed)
	  for i = 144,161 do
		for j = character_1_region+5, character_1_region+36 do
		    local r,g,b,palette = emu.getscreenpixel(i,j,true)
			gui.drawpixel(i-16, j, {r, g, b,255})
		end
	  end
	  
  -- Set the position in the array (which stat will be displayed in the rotating stat display)
	  stat_array_position = math.floor(((emu.framecount() / (refresh_time * 60)) % stat_array_length) +1)

  -- Draw each character's stat draw_character_hud - draws a better HUD for a single character using that character's offsets.
	  draw_character_hud(character_1_region, character_1_base_off, character_1_ib_off)
	  draw_character_hud(character_2_region, character_2_base_off, character_2_ib_off)
	  draw_character_hud(character_3_region, character_3_base_off, character_3_ib_off)
	  draw_character_hud(character_4_region, character_4_base_off, character_4_ib_off)
	
  end	
	
	gui.register(CombatHUD)
	
  -- Advance to next frame
  -- @warn emulator will freeze if this call is not made
  emu.frameadvance()
end
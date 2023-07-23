require 'StatusIcons'

-- RAM locations

-- In-battle
inbattle_off  = 0x6BA6; -- 0 in battle, 1 out of battle

formation_type = 0x6C92; -- 0 for 3x3, 1 for 2x2, 2 for 2x1+3x2, 3 for boss

enemy_1_base_off		= 0x6BD3; -- base offset for enemy 1's base stats
enemy_2_base_off		= 0x6BE7; -- base offset for enemy 2's base stats
enemy_3_base_off		= 0x6BFB; -- base offset for enemy 3's base stats
enemy_4_base_off		= 0x6C0F; -- base offset for enemy 4's base stats
enemy_5_base_off		= 0x6C23; -- base offset for enemy 5's base stats
enemy_6_base_off		= 0x6C37; -- base offset for enemy 6's base stats
enemy_7_base_off		= 0x6C4B; -- base offset for enemy 7's base stats
enemy_8_base_off		= 0x6C5F; -- base offset for enemy 8's base stats
enemy_9_base_off		= 0x6C73; -- base offset for enemy 9's base stats

enemy_1_x			= 16; -- declare and assign a default x-coordinate for enemy 1
enemy_2_x			= 16; -- declare and assign a default x-coordinate for enemy 2
enemy_3_x			= 16; -- declare and assign a default x-coordinate for enemy 3
enemy_4_x			= 48; -- declare and assign a default x-coordinate for enemy 4
enemy_5_x			= 48; -- declare and assign a default x-coordinate for enemy 5
enemy_6_x			= 48; -- declare and assign a default x-coordinate for enemy 6
enemy_7_x			= 80; -- declare and assign a default x-coordinate for enemy 7
enemy_8_x			= 80; -- declare and assign a default x-coordinate for enemy 8
enemy_9_x			= 80; -- declare and assign a default x-coordinate for enemy 9

enemy_1_y			= 80; -- declare and assign a default y-coordinate for enemy 1
enemy_2_y			= 48; -- declare and assign a default y-coordinate for enemy 2
enemy_3_y			= 112; -- declare and assign a default y-coordinate for enemy 3
enemy_4_y			= 80; -- declare and assign a default y-coordinate for enemy 4
enemy_5_y			= 48; -- declare and assign a default y-coordinate for enemy 5
enemy_6_y			= 112; -- declare and assign a default y-coordinate for enemy 6
enemy_7_y			= 80; -- declare and assign a default y-coordinate for enemy 7
enemy_8_y			= 48; -- declare and assign a default y-coordinate for enemy 8
enemy_9_y			= 112; -- declare and assign a default y-coordinate for enemy 9

hp_colour			= "white"; -- default colour for HP
status_colour		= "white"; -- default colour for status

refreshTime   		= 3; --refresh cycle time in seconds

statArrayLength     = 4;  -- number of stats that are cycled through for display
statArrayPosition   = 0; -- default starting position (just initialized; really doesn't matter)

hp_current_off		= 0x02; -- offset of current HP (2 bytes)
status_off			= 0x06; -- offset of status byte
hits_off			= 0x05; -- offset of hit multiplier byte

rom_monster_base_off	= 0x30530; -- offset where monsters start in the ROM
rom_hp_max_off			= 0x04; -- offset of maximum HP (2 bytes)
rom_mor_base_off		= 0x06; -- offset of base morale in the rom
rom_eva_base_off		= 0x08; -- offset of base evasion in the rom
rom_abs_base_off		= 0x09; -- offset of base absorb in the rom
rom_hits_off			= 0x0A; -- offset of the number of attacks in the rom
rom_acc_off				= 0x0B; -- offset of the hit rate in the rom
rom_dam_base_off		= 0x0C; -- offset of base damage in the rom
rom_crit_off			= 0x0D; -- offset of the crit rate in the rom


statNameArray = {"Abs.","Mor.","Eva.","Dam."}; -- array with values corresponding to the names of the stat values
statOffsetArray = {0x04,0x09,0x0A,0x0B}; -- array with values corresponding to the locations of the stat values

function locateEnemies (formation_value)
	if (formation_value == 1) then
		-- 2x2 formation: there are up to four enemies, spaced in a grid
		enemy_1_x			= 16;
		enemy_2_x			= 16;
		enemy_3_x			= 64;
		enemy_4_x			= 64;
		
		enemy_1_y			= 48;
		enemy_2_y			= 96;
		enemy_3_y			= 48;
		enemy_4_y			= 96;
	elseif (formation_value == 2) then
		-- 2x1+3x2 formation: there are up to eight enemies with irregular spacing
		enemy_1_x			= 16;
		enemy_2_x			= 16;
		enemy_3_x			= 64;
		enemy_4_x			= 64;
		enemy_5_x			= 64;
		enemy_6_x			= 96;
		enemy_7_x			= 96;
		enemy_8_x			= 96;

		enemy_1_y			= 48;
		enemy_2_y			= 96;
		enemy_3_y			= 80;
		enemy_4_y			= 48;
		enemy_5_y			= 112;
		enemy_6_y			= 80;
		enemy_7_y			= 48;
		enemy_8_y			= 112;
	elseif (formation_value > 2) then
	    -- boss or endboss formation? There's only one enemy. Put the info near the bottom center
		enemy_1_x			= 48;
		enemy_1_y			= 112;
	end
end

function monsterStats (x, y, base_offset)
	
	
	if ((memory.readword(base_offset + hp_current_off) ~= 0) and ((memory.readbyte(base_offset + status_off) % 2) ~= 1)) then
	
		gui.opacity(0.60)
	
		-- MONSTER HP --
		
		-- Determine monster's HP colour
		if ((memory.readword(base_offset + hp_current_off)/memory.readword(base_offset + rom_hp_max_off)))<0.25 then
			hp_colour = "red"
		elseif ((memory.readword(base_offset + hp_current_off)/memory.readword(base_offset + rom_hp_max_off)))> 0.9 then
			hp_colour = "green"
		else
			hp_colour = "white"
		end
		
	-- Print monster's HP value
		gui.text(x, y+1, memory.readword(base_offset + hp_current_off).."/"..memory.readword(base_offset + rom_hp_max_off), hp_colour, "black")
		
	  -- MONSTER STATS --

		-- Print monster's stats (rotates, with interval based on refreshTime)
		-- Display a single value (no current/max format)
			gui.text(x, y+10, statNameArray[statArrayPosition] .. ":" .. memory.readbyte(base_offset + statOffsetArray[statArrayPosition]),"white","black")
		
		gui.opacity(1)
	
	  -- MONSTER STATUS --
		
		-- Get the monster's status byte and set default values
		monster_status = memory.readbyte(base_offset + status_off)
		
		-- If the monster's status byte is 1, the monster is dead. Other status does not matter.
		if (monster_status % 2) == 1 then
			drawdeadicon(x   ,y+20, "white") -- draw dead icon
			gui.text(x+10,y+20, "Dead", "red", "black") -- write "Dead"	
		-- If the monster's status byte is 2, the monster is petrified. Other status does not matter.
		elseif (monster_status % 4) == 2 then
			drawstoneicon(x   ,y+20, "white") -- draw stone icon
			gui.text(x+10,y+20, "Stone", "gray", "black") -- write "Stone"
		-- If the monster has at least one status (besides dead or petrify), keep checking things.
		elseif ((monster_status > 0) or (memory.readbyte(base_offset + hits_off) ~= 1)) then
			numberOfStatus = 0;
			statusByteValue = 4; -- This is the first value (2 squared) to check for in the status byte
			
			-- For every potential status besides dead and petrify that can be indicated in the status byte
			for statusToCheck = 1, 6 do
				-- If the byte is divisible by a power of 2, add one to count the number of status
				if (monster_status % (statusByteValue*2) >= statusByteValue) then
					numberOfStatus = numberOfStatus + 1
				end
				statusByteValue = statusByteValue * 2 -- Increment by squaring the value we're checking
			end
			-- Also check the hit multiplier byte for haste and slow status (separate from other status)
			if (memory.readbyte(base_offset + hits_off)) ~= 1 then
				numberOfStatus = numberOfStatus + 1
			end
			
			-- If there's one status, print an appropriate icon and text describing it
			if (numberOfStatus == 1) then
				if (monster_status % 8) == 4 then
					drawpoisonicon(x  ,y+20, "green") -- draw poison icon
					gui.text(x+10 ,y+20, "Poison", "green", "black") -- write "Poison"
				elseif (monster_status % 16) == 8 then
					drawblindicon(x  ,y+20, {255, 182, 193}) -- draw blind icon
					gui.text(x+10,y+20, "Blind", "gray", "black") -- write "Blind"
				elseif (monster_status % 32) == 16 then
					drawstunicon(x   ,y+20, "white") -- draw stun icon
					gui.text(x+10,y+20, "Stun", "gray", "black") -- write "Stun"
				elseif (monster_status % 64) == 32 then
					drawsleepicon(x  ,y+20, "white") -- draw sleep icon
					gui.text(x+10,y+20, "Sleep", "white", "black") -- write "Sleep"
				elseif (monster_status % 128) == 64 then
					drawsilenticon(x ,y+20, "white") -- draw silent icon
					gui.text(x+10,y+20, "Mute", "white", "black") -- write "Mute"
				elseif (monster_status > 127) then
					drawconfusedicon(x ,y+20, "yellow") -- draw confused icon
					gui.text(x+10,y+20, "Conf.", "yellow", "black") -- write "Conf."
				elseif (memory.readbyte(base_offset + hits_off)) < 1 then
					drawslowicon(x   ,y+20, "white") -- draw slow icon
					gui.text(x+10,y+20, "Slow", "gray", "black") -- write "Slow"
				elseif (memory.readbyte(base_offset + hits_off)) > 1 then
					drawfasticon(x   ,y+20, "red") -- draw haste icon
					gui.text(x+10,y+20, "Haste", "white", "black") -- write "Haste"
				end
				
			-- If there's more than one status, instead we are just going to display the various icons
			elseif (numberOfStatus > 1) then
				currentStatusCount = 0;
				
				-- Check if the monster is poisoned
				if (monster_status % 8) >= 4 then
					drawpoisonicon(x+(currentStatusCount*10), y+20, "green") -- draw poison icon
					currentStatusCount = currentStatusCount + 1
				end
				if (monster_status % 16) >= 8 then
					drawblindicon(x+(currentStatusCount*10), y+20, {255, 182, 193}) -- draw blind icon
					currentStatusCount = currentStatusCount + 1
				end
				if (monster_status % 32) >= 16 then
					drawstunicon(x+(currentStatusCount*10), y+20, "white") -- draw stun icon
					currentStatusCount = currentStatusCount + 1
				end
				if (monster_status % 64) >= 32 then
					drawsleepicon(x+(currentStatusCount*10), y+20, "white") -- draw sleep icon
					currentStatusCount = currentStatusCount + 1
				end
				if (monster_status % 128) >= 64 then
					drawsilenticon(x+(currentStatusCount*10), y+20, "white") -- draw silent icon
					currentStatusCount = currentStatusCount + 1
				end
				if monster_status > 127 then
					drawconfusedicon(x+(currentStatusCount*10), y+20, "yellow") -- draw confused icon
					currentStatusCount = currentStatusCount + 1
				end
				if (memory.readbyte(base_offset + hits_off)) < 1 then
					drawslowicon(x+(currentStatusCount*10), y+20, "white") -- draw slow icon
					currentStatusCount = currentStatusCount + 1
				end
				if (memory.readbyte(base_offset + hits_off)) > 1 then
					drawfasticon(x+(currentStatusCount*10), y+20, "red") -- draw haste icon
					currentStatusCount = currentStatusCount + 1
				end
			end	
			
		end
		
	end
end



while (true) do

    
  if memory.readbyte(inbattle_off) == 0 then
    
	locateEnemies(memory.readbyte(formation_type));
	  
  -- Set the position in the array (which stat will be displayed in the rotating stat display)
	  
	  statArrayPosition = math.floor(((emu.framecount() / (refreshTime * 60)) % statArrayLength) +1)

  -- Draw each monster's stat block!
	  
  	monsterStats(enemy_1_x, enemy_1_y, enemy_1_base_off)
  	monsterStats(enemy_2_x, enemy_2_y, enemy_2_base_off)
  	monsterStats(enemy_3_x, enemy_3_y, enemy_3_base_off)
  	monsterStats(enemy_4_x, enemy_4_y, enemy_4_base_off)
  	monsterStats(enemy_5_x, enemy_5_y, enemy_5_base_off)
  	monsterStats(enemy_6_x, enemy_6_y, enemy_6_base_off)
  	monsterStats(enemy_7_x, enemy_7_y, enemy_7_base_off)
  	monsterStats(enemy_8_x, enemy_8_y, enemy_8_base_off)
  	monsterStats(enemy_9_x, enemy_9_y, enemy_9_base_off)

	
  end	
	
  -- Advance to next frame
  -- @warn emulator will freeze if this call is not made
  emu.frameadvance()
end
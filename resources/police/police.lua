--[[
Copyright (c) 2010 MTA: Paradise

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.
]]

-- getPlayerName with spaces instead of _ for player names
local _getPlayerName = getPlayerName
local getPlayerName = function( x ) return _getPlayerName( x ):gsub( "_", " " ) end

-- addCommandHandler supporting arrays as command names (multiple commands with the same function)
local addCommandHandler_ = addCommandHandler
      addCommandHandler  = function( commandName, fn, restricted, caseSensitive )
	-- add the default command handlers
	if type( commandName ) ~= "table" then
		commandName = { commandName }
	end
	for key, value in ipairs( commandName ) do
		if key == 1 then
			addCommandHandler_( value, fn, restricted, caseSensitive )
		else
			addCommandHandler_( value,
				function( player, ... )
					-- check if he has permissions to execute the command, default is not restricted (aka if the command is restricted - will default to no permission; otherwise okay)
					if hasObjectPermissionTo( player, "command." .. commandName[ 1 ], not restricted ) then
						fn( player, ... )
					end
				end
			)
		end
	end
end

-- /duty for police
addCommandHandler( { "policeduty", "duty" },
	function( thePlayer, commandName )
		if exports.players:isLoggedIn( thePlayer ) then
			local inPD, factionID, factionName, factionTag = exports.factions:isPlayerInFactionType( thePlayer, 1 )
			if inPD and factionTag then
				setPlayerSkin ( thePlayer, 280 )
				setPedArmor ( thePlayer, 100 )
				setWeaponAmmo ( thePlayer, 3, 1 )
				setWeaponAmmo ( thePlayer, 24, 500 )
				setWeaponAmmo ( thePlayer, 25, 100 )
				setWeaponAmmo ( thePlayer, 29, 1500 )
				setWeaponAmmo ( thePlayer, 41, 1000 )
			else
				outputChatBox( "(( You are not in a Government faction. ))", thePlayer, 255, 0, 0 )
			end
		end
	end
)

-- /swatduty for police
addCommandHandler( { "swatduty", "swat" },
	function( thePlayer, commandName )
		if exports.players:isLoggedIn( thePlayer ) then
			local inPD, factionID, factionName, factionTag = exports.factions:isPlayerInFactionType( thePlayer, 1 )
			if inPD and factionTag then
				setPlayerSkin ( thePlayer, 285 )
				setPedArmor ( thePlayer, 100 )
				setWeaponAmmo ( thePlayer, 3, 1 )
				setWeaponAmmo ( thePlayer, 23, 500 )
				setWeaponAmmo ( thePlayer, 27, 100 )
				setWeaponAmmo ( thePlayer, 29, 1500 )
				setWeaponAmmo ( thePlayer, 31, 1000 )
				setWeaponAmmo ( thePlayer, 34, 200 )
			else
				outputChatBox( "(( You are not in a Government faction. ))", thePlayer, 255, 0, 0 )
			end
		end
	end
)

--[[
Copyright (c) 2010 MTA: Paradise

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.
]]

-- getPlayerName with spaces instead of _ for player names
local _getPlayerName = getPlayerName
local getPlayerName = function( x ) return _getPlayerName( x ):gsub( "_", " " ) end

-- addCommandHandler supporting arrays as command names (multiple commands with the same function)
local addCommandHandler_ = addCommandHandler
      addCommandHandler  = function( commandName, fn, restricted, caseSensitive )
	-- add the default command handlers
	if type( commandName ) ~= "table" then
		commandName = { commandName }
	end
	for key, value in ipairs( commandName ) do
		if key == 1 then
			addCommandHandler_( value, fn, restricted, caseSensitive )
		else
			addCommandHandler_( value,
				function( player, ... )
					-- check if he has permissions to execute the command, default is not restricted (aka if the command is restricted - will default to no permission; otherwise okay)
					if hasObjectPermissionTo( player, "command." .. commandName[ 1 ], not restricted ) then
						fn( player, ... )
					end
				end
			)
		end
	end
end

-- /duty for police
addCommandHandler( { "policeduty", "duty" },
	function( thePlayer, commandName )
		if exports.players:isLoggedIn( thePlayer ) then
			local inPD, factionID, factionName, factionTag = exports.factions:isPlayerInFactionType( thePlayer, 1 )
			if inPD and factionTag then
				setPlayerSkin ( thePlayer, 280 )
				setPedArmor ( thePlayer, 100 )
				giveWeapon ( thePlayer, 3, 1 )
				giveWeapon ( thePlayer, 24, 500 )
				giveWeapon ( thePlayer, 25, 100 )
				giveWeapon ( thePlayer, 29, 1500 )
				giveWeapon ( thePlayer, 41, 1000 )
			else
				outputChatBox( "(( You are not in a Government faction. ))", thePlayer, 255, 0, 0 )
			end
		end
	end
)

-- /swatduty for police
addCommandHandler( { "swatduty", "swat" },
	function( thePlayer, commandName )
		if exports.players:isLoggedIn( thePlayer ) then
			local inPD, factionID, factionName, factionTag = exports.factions:isPlayerInFactionType( thePlayer, 1 )
			if inPD and factionTag then
				setPlayerSkin ( thePlayer, 285 )
				setPedArmor ( thePlayer, 100 )
				giveWeapon ( thePlayer, 3, 1 )
				giveWeapon ( thePlayer, 23, 500 )
				giveWeapon ( thePlayer, 27, 100 )
				giveWeapon ( thePlayer, 29, 1500 )
				giveWeapon ( thePlayer, 31, 1000 )
				giveWeapon ( thePlayer, 34, 200 )
				giveWeapon ( thePlayer, 45, 1 )
			else
				outputChatBox( "(( You are not in a Government faction. ))", thePlayer, 255, 0, 0 )
			end
		end
	end
)

-- /iduty for police
addCommandHandler( "iduty",
	function( thePlayer, commandName )
		if exports.players:isLoggedIn( thePlayer ) then
			local inPD, factionID, factionName, factionTag = exports.factions:isPlayerInFactionType( thePlayer, 1 )
			if inPD and factionTag then
				setPedArmor ( thePlayer, 50 )
				giveWeapon ( thePlayer, 22, 500 )
				giveWeapon ( thePlayer, 43, 500 )
			else
				outputChatBox( "(( You are not in a Government faction. ))", thePlayer, 255, 0, 0 )
			end
		end
	end
)

-- /cadet for police
addCommandHandler( { "cadet", "cadetduty" },
	function( thePlayer, commandName )
		if exports.players:isLoggedIn( thePlayer ) then
			local inPD, factionID, factionName, factionTag = exports.factions:isPlayerInFactionType( thePlayer, 1 )
			if inPD and factionTag then
				setPlayerSkin ( thePlayer, 280 )
				setPedArmor ( thePlayer, 100 )
				giveWeapon ( thePlayer, 3, 1 )
				giveWeapon ( thePlayer, 24, 200 )
				giveWeapon ( thePlayer, 41, 500 )
			else
				outputChatBox( "(( You are not in a Government faction. ))", thePlayer, 255, 0, 0 )
			end
		end
	end
)

-- /firefighter for ES
addCommandHandler( "firefighter",
	function( thePlayer, commandName )
		if exports.players:isLoggedIn( thePlayer ) then
			local inPD, factionID, factionName, factionTag = exports.factions:isPlayerInFactionType( thePlayer, 2 )
			if inPD and factionTag then
				setPlayerSkin ( thePlayer, 277 )
				giveWeapon ( thePlayer, 9, 1 )
			else
				outputChatBox( "(( You are not in a Government faction. ))", thePlayer, 255, 0, 0 )
			end
		end
	end
)

-- /medic for ES
addCommandHandler( "firefighter",
	function( thePlayer, commandName )
		if exports.players:isLoggedIn( thePlayer ) then
			local inPD, factionID, factionName, factionTag = exports.factions:isPlayerInFactionType( thePlayer, 2 )
			if inPD and factionTag then
				setPlayerSkin ( thePlayer, 276 )
				giveWeapon ( thePlayer, 41, 500 )
			else
				outputChatBox( "(( You are not in a Government faction. ))", thePlayer, 255, 0, 0 )
			end
		end
	end
)

-- /offduty for police
addCommandHandler( "offduty",
	function( thePlayer, commandName )
		if exports.players:isLoggedIn( thePlayer ) then
			local inPD, factionID, factionName, factionTag = exports.factions:isPlayerInFactionType( thePlayer, 1 )
			if inPD and factionTag then
				setPedArmor ( thePlayer, 0 )
				takeAllWeapons ( thePlayer )
			else
				outputChatBox( "(( You are not in a Government faction. ))", thePlayer, 255, 0, 0 )
			end
		end
	end
)
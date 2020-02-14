local aName, aTable = ...;
local require = ExiWoW.require

aTable.loot = function(self)
	-- Use this if you want to extend the default triggers, such as electric/frost spells etc
	-- Feel free to supply any interesting triggers you find to the official project!
	local RPText = require("RPText");
	local Func = require("Func");
	local Loot = require("Loot");
	local Item = Loot.Item;
	local Condition = require("Condition");
	

	-- Root extension
	local evtIsKill = Condition.get("is_monster_kill");
	local evtIsForage = Condition.get("is_forage");
	local ty = Condition.Types;

	local loot = {}
	table.insert(loot, Loot:new({
		conditions = {
			evtIsForage,
			Condition:new({type=ty.RTYPE_ZONE, data="Netherstorm", sender=true}),
			Condition:new({type=ty.RTYPE_SUBZONE, data="Area 52", sender=true}),
			{
				Condition:new({type=ty.RTYPE_LOC, data={x = 32.57, y=66.94, rad=0.2}, sender=true}),
				Condition:new({type=ty.RTYPE_LOC, data={x = 31.2, y=67.02, rad=0.16}, sender=true}),
				Condition:new({type=ty.RTYPE_LOC, data={x = 33.39, y=64.37, rad=0.2}, sender=true}),
			}
		},
		items={
			Item:new({
				type = "Charges", 
				id = "GOBLIN_BUZZROCKET", 
				chance = 1,
				quant = math.huge,
				sound = 1213,
				text = RPText:new({
					text_receiver = "This old goblin grinder rocket contraption looks to have been obsoleted and thrown away.\nMaybe I could find another use for it..."
				})
			})
		}
	}))


	-- Jade rod
	table.insert(loot, Loot:new({
		conditions = {
			evtIsForage,
			Condition:new({type=ty.RTYPE_ZONE, data="The Jade Forest", sender=true}),
			{
				Condition:new({type=ty.RTYPE_LOC, data={x = 39.39, y=46.2, rad=0.21}, sender=true}),
				Condition:new({type=ty.RTYPE_LOC, data={x = 47.58, y=31.97, rad=0.17}, sender=true}),
				Condition:new({type=ty.RTYPE_LOC, data={x = 48.24, y=30.62, rad=0.14}, sender=true}),
				Condition:new({type=ty.RTYPE_LOC, data={x = 48.61, y=31.53, rad=0.24}, sender=true}),
				Condition:new({type=ty.RTYPE_LOC, data={x = 45.21, y=22.31, rad=0.18}, sender=true}),
			}
		},
		items={
			Item:new({
				type = "Charges", 
				id = "JADE_ROD", 
				chance = 1,
				quant = math.huge,
				sound = 1221,
				text = RPText:new({
					text_receiver = "You found a jade rod! It seems to be pulsating gently..."
				})
			})
		}
	}))


	-- Shara's fel rod
	table.insert(loot, Loot:new({
		conditions = {
			evtIsForage,
			Condition:new({type=ty.RTYPE_ZONE, data="Highmountain", sender=true}),
			Condition:new({type=ty.RTYPE_SUBZONE, data="Bloodhunt Highland", sender=true}),
			Condition:new({type=ty.RTYPE_LOC, data={x = 50.85, y=25.39, rad=0.11}, sender=true}),
		},
		items={
			Item:new({
				type = "Charges", 
				id = "SHARAS_FEL_ROD", 
				chance = 1,
				quant = math.huge,
				sound = 1191,
				text = RPText:new({
					text_receiver = "You found an uncomfortable pulsating fel iron rod. You decide that it'd be better with you than with Shara..."
				})
			})
		}
	}))

	-- Mushrooms
	table.insert(loot, Loot:new({
		conditions = {
			evtIsForage,
			Condition:new({type=ty.RTYPE_TAG, data={"ZONE_MUSHROOMS"}, sender=true}),
		},
		items={
			Item:new({
				type = "Charges", 
				id = "PULSATING_MUSHROOM", 
				chance = 0.5,
				quant = 1,
				quantRand = 3,
				sound = 1221,
				text = RPText:new({
					text_receiver = "You found %Q pulsating mushroom%Qs!"
				})
			})
		}
	}))

	-- Mushroom underwear
	table.insert(loot, Loot:new({
		conditions = {
			evtIsForage,
			Condition:new({type=ty.RTYPE_ZONE, data="Zangarmarsh", sender=true}),
			Condition:new({type=ty.RTYPE_SUBZONE, data="Sporeggar", sender=true}),
		},
		items={
			Item:new({
				type = "Underwear", 
				id = "MUSHROOM_UNDERWEAR", 
				chance = 0.25,
				sound = 1185,
				text = RPText:new({
					text_receiver = "You find an interesting cluster of mushrooms that seem to shape themselves to your body!"
				})
			})
		}
	}))

	-- Headmistress' paddle
	table.insert(loot, Loot:new({
		conditions = {
			evtIsForage,
			Condition:new({type=ty.RTYPE_ZONE, data="Azsuna", sender=true}),
			Condition:new({type=ty.RTYPE_SUBZONE, data="Hall of Arcane Learning", sender=true}),
		},
		items={
			Item:new({
				type = "Charges", 
				id = "HEADMISTRESS_PADDLE", 
				chance = 0.75,
				quant = math.huge,
				sound = 1199,
				text = RPText:new({
					text_receiver = "You found the headmistress' paddle laying around. You decide it's probably better for someone more... 'responsible' to hold it."
				})
			})
		}
	}));



	-- World containers
	-- World containers

	-- Pulsating mana gem
		-- Shard (25%)
		table.insert(loot, Loot:new({
			conditions = {
				evtIsWorldContainer,
				Condition:new({type=ty.RTYPE_NAME, data="Ancient Mana Shard", sender=true}),
			},
			items = {
				Item:new({
					type = "Charges",
					id = "PULSATING_MANA_GEM",
					quant = 1,
					chance = 0.25,
					sound = 1221,
					text = RPText:new({
						text_receiver = "You found a pulsating mana gem!"
					})
				})
			}
		}))

		-- Chunk (50%)
		table.insert(loot, Loot:new({
			conditions = {
				evtIsWorldContainer,
				Condition:new({type=ty.RTYPE_NAME, data="Ancient Mana Chunk", sender=true}),
			},
			items = {
				Item:new({
					type = "Charges",
					id = "PULSATING_MANA_GEM",
					quant = 1,
					quantRand = 3,
					chance = 0.5,
					sound = 1221,
					text = RPText:new({
						text_receiver = "You found %Q pulsating mana gem%Qs!"
					})
				})
			}
		}))


	-- This will cause the property to self delete, it's not needed. 
	return loot
end
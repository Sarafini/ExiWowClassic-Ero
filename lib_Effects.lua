local aName, aTable = ...;
local require = ExiWoW.require

aTable.effects = function(self)

	local Effect = require("Effect");
	local Timer = require("Timer");
	local Action = require("Action");
	local RPText = require("RPText");
	local Func = require("Func");
	local Event = require("Event");
	local out = {};

	-- These are Effect effect definitions
	table.insert(out, Effect:new({
		id = "debuffShardTickleButt",
		detrimental = true,
		duration = 10,
		ticking = 0,
		max_stacks = 1,
		texture = "Interface/Icons/inv_enchanting_wod_crystalshard2",
		name = "Vibrating Shard",
		description = "A vibrating shard is lodged between your buttcheeks!",
		onAdd = function()
			Func.get("toggleVibHubProgram")("SMALL_TICKLE", 11);
		end,
		onRemove = function()
			Func.get("toggleVibHubProgram")("SMALL_TICKLE");
		end
	}));

	table.insert(out, Effect:new({
		id = "debuffShardTickleBreasts",
		detrimental = true,
		duration = 10,
		ticking = 0,
		max_stacks = 1,
		texture = "Interface/Icons/inv_enchanting_wod_crystalshard2",
		name = "Vibrating Shard",
		description = "A vibrating shard is lodged between your breasts!",
		onAdd = function()
			Func.get("toggleVibHubProgram")("SMALL_TICKLE", 11);
		end,
		onRemove = function()
			Func.get("toggleVibHubProgram")("SMALL_TICKLE");
		end
	}));
	table.insert(out, Effect:new({
		id = "debuffShardTickleGroin",
		detrimental = true,
		duration = 10,
		ticking = 0,
		max_stacks = 1,
		texture = "Interface/Icons/inv_enchanting_wod_crystalshard2",
		name = "Vibrating Shard",
		description = "A vibrating shard is stuck in your underwear!",
		onAdd = function()
			Func.get("toggleVibHubProgram")("SMALL_TICKLE", 11);
		end,
		onRemove = function()
			Func.get("toggleVibHubProgram")("SMALL_TICKLE");
		end
	}));
	
	-- /run Effect.run("oozeInClothes")
	table.insert(out, Effect:new({
		id = "oozeInClothes",
		detrimental = true,
		duration = 600,
		ticking = 5,
		max_stacks = 1,
		texture = "Interface/Icons/inv_misc_food_legion_gooslime_chunk",
		name = "Ooze",
		description = "Living ooze has made it into your clothes! Right click to remove it.",
		onAdd = function(self, binding, fromReload)
			self.rightClicked = false
			Func.get("toggleVibHubProgram")("IDLE_OOZE", 600)
			if not fromReload then
				RPText.trigger("FX_OozeInClothesAdd", "player", "player", ExiWoW.ME, ExiWoW.ME)
			end
		end,
		onTick = function(self)
			if math.random() < 0.35 then
				RPText.trigger("FX_OozeInClothesTick", "player", "player", ExiWoW.ME, ExiWoW.ME)
			end
		end,
		onRemove = function(self)
			Func.get("toggleVibHubProgram")("IDLE_OOZE")
			
			if not self.rightClicked then
				RPText.trigger("FX_OozeInClothesFade", "player", "player", ExiWoW.ME, ExiWoW.ME)
			end
			--Func.get("toggleVibHubProgram")("SMALL_TICKLE");
		end,
		onRightClick = function(self, data)
			self.rightClicked = true
			local effect = data.effect
			local id = data.id

			-- Create a custom removal action
			local remAction =  Action:new({
				id = "_",
				name = "Remove Goo",
				description = "Removes the living goo from your clothes.",
				texture = "ability_bossfelmagnaron_handempowered",
				cooldown = 0,
				cast_sound_loop = 79252,
				cast_time = 5,
				description = "Fondle a player.",
				texture = "ability_paladin_handoflight",
				--cooldown = 1.5,
				cast_sound_success = 57179,
				conditions = {
					Condition.get("is_self"),
					Condition.get("sender_no_combat"),
					Condition.get("sender_not_moving"),
				},
				not_defaults = {
					"not_in_instance"
				},
				-- Handle the receiving end here
				fn_send = function(self, sender, target, suppressErrors)
		
					RPText.trigger("FX_OozeInClothesRem", "player", "player", ExiWoW.ME, ExiWoW.ME)
					Effect.rem(id)

					return false
				end
			})
			Action.useOnTarget(remAction, "player")
			
			return false
		end
	}));

	-- /run Effect.run("PULSATING_MUSHROOM")
	table.insert(out, Effect:new({
		id = "PULSATING_MUSHROOM",
		detrimental = true,
		duration = 0,
		max_stacks = 1,
		texture = "Interface/Icons/druid_ability_wildmushroom_b",
		name = "Pulsating Mushroom",
		description = "Someone stuck a pulsating mushroom in your clothes! Right click to remove it.",
		sound_loop = 25152,
		onAdd = function(self, binding, fromReload)
			self.rightClicked = false
			Func.get("toggleVibHubProgram")("PULSATING_MUSHROOM", math.huge)
			self.interval = Timer.set(function()
				ExiWoW.ME:addExcitement(0.01)
			end, 2, math.huge)
		end,
		onRemove = function(self)
			Timer.clear(self.interval);
			Func.get("toggleVibHubProgram")("PULSATING_MUSHROOM")
			if not self.rightClicked then
				RPText.trigger("FX_PULSATING_MUSHROOM_REM", "player","player", ExiWoW.ME, ExiWoW.ME)
			end
		end,
		onRightClick = function(self, data)
			self.rightClicked = true
			local effect = data.effect
			local id = data.id

			-- Create a custom removal action
			local remAction =  Action:new({
				id = "_",
				name = "Remove Mushroom",
				description = "Removes the mushroom from your clothes.",
				texture = "ability_bossfelmagnaron_handempowered",
				cooldown = 0,
				cast_sound_loop = 79252,
				cast_time = 1.5,
				conditions = {
					Condition.get("is_self"),
					Condition.get("sender_no_combat"),
					Condition.get("sender_not_moving"),
				},
				not_defaults = {
					"not_in_instance"
				},
				-- Handle the receiving end here
				fn_send = function(self, sender, target, suppressErrors)
		
					--id, senderUnit, receiverUnit, senderChar, receiverChar, eventData, event, action, debug
					RPText.trigger("FX_PULSATING_MUSHROOM_REM", "player","player",ExiWoW.ME, ExiWoW.ME)
					Effect.rem(id)

					return false
				end
			})
			Action.useOnTarget(remAction, "player")
			
			return false
		end
	}));

	-- PULSATING_MANA_GEM
	table.insert(out, Effect:new({
		id = "PULSATING_MANA_GEM",
		detrimental = true,
		duration = 10,
		max_stacks = 1,
		ticking = 2,
		texture = "Interface/Icons/inv_leycrystalmedium",
		name = "Pulsating Mana Gem",
		description = "Someone stuck a pulsating mana gem in your clothes!",
		sound_loop = 75484,
		onAdd = function(self, binding, fromReload)
			local isNightborne = UnitRace("player") == "Nightborne";
			local program = "PULSATING_MANA_GEM";
			if isNightborne then program = program.."_NIGHTBORNE"; end
			Func.get("toggleVibHubProgram")(program, math.huge);
		end,
		onTick = function()
			local amount = 0.03;
			if UnitRace("player") == "Nightborne" then 
				amount = amount*2; 
				Func.get("painSound")(self);
			end
			ExiWoW.ME:addExcitement(amount);
		end,
		onRemove = function(self)
			local isNightborne = UnitRace("player") == "Nightborne";
			local program = "PULSATING_MANA_GEM";
			if isNightborne then program = program.."_NIGHTBORNE"; end
			Func.get("toggleVibHubProgram")(program);
		end,
	}));




	table.insert(out, Effect:new({
		id = "VINE_SQUIRM",
		detrimental = true,
		duration = 15,
		max_stacks = 1,
		ticking = 2,
		texture = "Interface/Icons/spell_nature_magicimmunity",
		name = "Squirming Thong",
		description = "Your vine thong is squirming!",
		sound_loop = 25152,
		onAdd = function(self, binding, fromReload)
			Effect.remByTagsNotThis(self, "VINE_THONG");
			Func.get("toggleVibHubProgram")("VINE_THONG", math.huge);
			local function onUnderwearChange()
				if not ExiWoW.ME:getUnderwear() or ExiWoW.ME:getUnderwear().id ~= "EVERLIVING_VINE_THONG" then
					Effect.remByID("VINE_SQUIRM");
				end
			end
			self.onUnderwearEquip = Event.on(Event.Types.ACTION_UNDERWEAR_EQUIP, onUnderwearChange);
			self.onUnderwearRemove = Event.on(Event.Types.ACTION_UNDERWEAR_UNEQUIP, onUnderwearChange);
			
		end,
		onTick = function()
			local amount = 0.03;
			ExiWoW.ME:addExcitement(amount);
		end,
		onRemove = function(self)
			if self.onUnderwearEquip then Event.off(self.onUnderwearEquip); end
			if self.onUnderwearRemove then Event.off(self.onUnderwearRemove); end
			Func.get("toggleVibHubProgram")("VINE_THONG");
		end,
		tags = {"VINE_THONG"}
	}));




	-- MossyVine
	table.insert(out, Effect:new({
		id = "MossyVine",
		detrimental = true,
		duration = 20,
		max_stacks = 1,
		ticking = 2,
		texture = "Interface/Icons/inv_misc_herb_evergreenmoss",
		name = "Mossy Vine",
		description = "A mossy vine is wriggling between your breasts!",
		sound_loop = 25152,
		onAdd = function(self, binding, fromReload)end,
		onTick = function()
			if math.random() < 0.5 then
				RPText.trigger("FX_MossyVine_tick", "player", "player", ExiWoW.ME, ExiWoW.ME);
			end
		end,
		onRemove = function(self)end,
	}));

	-- Mushroom underwear
	table.insert(out, Effect:new({
		id = "MUSHROOM_UNDERWEAR",
		detrimental = true,
		duration = 0,
		max_stacks = 1,
		texture = "Interface/Icons/Inv_misc_herb_ghostmushroomcap",
		name = "Pulsating Mushroom",
		description = "Your underwear are alive.",
		onAdd = function(self, binding, fromReload)
			Func.get("toggleVibHubProgram")("PULSATING_MUSHROOM_SMALL", math.huge)
			self.interval = Timer.set(function()
				ExiWoW.ME:addExcitement(0.01)
			end, 1, math.huge)
		end,
		onRemove = function(self)
			Timer.clear(self.interval);
			Func.get("toggleVibHubProgram")("PULSATING_MUSHROOM_SMALL")
		end
	}));

	-- Thong of valor
	table.insert(out, Effect:new({
		id = "THONG_OF_VALOR",
		detrimental = true,
		duration = 0,
		max_stacks = 1,
		texture = "Interface/Icons/70_inscription_vantus_rune_odyn",
		name = "Thong of Valor",
		description = "Runic magic amplified by combat pulses through your groin.",
		onAdd = function(self, binding, fromReload)
			Func.get("toggleVibHubProgram")("THONG_OF_VALOR", math.huge)
			self.interval = Timer.set(function()
				ExiWoW.ME:addExcitement(0.025)
			end, 1, math.huge)
		end,
		onRemove = function(self)
			Timer.clear(self.interval);
			Func.get("toggleVibHubProgram")("THONG_OF_VALOR")
		end
	}));
	

	-- Groin rumble totem
	table.insert(out, Effect:new({
		id = "GROIN_RUMBLE_TOTEM",
		detrimental = true,
		duration = 300,
		max_stacks = 1,
		texture = "Interface/Icons/spell_nature_tremortotem",
		name = "Rumble Totem",
		description = "You are being stimulated by a rumble totem.",
		sound_loop = 23269,
		onAdd = function(self, binding, fromReload)
			Func.get("toggleVibHubProgram")("GROIN_RUMBLE_TOTEM", math.huge)
			self.interval = Timer.set(function()
				ExiWoW.ME:addExcitement(0.02)
			end, 2, math.huge)
		end,
		onRemove = function(self)
			Timer.clear(self.interval);
			Func.get("toggleVibHubProgram")("GROIN_RUMBLE_TOTEM")
			PlaySound(2555, "SFX");
		end,
		onRightClick = function(self, data)
			local effect = data.effect;
			local id = data.id;

			-- Create a custom removal action
			local remAction =  Action:new({
				id = "_",
				name = "Remove Totem",
				description = "Removes the rumble totem stimulating you.",
				texture = "spell_nature_tremortotem",
				cooldown = 0,
				cast_sound = 1198,
				cast_time = 1.5,
				conditions = {
					Condition.get("is_self"),
					Condition.get("sender_no_combat"),
					Condition.get("sender_not_moving"),
				},
				not_defaults = {
					"not_in_instance"
				},
				-- Handle the receiving end here
				fn_send = function(self, sender, target, suppressErrors)
					Effect.rem(id);
					return false
				end
			})
			Action.useOnTarget(remAction, "player")
			
			return false
		end
	}));


	-- Slithering Thong
	-- /run Effect.run("oozeInClothes")
	table.insert(out, Effect:new({
		id = "slitheringThong",
		detrimental = true,
		duration = 600,
		ticking = 20,
		max_stacks = 1,
		texture = "Interface/Icons/inv_qiraj_skinsandworm",
		name = "Slithering Thong",
		description = "Moistening the thong has made it come to life. Periodically arouses.",
		onAdd = function(self, binding, fromReload)
			Func.get("toggleVibHubProgram")("IDLE_OOZE", math.huge);
			if not fromReload then
				RPText.trigger("FX_SlitheringThongAdd", "player", "player", ExiWoW.ME, ExiWoW.ME)
			end
		end,
		onTick = function(self)
			if math.random() < 0.2 then
				RPText.trigger("FX_SlitheringThongProc", "player", "player", ExiWoW.ME, ExiWoW.ME)
			end
		end,
		onRemove = function(self)
			Func.get("toggleVibHubProgram")("IDLE_OOZE");
		end,
	}));

	return out
end
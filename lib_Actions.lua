local aName, aTable = ...;
local require = ExiWoW.require;

aTable.actions = function(self)

	local out = {}
	
	local libAssets = ExiWoW.LibAssets;
	local Action = require("Action");
	local Effect = require("Effect");
	local Func = require("Func");
	local toggleVibHubProgram = Func.get("toggleVibHubProgram");
	local Condition = require("Condition");
	local Timer = require("Timer");
	local RPText = require("RPText");
	local Event = require("Event");

	
	-- Fondle (Public) --
	table.insert(out, Action:new({
		id = "FONDLE",
		name = "Fondle",
		description = "Fondle a player.",
		texture = "ability_paladin_handoflight",
		cooldown = 10,
		cast_sound_success = 57179,
		conditions = {
			Condition.get("melee_range"),
		},
		not_defaults = {
			"not_in_instance"
		},
		max_distance = Action.MELEE_RANGE,
		fn_send = Action.sendRPText,
		fn_receive = function(self, sender, target, args)
			-- Custom actions
			Func.get("addExcitementDefault")();
			return self:receiveRPText(sender, target, args); -- Default behavior
		end
	}));


	-- /run ExiWoW.require("Event").on("SOUNDKIT_FINISHED", function(data) print("Soundkit finished", data[1]) end)
	-- /run PlaySound(50858,"SFX",false,true);
	-- /run ExiWoW.ME:addItem("Charges", "GOBLIN_BUZZROCKET", math.huge);
	-- Goblin Buzzrocket (Item) --
	table.insert(out, Action:new({
		id = "GOBLIN_BUZZROCKET",
		name = "Experimental Buzzrocket",
		description = "An experimental goblin buzzrocket to enjoy some me-time with. The rocket fuel makes it hightly volatile.",
		texture = "ability_mount_rocketmount",
		cast_time = 6,
		charges = 0,
		--cast_sound_start = 43508,
		cast_sound_loop = 50858,
		rarity = 3,
		conditions = {
			Condition.get("sender_not_moving"),
			Condition.get("only_selfcast"),
		},
		not_defaults = {},
		fn_cast = function(self)
			RPText.trigger(self.id, "player", "player", ExiWoW.ME, ExiWoW.ME, nil, nil, self);
			Timer.clear(self.interval)
			self.interval = Timer.set(function()
				Func.get("addExcitementDefault")(self, true)
			end, 1, 30)
			toggleVibHubProgram("BUZZROCKET", 20);
		end,
		fn_done = function(self, success)
			Timer.clear(self.interval)
			toggleVibHubProgram("BUZZROCKET");
			return true
		end
	}));


	-- Jade rod (Item) --
	table.insert(out, Action:new({
		id = "JADE_ROD",
		name = "Jade Rod",
		description = "A smooth jade rod to play with.",
		texture = "inv_misc_silverjadenecklace",
		cast_time = 20,
		charges = 0,
		rarity = 3,
		cast_sound_start = 39653,
		cast_sound_loop = 39638,
		conditions = {
			Condition.get("sender_not_moving"),
			Condition.get("only_selfcast"),
		},
		not_defaults = {},
		fn_cast = function(self)
			RPText.trigger(self.id, "player", "player", ExiWoW.ME, ExiWoW.ME, nil, nil, self);
			Timer.clear(self.interval)
			self.interval = Timer.set(function()
				Func.get("addExcitementDefault")(self, true);
			end, 1, 30)
			toggleVibHubProgram("JADE_ROD", 20)
		end,
		fn_done = function(self, success)
			Timer.clear(self.interval)
			toggleVibHubProgram("JADE_ROD")
			return true
		end
	}));

	-- Shara's Fel Rod (Item) --
	table.insert(out, Action:new({
		id = "SHARAS_FEL_ROD",
		name = "Shara's Fel Rod",
		description = "A barely polished rod of fel iron with glowing green runes. Looks powerful, but not very pleasurable.",
		texture = "Inv_rod_enchantedfelsteel",
		cast_time = 20,
		charges = 0,
		rarity = 3,
		cast_sound_start = 85131,
		cast_sound_loop = 85132,
		conditions = {
			Condition.get("sender_not_moving"),
			Condition.get("only_selfcast"),
		},
		not_defaults = {},
		fn_cast = function(self)
			RPText.trigger(self.id, "player", "player", ExiWoW.ME, ExiWoW.ME, nil, nil, self);
			Timer.clear(self.interval)
			self.interval = Timer.set(function()
				Func.get("addExcitementDefault")(self, true);
			end, 1, 30)
			toggleVibHubProgram("SHARAS_FEL_ROD", 20)
		end,
		fn_done = function(self, success)
			Timer.clear(self.interval)
			toggleVibHubProgram("SHARAS_FEL_ROD")
			return true
		end
	}));

	-- Groin Rumble Totem (Item) --
	-- /run ExiWoW.ME:addItem("Charges", "GROIN_RUMBLE_TOTEM", math.huge);
	table.insert(out, Action:new({
		id = "GROIN_RUMBLE_TOTEM",
		name = "Groin Tremble Totem",
		description = "Stick in your target's pants to stimulate them for 5 minutes or until they remove it. Weaker than a regular Tremble Totem, but still pretty powerful.",
		texture = "spell_nature_tremortotem",
		cast_time = 0,
		charges = 0,
		rarity = 3,
		cooldown = 120,
		cast_sound_start = 1217,
		--cast_sound_loop = 85132,
		conditions = {
			Condition.get("sender_not_moving"),
			Condition.get("melee_range"),
		},
		not_defaults = {},
		fn_send = Action.sendRPText,
		fn_receive = function(self, sender, target, args)
			Effect.run("GROIN_RUMBLE_TOTEM");
			return self:receiveRPText(sender, target, args); -- Default behavior
		end
	}));



	-- Pulsating mushroom consumable
	table.insert(out, Action:new({
		id = "PULSATING_MUSHROOM",
		name = "Pulsating Mushroom",
		description = "Stick a pulsating mushroom into your target's underwear. It will remain until manually removed.",
		texture = "druid_ability_wildmushroom_b",
		cast_time = 2,
		charges = 0,
		rarity = 3,
		max_charges = 100,
		cast_sound_start = 1185,
		cast_sound_loop = 47693,
		conditions = {
			Condition.get("target_not_moving"),
			Condition.get("sender_not_moving"),
			Condition.get("targetWearsUnderwear"),
		},
		not_defaults = {},
		fn_send = Action.sendRPText,
		fn_receive = function(self, sender, target, args)
			Effect.run("PULSATING_MUSHROOM")
			return self:receiveRPText(sender, target, args) -- Default behavior
		end
	}));

	-- PULSATING_MANA_GEM consumable
	table.insert(out, Action:new({
		id = "PULSATING_MANA_GEM",
		name = "Pulsating Mana Gem",
		description = "Slip a pulsating mana gem into your target's underwear. Nightborne feel double the intensity.",
		texture = "inv_leycrystalmedium",
		cast_time = 2,
		charges = 0,
		rarity = 3,
		max_charges = 50,
		cast_sound_loop = 6425,
		conditions = {
			Condition.get("target_not_moving"),
			Condition.get("sender_not_moving"),
			Condition.get("targetWearsUnderwear"),
		},
		not_defaults = {},
		fn_send = Action.sendRPText,
		fn_receive = function(self, sender, target, args)
			Effect.run("PULSATING_MANA_GEM")
			return self:receiveRPText(sender, target, args) -- Default behavior
		end
	}));

	-- Headmistress' paddle
	table.insert(out, Action:new({
		id = "HEADMISTRESS_PADDLE",
		name = "Headmistress' Paddle",
		description = "Whap your target across their rear.",
		texture = "inv_bullroarer",
		cooldown = 30,
		charges=0,
		rarity=3,
		conditions = {
			Condition.get("melee_range"),
		},
		not_defaults = {},
		fn_send = function(self, sender, target, suppressErrors)
			local race = UnitRace(target)
			local gender = UnitSex(target)
			return self:sendRPText(sender, target, suppressErrors, function(se, success)
				if success and not UnitIsUnit(target, "player") then
					Func.get("critSound")(self, race, gender);
				end
			end);
		end,
		fn_receive = function(self, sender, target, args)
			DoEmote("GASP");
			Func.get("addExcitementMasochisticCrit")();
			return self:receiveRPText(sender, target, args);
		end
	}));

	-- Vine Squirm (Learned action) --
	table.insert(out, Action:new({
		id = "VINE_SQUIRM",
		name = "Vine Squirm",
		description = "Makes the target's Everliving Vine Thong squirm against their groin, provided they're wearing one.",
		texture = "inv_misc_herb_nightmarevine",
		cast_time = 2,
		charges = 0,
		rarity = 3,
		cooldown = 120,
		cast_sound_success = 47759,
		cast_sound_loop = 27,
		conditions = {
			Condition:new({id="vineThongCheck", type=Condition.Types.RTYPE_UNDIES, data={["EVERLIVING_VINE_THONG"]=true}}),
			Condition.get("caster_range"),
			Condition.get("sender_not_moving"),
		},
		not_defaults = {},
		fn_send = Action.sendRPText,
		fn_receive = function(self, sender, target, args)
			Effect.run("VINE_SQUIRM");
			return self:receiveRPText(sender, target, args) -- Default behavior
		end
	}));

	-- Vine Squirm (Learned action) --
	table.insert(out, Action:new({
		id = "VINE_THRASH",
		name = "Vine Thrash",
		description = "Makes the target's Everliving Vine Thong do evil things to the wearer, provided they're wearing one.",
		texture = "ability_hunter_onewithnature",
		cast_time = 2,
		charges = 0,
		rarity = 3,
		cooldown = 120,
		cast_sound_success = 47759,
		cast_sound_loop = 27,
		conditions = {
			Condition:new({id="vineThongCheck", type=Condition.Types.RTYPE_UNDIES, data={["EVERLIVING_VINE_THONG"]=true}}),
			Condition.get("caster_range"),
			Condition.get("sender_not_moving"),
		},
		not_defaults = {},
		fn_send = function(self, sender, target, suppressErrors)
			local race = UnitRace(target)
			local gender = UnitSex(target)
			return self:sendRPText(sender, target, suppressErrors, function(se, success)
				if success and not UnitIsUnit(target, "player") then
					Func.get("critSound")(self, race, gender)
				end
			end);
		end,
		fn_receive = function(self, sender, target, args)
			Func.get("addExcitementCrit")();
			DoEmote("gasp", "player");
			return self:receiveRPText(sender, target, args); -- Default behavior
		end
	}));

	-- Nettle rub
	table.insert(out, Action:new({
		id = "NETTLE_RUB",
		name = "Nettle Rub",
		description = "Rub a Stinging Nettle against your target's rear.",
		texture = "inv_misc_spineleaf _01",
		cooldown = 10,
		cast_time = 2,
		cast_sound_loop = 1142,
		fn_send = function(self, sender, target, suppressErrors)
			return self:sendRPText(sender, target, suppressErrors, function(se, success)
				if success and not UnitIsUnit(target, "player") then
					Func.get("critSound")(self, race, gender)
				end
			end);
		end,
		fn_receive = function(self, sender, target, args)
			Func.get("addExcitementMasochistic")();
			if not UnitIsUnit(Ambiguate(sender, "all"), "player") then
				DoEmote("GASP", sender);
			end
			return self:receiveRPText(sender, target, args);
		end,
		conditions = {
			Condition.get("sender_not_moving"),
			Condition.get("melee_range"),
		},
		filters = {
			Condition:new({
				type = Condition.Types.RTYPE_HAS_INVENTORY,
				data = {{name="Stinging Nettle"}},
				sender = true
			})
		}

	}));


	-- Spank
	table.insert(out, Action:new({
		id = "SPANK",
		name = "Spank!",
		description = "Slap your target's rear in a fashion related to your race or class.",
		texture = "ability_monk_tigerpalm",
		cooldown = 0,
		fn_send = function(self, sender, target, suppressErrors)
			local race = UnitRace(target)
			local gender = UnitSex(target)
			return self:sendRPText(sender, target, suppressErrors, function(se, success, data)
				if success and not UnitIsUnit(target, "player") then
					local sound = "";
					if data.tc == "painHeavy" then
						sound = "critSound";
					elseif data.tc == "painModerate" then
						sound = "painSound";
					end
					if sound ~= "" then
						Func.get(sound)(self, race, gender)
					end
				end
			end);
		end,
		fn_receive = function(self, sender, target, args)
			
			return self:receiveRPText(sender, target, args, function(text)
				if text.custom == "painHeavy" then 
					if not UnitIsUnit(Ambiguate(sender, "all"), "player") then
						DoEmote("GASP");
					end
					Func.get("addExcitementMasochisticCrit")();
				elseif text.custom == "painModerate" then
					Func.get("addExcitementMasochistic")();
				end

			end);
		end,
		conditions = {
			Condition.get("melee_range"),
		},
		no_defaults = {
			"party_restricted"
		},
	}));




	-- Class specific
	-- Priest Disc/Shadow - Lingering Shadow
	table.insert(out, Action:new({
		id = "LINGERING_SHADOW",
		name = "Lingering Shadow",
		description = "Shadow Mend has a 25% chance of arousing your target with a void tentacle.",
		texture = "spell_shadow_shadowmend",
		cooldown = 20,
		passive = true,
		fn_send = function(self, sender, target, suppressErrors)
			local race = UnitRace(target)
			local gender = UnitSex(target)
			return self:sendRPText(sender, target, suppressErrors, function(se, success)
				if success and not UnitIsUnit(target, "player") then
					Func.get("critSound")(self, race, gender)
				end
			end);
		end,
		fn_receive = function(self, sender, target, args)
			return self:receiveRPText(sender, target, args);
		end,
		filters = {
			Condition:new({
				type = Condition.Types.RTYPE_CLASS,
				data = {Priest=true},
				sender = true
			}),
			Condition:new({
				type = Condition.Types.RTYPE_SPEC,
				data = {s0=true,s2=true},
				sender = true
			}),
		},
		passive_on_enabled = function(self, fromButton)
			self:passiveOn("COMBAT_LOG_EVENT_UNFILTERED", function(data)
				if not data[5] then return end
				if 
					data[2] == "SPELL_CAST_SUCCESS" and
					self:getCooldown() <= 0 and
					random() < 0.25 and
					UnitIsUnit(data[5], "player") and 
					data[13] == "Shadow Mend"
				then
					local target = data[9];
					Action.useOnTarget(self.id, target, true, true);
				end
			end);
		end,
		passive_on_disabled = function(self)
		end

	}));



	-- Monk - Pleasure Touch
	table.insert(out, Action:new({
		id = "PLEASURE_TOUCH",
		name = "Pleasure Touch",
		description = "Touch a secret pleasure point on your target, maxing their arousal after 10 seconds.",
		texture = "ability_druid_empoweredtouch",
		cooldown = 120,
		fn_send = function(self, sender, target, suppressErrors)
			local race = UnitRace(target)
			local gender = UnitSex(target)
			return self:sendRPText(sender, target, suppressErrors, function(se, success)
			end);
		end,
		fn_receive = function(self, sender, target, args)
			Timer.set(function()
				ExiWoW.ME:addExcitement(10000);
			end, 10);
			return self:receiveRPText(sender, target, args);
		end,
		filters = {
			Condition:new({
				type = Condition.Types.RTYPE_CLASS,
				data = {Monk=true},
				sender = true
			}),
		},
	}));



	return out;

end



local aName, aTable = ...;
local require = ExiWoW.require

aTable.spells = function(self)

	local out = {};
	local RPText = require("RPText");
	local Spell = require("Spell");
	local spellKits = ExiWoW.LibAssets.spell_kits;
	local Timer = require("Timer");
	local Event = require("Event");
	local evtype = Event.Types;
	local Func = require("Func");


	-- Binds a custom function which is always raised
	table.insert(out, Spell:new({
		id = {"Shoulder Demon", "Request the Master Call on You"},
		custom = {
			timer_speech = 0,
			texts = {
				{"DAGLOP_NIPPLE_TWIST", "DAGLOP_NIPPLE_TWIST_TEXT", "GASP"},
				{"DAGLOP_WEDIGE", "DAGLOP_WEDIGE_TEXT", "GASP"},
				{"DAGLOP_BUTTKICK", "DAGLOP_BUTTKICK_TEXT"},
				{"DAGLOP_BOOB_GRAB", "DAGLOP_BOOB_GRAB_TEXT"},
				{"DAGLOP_MOUTH_FINGER", "DAGLOP_MOUTH_FINGER_TEXT"},
				{"DAGLOP_RITUAL_TEXT"},
			},
			text_playing = false
		},
		onTrigger = function(self, event, casterUnit, victimUnit, casterChar, victimChar)
			-- Spell added
			if event == evtype.SPELL_ADD then
				local se = self;
				Timer.clear(self.custom.timer_speech);
				self.custom.timer_speech = Timer.set(function()
					if math.random() < 0.25 then return end
					-- Play a random text
					local viable = {}
					for k,v in pairs(se.custom.texts) do
						table.insert(viable, {k=k, v=v});
					end
					if #viable < 1 then return end
					local tx = viable[ math.random( #viable ) ];
					se.custom.texts[tx.k] = nil;
					tx = tx.v;
					--id, senderUnit, receiverUnit, senderChar, receiverChar, eventData, event, action, debug
					local rptext = RPText.trigger(tx[1], "player", "player", ExiWoW.ME, ExiWoW.ME)
					if not rptext then return end
	
					if tx[3] then
						DoEmote(tx[3], "player")
					end
					if tx[2] then
						Timer.set(function()
							RPText.trigger(tx[2], "player", "player", ExiWoW.ME, ExiWoW.ME);
						end, 2);
					end
				end, 30, math.huge)
			end

			-- Spell removed
			if event == evtype.SPELL_REM then
				Timer.clear(self.custom.timer_speech);
			end
		end,
	}));

	-- Shattering Song
	table.insert(out, Spell:new({
		id = "Shattering Song",
		custom = {
			added = 0
		},
		onTrigger = function(self, event, casterUnit, victimUnit, casterChar, victimChar)
			-- Spell added
			if event == evtype.SPELL_ADD then
				local pre = self.custom.added;
				self.custom.added = self.custom.added+1;
				
				if pre < 1 then
					RPText.trigger("Shattering Song", "player", "player", ExiWoW.ME, ExiWoW.ME)
					Func.get("toggleVibHubProgram")("SHATTERING_SONG", 300);
				end
			end
			-- Spell removed
			if event == evtype.SPELL_REM then
				self.custom.added = self.custom.added-1;
				if self.custom.added <= 0 then
					Func.get("toggleVibHubProgram")("SHATTERING_SONG");
				end
			end
		end
	}))

	table.insert(out, Spell:new({id="Opportunistic Strike"}));
	table.insert(out, Spell:new({id="Enforcing Strike", tags={"KNOCKDOWN"}}));
	
	return out;

end
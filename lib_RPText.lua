local aName, aTable = ...;
local require = ExiWoW.require

aTable.rpTexts = function(self)

	local R = {};
	local RPText = require("RPText");
	local Condition = require("Condition");	-- RPText requirement constructor
	local Effect = require("Effect");
	local Database = require("Database");
	local Func = require("Func");
	local Timer = require("Timer");

	local ty = Condition.Types;			-- Local filter types


	local function getCondition(id)
		local out = Database.getID("Condition", id);
		if not out then print("Condition not found in lib_RPText:", id) end
		return out;
	end
	
	local spellAddOrTick = Database.getIDs("Condition", {is_spell_add=true, is_spell_tick=true});

-- ACTIONS
	-- Arousal reaching cap --
		table.insert(R, RPText:new({
			id = "_EX_CAP_",
			text_receiver = "You feel a growing tingle in your nether regions!",
			requirements = {},
		}));
		table.insert(R, RPText:new({
			id = "_EX_CAP_",
			text_receiver = "Sparking sensations shoot through you, concentrating in your %Tgroin!",
			requirements = {},
		}));

	-- Orgasm --
		table.insert(R, RPText:new({
			id = "_EX_RESET_",
			text_receiver = "A wave of pleasure washes over you as you reach orgasm!",
			text_bystander = "%S moans loudly!",
			requirements = {},
		}));
		table.insert(R, RPText:new({
			id = "_EX_RESET_",
			text_receiver = "Your %Tgenitals clench spasmodically as you reach orgasm!",
			text_bystander = "%S moans loudly!",
			requirements = {getCondition("victimVagina")},
		}));
		table.insert(R, RPText:new({
			id = "_EX_RESET_",
			text_receiver = "You feel a throbbing in your %Tgenitals as you cream in your %Tundies!",
			text_bystander = "%S moans loudly!",
			requirements = {getCondition("victimVagina"), getCondition("targetWearsUnderwear")
			},
		}));
		table.insert(R, RPText:new({
			id = "_EX_RESET_",
			text_receiver = "You feel your %Tgenitals throb as you reach orgasm!",
			text_bystander = "%S moans loudly!",
			requirements = {getCondition("victimPenis")},
		}));
		table.insert(R, RPText:new({
			id = "_EX_RESET_",
			text_receiver = "You feel your %Tgenitals throb as you cum in your %Tundies!",
			text_bystander = "%S moans loudly!",
			requirements = {getCondition("victimPenis"), getCondition("targetWearsUnderwear")},
		}));
		

	-- Groin tremble totem --
		-- Target
		table.insert(R, RPText:new({
			id = "GROIN_RUMBLE_TOTEM",
			text_bystander = "%S sticks %Shis groin rumble totem into %T's %Tundies!",
			text_sender = "You stick your groin rumble totem into %T's %Tundies!",
			text_receiver = "%S sticks %Shis groin rumble totem into your %Tundies!",
			requirements = {getCondition("targetWearsUnderwear")},
		}));
		table.insert(R, RPText:new({
			id = "GROIN_RUMBLE_TOTEM",
			text_bystander = "%S sticks %Shis groin rumble totem into %Shis %Tundies!",
			text_receiver = "You stick your groin rumble totem into your %Tundies!",
			requirements = {getCondition("targetWearsUnderwear")},
		}));
		table.insert(R, RPText:new({
			id = "GROIN_RUMBLE_TOTEM",
			text_bystander = "%S sticks %Shis groin rumble totem into %Shis %Tvagina!",
			text_receiver = "You stick your groin rumble totem into your %Tvagina!",
			requirements = {getCondition("targetNoUnderwear"), getCondition("victimVagina")},
		}));
		table.insert(R, RPText:new({
			id = "GROIN_RUMBLE_TOTEM",
			text_bystander = "%S sticks %Shis groin rumble totem into %T's %Tvagina!",
			text_sender = "You stick your groin rumble totem into %T's %Tvagina!",
			text_receiver = "%S sticks %Shis groin rumble totem into your %Tvagina!",
			requirements = {getCondition("targetNoUnderwear"), getCondition("victimVagina")},
		}));
		table.insert(R, RPText:new({
			id = "GROIN_RUMBLE_TOTEM",
			text_bystander = "%S sticks %Shis groin rumble totem into %Shis %Tbutt!",
			text_receiver = "You stick your groin rumble totem into your %Tbutt!",
			requirements = {getCondition("targetNoUnderwear")},
		}));
		table.insert(R, RPText:new({
			id = "GROIN_RUMBLE_TOTEM",
			text_bystander = "%S sticks %Shis groin rumble totem into %T's %Tbutt!",
			text_sender = "You stick your groin rumble totem into %T's %Tbutt!",
			text_receiver = "%S sticks %Shis groin rumble totem into your %Tbutt!",
			requirements = {getCondition("targetNoUnderwear")},
		}));
		


	-- Fondle --
	-- You can set text_sender to nil to set self_cast_only to true

		-- TARGET --

			-- Fondle breasts target
			table.insert(R, RPText:new({
				id = "FONDLE",
				text_bystander = "%S grabs a hold of and rubs %T's %Tbreasts!",
				text_sender = "You grab a hold of and rub %T's %Tbreasts!",
				text_receiver = "%S grabs a hold of and rubs your %Tbreasts!",
				sound = 57179,
				requirements = {getCondition("victimBreasts")},
				visual = "excitement",
			}));

			-- Fondle groin target
			table.insert(R, RPText:new({
				id = "FONDLE",
				text_bystander = "%S grabs a hold of and rubs %T's %Tgroin!",
				text_sender = "You grab a hold of and rub %T's %Tgroin!",
				text_receiver = "%S grabs a hold of and rubs your %Tgroin!",
				sound = 57179,
				visual = "excitement",
				requirements = {}
			}));

			-- Fondle butt target
			table.insert(R, RPText:new({
				id = "FONDLE",
				text_bystander = "%S grabs a hold of and rubs %T's %Tbutt!",
				text_sender = "You grab a hold of and rub %T's %Tbutt!",
				text_receiver = "%S grabs a hold of and rubs your %Tbutt!",
				sound = 57179,
				visual = "excitement",
				requirements = {}
			}));


			-- DK / Undead
			table.insert(R, RPText:new({
				id = "FONDLE",
				text_sender = "You grab a hold of and rub %T's %Tbutt with your cold hands!",
				text_bystander = "%S grabs a hold of %T's %Tbutt and rubs it with %Shis cold hands!",
				text_receiver = "%S grabs a hold of your %Tbutt and rubs it with %Shis cold hands!",
				sound = {57179},
				requirements = {{getCondition("sender_class_deathknight"), getCondition("sender_race_undead")}},
				visual = "frost",
			}));
			table.insert(R, RPText:new({
				id = "FONDLE",
				text_sender = "You grab a hold of and rub %T's %Tgroin with your cold hands!",
				text_bystander = "%S grabs a hold of %T's %Tgroin and rubs it with %Shis cold hands!",
				text_receiver = "%S grabs a hold of your %Tgroin and rubs it with %Shis cold hands!",
				sound = {57179},
				requirements = {{getCondition("sender_class_deathknight"), getCondition("sender_race_undead")}},
				visual = "frost",
			}));
			table.insert(R, RPText:new({
				id = "FONDLE",
				text_sender = "You grab a hold of and rub %T's %Tbreasts with your cold hands!",
				text_bystander = "%S grabs a hold of %T's %Tbreasts and rubs it with %Shis cold hands!",
				text_receiver = "%S grabs a hold of your %Tbreasts and rubs it with %Shis cold hands!",
				sound = {57179},
				requirements = {{getCondition("sender_class_deathknight"), getCondition("sender_race_undead")}, getCondition("victimBreasts")},
				visual = "frost",
			}));

			-- Fondle butt sender worgen
			table.insert(R, RPText:new({
				id = "FONDLE",
				text_bystander = "%S grabs a hold of and squeezes %T's %Tbutt!",
				text_sender = "You grab a hold of and squeezes %T, letting your claws painfully sting %This %Tbutt!",
				text_receiver = "%S grabs a hold of and squeezes your %Tbutt, painfully stinging you with %Shis claws!",
				sound = 57179,
				visual = "excitement",
				requirements = {getCondition("sender_race_worgen")}
			}));

			-- Short races
			table.insert(R, RPText:new({
				id = "FONDLE",
				text_bystander = "%S reaches up between %T's legs and fondles %This %Tgroin!",
				text_sender = "You reach up between %T's legs and fondles %This %Tgroin!",
				text_receiver = "%S reaches up between your legs and fondles your %Tgroin!",
				sound = 57179,
				visual = "excitement",
				requirements = {getCondition("senderMuchShorter")}
			}));
			table.insert(R, RPText:new({
				id = "FONDLE",
				text_bystander = "%S reaches up between %T's legs and fondles %This %Tbutt!",
				text_sender = "You reach up between %T's legs and fondles %This %Tbutt!",
				text_receiver = "%S reaches up between your legs and fondles your %Tbutt!",
				sound = 57179,
				visual = "excitement",
				requirements = {getCondition("senderMuchShorter")}
			}));
			
			

		-- SELF --
			table.insert(R, RPText:new({
				id = "FONDLE",
				text_bystander = "%T rubs %This %Tgroin!",
				text_receiver = "You rub your %Tgroin!",
				sound = 57179,
				visual = "excitement",
				requirements = {}
			}));
			table.insert(R, RPText:new({
				id = "FONDLE",
				text_bystander = "%T rubs %This %Tbreasts!",
				text_receiver = "You rub your %Tbreasts!",
				sound = 57179,
				visual = "excitement",
				requirements = { getCondition("victimBreasts") }
			}));
		--

	-- TICKLE --
			-- Tickle target
			table.insert(R, RPText:new({
				id = "TICKLE",
				text_bystander = "%S tickles %T between %This legs!",
				text_sender = "You tickle %T between %This legs!",
				text_receiver = "%S tickles you between your legs!",
				requirements = {},
			}));

			-- Shorter races
			table.insert(R, RPText:new({
				id = "TICKLE",
				text_bystander = "%S reaches up between %T's legs and tickles %This %Tgroin!",
				text_sender = "%S reaches up between %T's legs and tickles %This %Tgroin!",
				text_receiver = "%S reaches up between %T's legs and tickles %This %Tgroin!",
				requirements = {getCondition("senderMuchShorter")},
			}));


	-- NETTLE_RUB
			-- SElf
			table.insert(R, RPText:new({
				id = "NETTLE_RUB",
				text_bystander = "%T rubs %This own %Tbutt with a stinging nettle!",
				text_receiver = "You rub your own %Tbutt with a stinging nettle!",
				requirements = {},
			}));
			table.insert(R, RPText:new({
				id = "NETTLE_RUB",
				text_bystander = "%S slips %Shis hand into %T's clothes, rubbing %This %Tbutt with a stinging nettle!",
				text_sender = "You slip your hand into %T's clothes, rubbing %This %Tbutt with a stinging nettle!",
				text_receiver = "%S slips %Shis hand into your clothes, rubbing your %Tbutt with a stinging nettle!",
				requirements = {},
			}));


	-- Spank
		-- Base
		table.insert(R, RPText:new({
			id = "SPANK",
			text_bystander = "%T slaps %This %Tbutt!",
			text_receiver = "You slap your %Tbutt!",
			sound = 37472,
			requirements = {},
			visual = "pain",
			custom = "painModerate"
		}));
		table.insert(R, RPText:new({
			id = "SPANK",
			text_sender = "You slap %T's %Tbutt!",
			text_bystander = "%S slaps %T's %Tbutt!",
			text_receiver = "%S slaps your %Tbutt!",
			sound = 37472,
			requirements = {},
			visual = "pain",
			custom = "painModerate"
		}));

		table.insert(R, RPText:new({
			id = "SPANK",
			text_sender = "You lift the back of %T's tabard and slap %This %Tbutt!",
			text_bystander = "%S lifts the back of %T's tabard and slaps %This %Tbutt!",
			text_receiver = "%S lifts the back of your tabard and slaps your %Tbutt!",
			sound = 37472,
			requirements = {getCondition("targetTabard")},
			visual = "pain",
			custom = "painModerate"
		}));


		-- SHAMAN
		-- Resto
		table.insert(R, RPText:new({
			id = "SPANK",
			text_bystander = "%T slaps %This %Tbutt with a watery whip!",
			text_receiver = "You slap your %Tbutt with a watery whip!",
			sound = {37472,27002},
			requirements = {getCondition("sender_class_shaman"),getCondition("sender_spec_3")},
			visual = "quickWet",
			custom = "painModerate"
		}));
		table.insert(R, RPText:new({
			id = "SPANK",
			text_sender = "You slap %T's %Tbutt with a watery whip!",
			text_bystander = "%S slaps %T's %Tbutt with a watery whip!",
			text_receiver = "%S slap your %Tbutt with a watery whip!",
			sound = {37472,27002},
			requirements = {getCondition("sender_class_shaman"),getCondition("sender_spec_3")},
			visual = "quickWet",
			custom = "painModerate"
		}));

		-- Any
		table.insert(R, RPText:new({
			id = "SPANK",
			text_bystander = "%T charges %This palm with lightning and slaps %This own %Tbutt!",
			text_receiver = "You charge your palm with lightning and slap your own %Tbutt!",
			sound = {37472,29489},
			requirements = {getCondition("sender_class_shaman")},
			visual = "lightning",
			custom = "painHeavy"
		}));
		table.insert(R, RPText:new({
			id = "SPANK",
			text_sender = "You charge your palm with lightning and slap %T's %Tbutt!",
			text_bystander = "%S charges %Shis palm with lightning and slaps %T's %Tbutt!",
			text_receiver = "%S charges %Shis palm with lightning and slaps your %Tbutt!",
			sound = {37472,29489},
			requirements = {getCondition("sender_class_shaman")},
			visual = "lightning",
			custom = "painHeavy"
		}));

		-- Enh
		table.insert(R, RPText:new({
			id = "SPANK",
			text_bystander = "%T charges %This palm with windfury and slaps %This own %Tbutt rapidly!",
			text_receiver = "You charge your palm with windfury and slap your own %Tbutt rapidly!",
			sound = {37472,63845},
			requirements = {getCondition("sender_class_shaman"),getCondition("sender_spec_2")},
			visual = "heavyPain",
			custom = "painHeavy"
		}));
		table.insert(R, RPText:new({
			id = "SPANK",
			text_sender = "You charge your palm with windfury and slap %T's %Tbutt rapidly!",
			text_bystander = "%S charges %Shis palm with windfury and slaps %T's %Tbutt rapidly!",
			text_receiver = "%S charges %Shis palm with windfury and slaps your %Tbutt rapidly!",
			sound = {37472,63845},
			requirements = {getCondition("sender_class_shaman"),getCondition("sender_spec_2")},
			visual = "heavyPain",
			custom = "painHeavy"
		}));


		-- WARRIOR
		-- Any
		table.insert(R, RPText:new({
			id = "SPANK",
			text_bystander = "%T throws a rage induced slap at %This own %Tbutt!",
			text_receiver = "You throw a rage induced slap at your own %Tbutt!",
			sound = {83716},
			requirements = {getCondition("sender_class_warrior")},
			visual = "heavyPain",
			custom = "painHeavy"
		}));
		table.insert(R, RPText:new({
			id = "SPANK",
			text_sender = "You throw a heavy, rage induced slap at %T's %Tbutt, jiggling %This buttcheeks around!",
			text_bystander = "%S throws a heavy, rage induced slap at %T's %Tbutt, jiggling %This buttcheeks around!",
			text_receiver = "%S throws a heavy, rage induced slap at your %Tbutt, jiggling your buttcheeks around!",
			sound = {83716},
			requirements = {getCondition("sender_class_warrior")},
			visual = "heavyPain",
			custom = "painHeavy"
		}));

		-- DRUID
		table.insert(R, RPText:new({
			id = "SPANK",
			text_bystander = "%T lashes %This own %Tbutt with a vine whip!",
			text_receiver = "You lash your own %Tbutt with a vine whip!",
			sound = {37472,96003},
			requirements = {getCondition("sender_class_druid")},
			visual = "pain",
			custom = "painModerate"
		}));
		table.insert(R, RPText:new({
			id = "SPANK",
			text_sender = "You lash %T's %Tbutt with a vine whip!",
			text_bystander = "%S lashes %T's %Tbutt with a vine whip!",
			text_receiver = "%S lashes your %Tbutt with a vine whip!",
			sound = {37472,96003},
			requirements = {getCondition("sender_class_druid")},
			visual = "pain",
			custom = "painModerate"
		}));

		-- MAGE
		-- Arcane
		table.insert(R, RPText:new({
			id = "SPANK",
			text_bystander = "%T aims a small shock of arcane energy at %This own %Tbutt!",
			text_receiver = "You aim a small shock of arcane energy at your own %Tbutt!",
			sound = {37472,85814},
			requirements = {getCondition("sender_class_mage"),getCondition("sender_spec_1")},
			visual = "pain",
			custom = "painModerate"
		}));
		table.insert(R, RPText:new({
			id = "SPANK",
			text_sender = "You send a small shock of arcane energy across %T's %Tbutt!",
			text_bystander = "%S sends a small shock of arcane energy across %T's %Tbutt!",
			text_receiver = "%S sends a small shock of arcane energy across your %Tbutt!",
			sound = {37472,85814},
			requirements = {getCondition("sender_class_mage"),getCondition("sender_spec_1")},
			visual = "pain",
			custom = "painModerate"
		}));
		-- Fire
		table.insert(R, RPText:new({
			id = "SPANK",
			text_bystander = "%T engulfs %This hand with flame and slaps %This own %Tbutt!",
			text_receiver = "You engulf your hand with flame and slap your own %Tbutt!",
			sound = {37472,116129},
			requirements = {getCondition("sender_class_mage"),getCondition("sender_spec_2")},
			visual = "heavyPain",
			custom = "painHeavy"
		}));
		table.insert(R, RPText:new({
			id = "SPANK",
			text_sender = "You engulf your hand with flame and slap %T's %Tbutt!",
			text_bystander = "%S engulfs %Shis hand with flame and slaps %T's %Tbutt!",
			text_receiver = "%S engulfs %Shis hand with flame and slaps your %Tbutt!",
			sound = {37472,116129},
			requirements = {getCondition("sender_class_mage"),getCondition("sender_spec_2")},
			visual = "heavyPain",
			custom = "painHeavy"
		}));
		-- Frost
		table.insert(R, RPText:new({
			id = "SPANK",
			text_bystander = "%T surrounds %Shis hand in frost and slaps %This own butt!",
			text_receiver = "You surround your hand in frost and slap your own butt!",
			sound = {37472,85503},
			requirements = {getCondition("sender_class_mage"),getCondition("sender_spec_3")},
			visual = "frost",
			custom = "painModerate"
		}));
		table.insert(R, RPText:new({
			id = "SPANK",
			text_sender = "You surround your hand with frost and slap %T's %Tbutt!",
			text_bystander = "%S surrounds %Shis hand with frost and slaps %T's %Tbutt!",
			text_receiver = "%S surrounds %Shis hand with frost and slaps your %Tbutt!",
			sound = {37472,85503},
			requirements = {getCondition("sender_class_mage"),getCondition("sender_spec_3")},
			visual = "frost",
			custom = "painHeavy"
		}));

		-- PRIEST
		-- Disc/Holy
		table.insert(R, RPText:new({
			id = "SPANK",
			text_bystander = "%T playfully slaps %This own %Tbutt, sending little sparkles flying from the impact!",
			text_receiver = "You playfully slap your own %Tbutt, sending little sparkles flying from the impact!",
			sound = {37472,1430},
			requirements = {getCondition("sender_class_priest"),{getCondition("sender_spec_1"),getCondition("sender_spec_2")}},
			--visual = "pain",
			custom = "painModerate"
		}));
		table.insert(R, RPText:new({
			id = "SPANK",
			text_sender = "You playfully slap %T's %Tbutt, sending little sparkles flying from the impact!",
			text_bystander = "%S playfully slaps %T's %Tbutt, sending little sparkles flying from the impact!",
			text_receiver = "%S playfully slaps your %Tbutt, sending little sparkles flying from the impact!",
			sound = {37472,1430},
			requirements = {getCondition("sender_class_priest"),{getCondition("sender_spec_1"),getCondition("sender_spec_2")}},
			--visual = "pain",
			custom = "painModerate"
		}));
		-- Shadow
		table.insert(R, RPText:new({
			id = "SPANK",
			text_bystander = "%T lashes %This own %Tbutt with a void tendril!",
			text_receiver = "You lash your own %Tbutt with a void tendril!",
			sound = {37472,96003},
			requirements = {getCondition("sender_class_priest"),getCondition("sender_spec_3")},
			visual = "pain",
			custom = "painModerate"
		}));
		table.insert(R, RPText:new({
			id = "SPANK",
			text_sender = "You lash %T's %Tbutt with a void tendril!",
			text_bystander = "%S lashes %T's %Tbutt with a void tendril!",
			text_receiver = "%S lashes your %Tbutt with a void tendril!",
			sound = {37472,96003},
			requirements = {getCondition("sender_class_priest"),getCondition("sender_spec_3")},
			visual = "heavyPain",
			custom = "painHeavy"
		}));

		-- WARLOCK
		table.insert(R, RPText:new({
			id = "SPANK",
			text_bystander = "%T painfully singes %This own %Tbutt with a small burst of felfire!",
			text_receiver = "You painfully singe your own %Tbutt with a small burst of felfire!",
			sound = {37472,51605},
			requirements = {getCondition("sender_class_warlock")},
			visual = "heavyPain",
			custom = "painHeavy"
		}));
		table.insert(R, RPText:new({
			id = "SPANK",
			text_sender = "You painfully singe %T's %Tbutt with a small burst of felfire!",
			text_bystander = "%S painfully singes %T's %Tbutt with a small burst of felfire!",
			text_receiver = "%S painfully singes your %Tbutt with a small burst of felfire!",
			sound = {37472,51605},
			requirements = {getCondition("sender_class_warlock")},
			visual = "heavyPain",
			custom = "painHeavy"
		}));

		-- ROGUE
		table.insert(R, RPText:new({
			id = "SPANK",
			text_sender = "You surprise %T with a rapid slap to %This %Tbutt!",
			text_bystander = "%S surprises %T with a rapid slap to %This %Tbutt!",
			text_receiver = "%S surprises you with a rapid slap to your %Tbutt!",
			sound = {37472},
			requirements = {getCondition("sender_class_rogue")},
			visual = "pain",
			custom = "painModerate"
		}));

		-- DH
		table.insert(R, RPText:new({
			id = "SPANK",
			text_bystander = "%T slaps %This own %Tbutt, leaving a stinging fiery brand behind!",
			text_receiver = "You slap your own %Tbutt, leaving a stinging fiery brand behind!",
			sound = {37472,59082},
			requirements = {getCondition("sender_class_demonhunter")},
			visual = "heavyPain",
			custom = "painHeavy"
		}));
		table.insert(R, RPText:new({
			id = "SPANK",
			text_sender = "You slap %T's %Tbutt, leaving a stinging fiery brand behind!",
			text_bystander = "%S slaps %T's %Tbutt, leaving a stinging fiery brand behind!",
			text_receiver = "%S slaps your %Tbutt, leaving a stinging fiery brand behind!",
			sound = {37472,59082},
			requirements = {getCondition("sender_class_demonhunter")},
			visual = "heavyPain",
			custom = "painHeavy"
		}));

		-- DK
		-- Blood
		table.insert(R, RPText:new({
			id = "SPANK",
			text_bystander = "%T summons a bone and whacks it across %This own %Tbutt!",
			text_receiver = "You summon a bone and whack it across your own %Tbutt!",
			sound = {37472,24037},
			requirements = {getCondition("sender_class_deathknight"),getCondition("sender_spec_1")},
			visual = "heavyPain",
			custom = "painHeavy"
		}));
		table.insert(R, RPText:new({
			id = "SPANK",
			text_sender = "You summon a bone and whack it across %T's %Tbutt!",
			text_bystander = "%S summons a bone and whacks it across %T's %Tbutt!",
			text_receiver = "%S summons a bone and whacks it across your %Tbutt!",
			sound = {37472,24037},
			requirements = {getCondition("sender_class_deathknight"),getCondition("sender_spec_1")},
			visual = "heavyPain",
			custom = "painHeavy"
		}));

		-- Frost
		table.insert(R, RPText:new({
			id = "SPANK",
			text_bystander = "%T gently swats %This own %Tbutt, causing a thin layer of frost to spread across it!",
			text_receiver = "You gently swat your own %Tbutt, causing a thin layer of frost to spread across it!",
			sound = {37472,12877},
			requirements = {getCondition("sender_class_deathknight"),getCondition("sender_spec_2")},
			visual = "frost",
			custom = "painHeavy"
		}));
		table.insert(R, RPText:new({
			id = "SPANK",
			text_sender = "You gently swat %T's %Tbutt, causing a thin layer of frost to spread across it!",
			text_bystander = "%S gently swats %T's %Tbutt, causing a thin layer of frost to spread across it!",
			text_receiver = "%S gently swats your %Tbutt, causing a thin layer of frost to spread across it!",
			sound = {37472,12877},
			requirements = {getCondition("sender_class_deathknight"),getCondition("sender_spec_2")},
			visual = "frost",
			custom = "painHeavy"
		}));

		-- Unholy
		table.insert(R, RPText:new({
			id = "SPANK",
			text_bystander = "%T commands %This undead minion to slap %This %Tbutt!",
			text_receiver = "You command your undead minion to slap your %Tbutt!",
			sound = {37472},
			requirements = {getCondition("sender_class_deathknight"),getCondition("sender_spec_3"),getCondition("sender_has_pet")},
			visual = "pain",
			custom = "painModerate"
		}));
		table.insert(R, RPText:new({
			id = "SPANK",
			text_sender = "You command your undead minion to slap %T's %Tbutt!",
			text_bystander = "%S commands %Shis undead minion to slap %T's %Tbutt!",
			text_receiver = "%S commands %Shis undead minion to slap your %Tbutt!",
			sound = {37472},
			requirements = {getCondition("sender_class_deathknight"),getCondition("sender_spec_3"),getCondition("sender_has_pet")},
			visual = "pain",
			custom = "painModerate"
		}));


		-- PALADIN
		-- Holy
		table.insert(R, RPText:new({
			id = "SPANK",
			text_bystander = "%T playfully slaps %This own %Tbutt, sending little sparkles flying from the impact!",
			text_receiver = "You playfully slap your own %Tbutt, sending little sparkles flying from the impact!",
			sound = {37472,1430},
			requirements = {getCondition("sender_class_paladin"),getCondition("sender_spec_1")},
			--visual = "pain",
			custom = "painModerate"
		}));
		table.insert(R, RPText:new({
			id = "SPANK",
			text_sender = "You playfully slap %T's %Tbutt, sending little sparkles flying from the impact!",
			text_bystander = "%S playfully slaps %T's %Tbutt, sending little sparkles flying from the impact!",
			text_receiver = "%S playfully slaps your %Tbutt, sending little sparkles flying from the impact!",
			sound = {37472,1430},
			requirements = {getCondition("sender_class_paladin"),getCondition("sender_spec_1")},
			--visual = "pain",
			custom = "painModerate"
		}));

		-- MONK
		-- Todo

		-- HUNTER
		-- Todo



		--[[
		table.insert(R, RPText:new({
			id = "SPANK",
			text_bystander = "%T slaps %This %Tbutt!",
			text_receiver = "You slap your %Tbutt hard test!",
			sound = 37472,
			requirements = {},
			visual = "pain",
			custom = "painHeavy"
		}));
		]]


	-- VINE_SQUIRM --
		table.insert(R, RPText:new({
			id = "VINE_SQUIRM",
			sound = 2579,
			text_bystander = "%S casts a spell aimed at %T's %Tcrotch!",
			text_sender = "You cast a squirm spell at %T's %Tundies!",
			visual = "excitement",
			text_receiver = "%S casts a spell at you, making your %Tundies start to squirm!",
		}))
		table.insert(R, RPText:new({
			id = "VINE_SQUIRM",
			sound = 2579,
			visual = "excitement",
			text_receiver = "You cast a spell on your %Tundies, making them start squirming!",
		}))

	-- VINE_THRASH --
		table.insert(R, RPText:new({
			id = "VINE_THRASH",
			sound = 21727,
			visual = "heavyExcitement",
			text_receiver = "You cast a spell on your %Tundies, causing a vine to prod into and tickle the inside of your %Tbutt!",
		}));
		table.insert(R, RPText:new({
			id = "VINE_THRASH",
			sound = 21727,
			visual = "heavyExcitement",
			text_bystander = "%S casts a spell aimed at %T's %Tcrotch!",
			text_sender = "You cast a squirm spell at %T's %Tundies, causing a vine to prod into and tickle the inside of %This %Tbutt!",
			text_receiver = "%S casts a spell at your %Tundies, causing a vine to prod into and tickle the inside of your %Tbutt!",
		}));

		table.insert(R, RPText:new({
			id = "VINE_THRASH",
			sound = 21727,
			visual = "heavyExcitement",
			text_receiver = "You cast a spell on your %Tundies, causing a few vines to slip inside your %Tvagina, tickling your inside!",
			requirements = {getCondition("victimVagina")},
		}));
		table.insert(R, RPText:new({
			id = "VINE_THRASH",
			sound = 21727,
			visual = "heavyExcitement",
			text_bystander = "%S casts a spell aimed at %T's %Tcrotch!",
			text_sender = "You cast a squirm spell at %T's %Tundies, causing a few vines to slip inside %This %Tvagina, tickling %This inside!",
			text_receiver = "%S casts a spell at your %Tundies, causing a few vines to slip inside your %Tvagina, tickling your inside!",
			requirements = {getCondition("victimVagina")},
		}));

		table.insert(R, RPText:new({
			id = "VINE_THRASH",
			sound = 21727,
			visual = "heavyExcitement",
			text_receiver = "You cast a spell on your %Tundies, causing a thick vine to start thrusting rapidly inside your %Tvagina!",
			requirements = {getCondition("victimVagina")},
		}));
		table.insert(R, RPText:new({
			id = "VINE_THRASH",
			sound = 21727,
			visual = "heavyExcitement",
			text_bystander = "%S casts a spell aimed at %T's %Tcrotch!",
			text_sender = "You cast a squirm spell at %T's %Tundies, causing a thick vine to start thrusting rapidly inside %This %Tvagina!",
			text_receiver = "%S casts a spell at your %Tundies, causing a thick vine to start thrusting rapidly inside your %Tvagina!",
			requirements = {getCondition("victimVagina")},
		}));

		table.insert(R, RPText:new({
			id = "VINE_THRASH",
			sound = 21727,
			visual = "heavyExcitement",
			text_receiver = "You cast a spell on your %Tundies, causing multiple vines to restrain your genitals, squeezing painfully!",
			requirements = {getCondition("victimPenis")},
		}));
		table.insert(R, RPText:new({
			id = "VINE_THRASH",
			sound = 21727,
			visual = "heavyExcitement",
			text_bystander = "%S casts a spell aimed at %T's %Tcrotch!",
			text_sender = "You cast a squirm spell at %T's %Tundies, causing multiple vines to restrain %This genitals, squeezing painfully!",
			text_receiver = "%S casts a spell at your %Tundies, causing multiple vines to restrain your genitals, squeezing painfully!",
			requirements = {getCondition("victimPenis")},
		}));

		table.insert(R, RPText:new({
			id = "VINE_THRASH",
			sound = 21727,
			visual = "heavyExcitement",
			text_receiver = "You cast a spell on your %Tundies, causing multiple vines to envelop and rapidly tug at your %Tpenis!",
			requirements = {getCondition("victimPenis")},
		}));
		table.insert(R, RPText:new({
			id = "VINE_THRASH",
			sound = 21727,
			visual = "heavyExcitement",
			text_bystander = "%S casts a spell aimed at %T's %Tcrotch!",
			text_sender = "You cast a squirm spell at %T's %Tundies, causing multiple vines to envelop and rapidly tug at %This %Tpenis!",
			text_receiver = "%S casts a spell at your %Tundies, causing multiple vines to envelop and rapidly tug at your %Tpenis!",
			requirements = {getCondition("victimPenis")},
		}));
		

	-- Throw sand --
		table.insert(R, RPText:new({
			id = "THROW_SAND",
			text_bystander = "%S throws a handful of sand at %T, the majority of which falls into %This cleavage!", 
			text_sender = "You throw a handful of sand at %T, the majority of which falls into %This cleavage!", 
			text_receiver = "%S throws a handful of sand at you, the majority of which falls into your cleavage!",
			sound = 907,
			requirements = {getCondition("victimBreasts")},
			
		}))

		table.insert(R, RPText:new({
			id = "THROW_SAND",
			text_bystander = "%S throws a handful of sand at %T, the majority of which gets into %This %Tundies!", 
			text_sender = "You throw a handful of sand at %T, the majority of which gets into %This %Tundies!", 
			text_receiver = "%S throws a handful of sand at you, the majority of which gets into your %Tundies!",
			sound = 907,
			requirements = {getCondition("targetWearsUnderwear")},
			
		}))

		-- Self
		table.insert(R, RPText:new({
			id = "THROW_SAND",
			text_bystander = "%T lets a trickle of sand fall down %This cleavage!",
			text_receiver = "You let a trickle of sand fall down your cleavage!",
			sound = 73172,
			requirements = {getCondition("victimBreasts")},
			
		}))

		table.insert(R, RPText:new({
			id = "THROW_SAND",
			text_bystander = "%T stretches out %This waistline and pours some sand into %This %Tundies!",
			text_receiver = "You stretch out your waistline and pour some sand into your %Tundies!",
			sound = 73172,
			requirements = {getCondition("targetWearsUnderwear")},
			
		}))

	-- Swamp muck --
		table.insert(R, RPText:new({
			id = "SWAMP_MUCK",
			text_bystander = "%S throws a handful of swamp muck at %T, seeping down %This cleavage!", 
			text_sender = "You throw a handful of swamp muck at %T, seeping down %This cleavage!", 
			text_receiver = "%S throws a handful of swamp muck at you, seeping down your cleavage!",
			requirements = {getCondition("victimBreasts")},
			sound = 20674,
			visual = "greenSplatPersistent",
		}));
		table.insert(R, RPText:new({
			id = "SWAMP_MUCK",
			text_bystander = "%S throws a handful of swamp muck at %T, splattering across %This %Tbreasts!", 
			text_sender = "You throw a handful of swamp muck at %T, splattering across %This %Tbreasts!", 
			text_receiver = "%S throws a handful of swamp muck at you, splattering across your %Tbreasts!",
			requirements = {getCondition("victimBreasts")},
			sound = 20674,
			visual = "greenSplatPersistent",
		}));
		table.insert(R, RPText:new({
			id = "SWAMP_MUCK",
			text_bystander = "%S throws a handful of swamp muck at %T, hitting %Thim in %This %Tgroin!", 
			text_sender = "You throw a handful of swamp muck at %T, hitting %Thim in %This %Tgroin!", 
			text_receiver = "%S throws a handful of swamp muck at %T, hitting %Thim in %This %Tgroin!",
			sound = 20674,
			visual = "greenSplatPersistent",
		}));



	-- Claw pinch --
		table.insert(R, RPText:new({
			id = "CLAW_PINCH",
			text_bystander = "%S pinches %T's %Tbutt with %Shis big claw!",
			text_sender = "You pinch %T's %Tbutt with your big claw!",
			text_receiver = "%S pinches your %Tbutt with %Shis big claw!",
			sound = 36721,
			requirements = {},
			visual = "pain",
			
		}))
		table.insert(R, RPText:new({
			id = "CLAW_PINCH",
			text_bystander = "%S pinches %T's %Tgroin with a big claw!",
			text_sender = "You pinch %T's %Tgroin with your big claw!",
			text_receiver = "%S pinches your %Tgroin with %Shis big claw!",
			sound = 36721,
			requirements = {},
			visual = "pain",
			
		}))
		table.insert(R, RPText:new({
			id = "CLAW_PINCH",
			text_bystander = "%S pinches %T's nipple with a big claw!",
			text_sender = "You pinch %T's nipple with your big claw!",
			text_receiver = "%S pinches your nipple with %Shis big claw!",
			sound = 36721,
			requirements = {getCondition("victimBreasts")},
			visual = "pain",
			
		}))

		table.insert(R, RPText:new({
			id = "CLAW_PINCH",
			text_bystander = "%T pinches %This %Tbutt with a big claw!",
			text_receiver = "You pinch your %Tbutt with your big claw!",
			sound = 36721,
			requirements = {},
			visual = "pain",
			
		}))
		table.insert(R, RPText:new({
			id = "CLAW_PINCH",
			text_bystander = "%T pinches %This %leftright nipple with a big claw!",
			text_receiver = "You pinch your %leftright nipple with your big claw!",
			sound = 36721,
			requirements = {getCondition("victimBreasts")},
			visual = "pain",			
		}))


	-- Goblin buzzrocket
		table.insert(R, RPText:new({
			id = "GOBLIN_BUZZROCKET",
			text_bystander =  "%T pushes a vibrational rocket into %This %Tvagina and hits the ingition!",
			text_receiver = "You push the vibrational rocket into your %Tvagina and hit the ingition!",
			requirements = {getCondition("victimVagina")}
		}))
		table.insert(R, RPText:new({
			id = "GOBLIN_BUZZROCKET",
			text_bystander = "%T sticks a vibrational rocket between %This %Tbreasts and hits the ingition!",
			text_receiver = "You stick the vibrational rocket between your %Tbreasts and hit the ingition!",
			requirements = {getCondition("victimBreasts")}
		}))
		table.insert(R, RPText:new({
			id = "GOBLIN_BUZZROCKET",
			text_bystander = "%T pushes a vibrational rocket against %This %Tgroin and hits the ingition!",
			text_receiver = "You push the vibrational rocket against your %Tgroin and hit the ingition!",
		}))
		table.insert(R, RPText:new({
			id = "GOBLIN_BUZZROCKET",
			text_bystander = "%T pushes a vibrational rocket into %This %Tbutt and hits the ingition!",
			text_receiver = "You push the vibrational rocket into your %Tbutt and hit the ingition!",
		}))
		

	-- Jade Rod
		table.insert(R, RPText:new({
			id = "JADE_ROD",
			text_bystander = "%T pushes an elongated slab of jade into %This %Tvagina where it starts pulsating!",
			text_receiver = "You push the elongated slab of jade into your %Tvagina where it starts pleasantly pulsating!",
			requirements = {getCondition("victimVagina")}
		}))
		table.insert(R, RPText:new({
			id = "JADE_ROD",
			text_bystander = "%T sticks an elongated slab of jade between %This %Tbreasts where it starts pulsating!",
			text_receiver = "You stick the elongated slab of jade between your %Tbreasts where it starts pleasantly pulsating!",
			requirements = {getCondition("victimBreasts")}
		}))
		table.insert(R, RPText:new({
			id = "JADE_ROD",
			text_bystander = "%T pushes an elongated slab of jade against %This %Tgroin where it starts pulsating!",
			text_receiver = "You push the elongated slab of jade against your %Tgroin where it starts pleasantly pulsating!",
		}))
		table.insert(R, RPText:new({
			id = "JADE_ROD",
			text_bystander = "%T pushes an elongated slab of jade into %This %Tbutt where it starts pulsating!",
			text_receiver = "You push the elongated slab of jade into your %Tbutt where it starts pleasantly pulsating!",
		}))

	-- Shara's fel rod
		table.insert(R, RPText:new({
			id = "SHARAS_FEL_ROD",
			text_bystander = "%T pushes a corrupted rod of fel iron inside %This %Tvagina!",
			text_receiver = "You push the corrupted rod of fel iron into your %Tvagina!",
			requirements = {getCondition("victimVagina")}
		}))
		table.insert(R, RPText:new({
			id = "SHARAS_FEL_ROD",
			text_bystander = "%T sticks a corrupted rod of fel iron between %This %Tbreasts!",
			text_receiver = "You stick the corrupted rod of fel iron between your %Tbreasts!",
			requirements = {getCondition("victimBreasts")}
		}))
		table.insert(R, RPText:new({
			id = "SHARAS_FEL_ROD",
			text_bystander = "%T pushes a corrupted rod of fel iron against %This %Tgroin!",
			text_receiver = "You push the corrupted rod of fel iron against your %Tgroin!",
		}))
		table.insert(R, RPText:new({
			id = "SHARAS_FEL_ROD",
			text_bystander = "%T pushes a corrupted rod of fel iron into %This %Tbutt!",
			text_receiver = "You push the corrupted rod of fel iron into your %Tbutt!",
		}))
		
	-- PULSATING_MUSHROOM
		table.insert(R, RPText:new({
			id = "PULSATING_MUSHROOM",
			sound = 43036,
			text_bystander = "%S sticks a pulsating mushroom into %T's %Tundies!",
			text_sender = "You stick your pulsating mushroom into %T's %Tundies!",
			text_receiver = "%S sticks a pulsating mushroom into your %Tundies!",
		}))
		table.insert(R, RPText:new({
			id = "PULSATING_MUSHROOM",
			sound = 43036,
			text_bystander = "%T sticks a pulsating mushroom into %This %Tundies!",
			text_receiver = "You stick a pulsating mushroom into your %Tundies!",
		}))
		table.insert(R, RPText:new({
			id = "FX_PULSATING_MUSHROOM_REM",
			text_bystander = "%T removes the pulsating mushroom from %This %Tundies!",
			text_receiver = "You remove the pulsating mushroom from your %Tundies!",
			sound = 73580
		}))

	-- Pulsating mana gem
		table.insert(R, RPText:new({
			id = "PULSATING_MANA_GEM",
			sound = 1204,
			text_bystander = "%S sticks a pulsating mana gem into %T's %Tundies!",
			text_sender = "You stick your pulsating mana gem into %T's %Tundies!",
			text_receiver = "%S sticks a pulsating mana gem into your %Tundies!",
		}))
		table.insert(R, RPText:new({
			id = "PULSATING_MANA_GEM",
			sound = 1204,
			text_bystander = "%T sticks a pulsating mana gem into %This %Tundies!",
			text_receiver = "You stick a pulsating mana gem into your %Tundies!",
		}))
		
	-- HEADMISTRESS_PADDLE
		table.insert(R, RPText:new({
			id = "HEADMISTRESS_PADDLE",
			sound = 3338,
			visual = "heavyPain",
			text_bystander = "%S slaps %T hard across %This %Tbutt with the headmistress' paddle!",
			text_sender = "You slap %T hard across %This %Tbutt with your headmistress' paddle!",
			text_receiver = "%S slaps you hard across your %Tbutt with %Shis headmistress' paddle!",
		}));
		table.insert(R, RPText:new({
			id = "HEADMISTRESS_PADDLE",
			sound = 3338,
			visual = "heavyPain",
			text_bystander = "%T slaps %Thimself across %This %Tbutt with the headmistress' paddle!",
			text_receiver = "You slap your own %Tbutt with the headmistress' paddle!",
		}));
		

	-- LINGERING_SHADOW
		table.insert(R, RPText:new({
			id = "LINGERING_SHADOW",
			sound = 115656,
			visual = "excitement",
			text_sender = "Your Shadow Mend causes a void tendril to sprout in %T's %Tundies, wriggling across %This %Tgroin!",
			text_receiver = "%S's Shadow Mend causes a void tendril to sprout in your %Tundies, wriggling across your %Tgroin!",
			requirements = {getCondition("targetWearsUnderwear")},
			fn = Func.get("addExcitement")
		}));
		table.insert(R, RPText:new({
			id = "LINGERING_SHADOW",
			sound = 115656,
			visual = "excitement",
			text_receiver = "Your Shadow Mend causes a void tendril to sprout in your %Tundies, wriggling across your %Tgroin!",
			requirements = {getCondition("targetWearsUnderwear")},
			fn = Func.get("addExcitement"),
		}));

		table.insert(R, RPText:new({
			id = "LINGERING_SHADOW",
			sound = 115656,
			visual = "heavyExcitement",
			text_receiver = "Your Shadow Mend causes a void tendril to sprout in your %Tundies, prodding into and wriggling about in your %Tvagina!",
			fn = Func.get("addExcitementCrit"),
			requirements = {getCondition("targetWearsUnderwear"),getCondition("victimVagina")}
		}));
		table.insert(R, RPText:new({
			id = "LINGERING_SHADOW",
			sound = 115656,
			visual = "heavyExcitement",
			text_sender = "Your Shadow Mend causes a void tendril to sprout in %T's %Tundies, prodding into and wriggling about in %This %Tvagina!",
			text_receiver = "%S's Shadow Mend causes a void tendril to sprout in your %Tundies, prodding into and wriggling about in your %Tvagina!",
			requirements = {getCondition("targetWearsUnderwear"),getCondition("victimVagina")},
			fn = Func.get("addExcitementCrit")
		}));

		table.insert(R, RPText:new({
			id = "LINGERING_SHADOW",
			sound = 115656,
			visual = "excitement",
			text_receiver = "Your Shadow Mend causes a void tendril to wrap around your neck, pushing inside your mouth and wriggling about rapidly!",
			requirements = {},
			fn = Func.get("addExcitement")
		}));
		table.insert(R, RPText:new({
			id = "LINGERING_SHADOW",
			sound = 115656,
			visual = "excitement",
			text_sender = "Your Shadow Mend causes a void tendril to wrap around %T's neck, pushing inside %This mouth and wriggling about rapidly!",
			text_receiver = "%S's Shadow Mend causes a void tendril to wrap around your neck, pushing inside your mouth and wriggling about rapidly!",
			requirements = {},
			fn = Func.get("addExcitement")
		}));

		table.insert(R, RPText:new({
			id = "LINGERING_SHADOW",
			sound = 115656,
			visual = "heavyExcitement",
			text_receiver = "Your Shadow Mend causes a void tendril to sprout in your %Tundies, prodding into and wriggling about in your %Tbutt!",
			fn = Func.get("addExcitementCrit"),
			requirements = {getCondition("targetWearsUnderwear")}
		}));
		table.insert(R, RPText:new({
			id = "LINGERING_SHADOW",
			sound = 115656,
			visual = "heavyExcitement",
			text_sender = "Your Shadow Mend causes a void tendril to sprout in %T's %Tundies, prodding into and wriggling about in %This %Tbutt!",
			text_receiver = "%S's Shadow Mend causes a void tendril to sprout in your %Tundies, prodding into and wriggling about in your %Tbutt!",
			requirements = {getCondition("targetWearsUnderwear")},
			fn = Func.get("addExcitementCrit")
		}));

		table.insert(R, RPText:new({
			id = "LINGERING_SHADOW",
			sound = 115656,
			visual = "heavyExcitement",
			text_receiver = "Your Shadow Mend causes a void tendril to sprout in your %Tundies, wrapping around and squeezing your %Tpenis!",
			fn = Func.get("addExcitementCrit"),
			requirements = {getCondition("targetWearsUnderwear"),getCondition("victimPenis")}
		}));
		table.insert(R, RPText:new({
			id = "LINGERING_SHADOW",
			sound = 115656,
			visual = "heavyExcitement",
			text_sender = "Your Shadow Mend causes a void tendril to sprout in %T's %Tundies, wrapping around and squeezing %This %Tpenis!",
			text_receiver = "%S's Shadow Mend causes a void tendril to sprout in your %Tundies, wrapping around and squeezing your %Tpenis!",
			requirements = {getCondition("targetWearsUnderwear"),getCondition("victimPenis")},
			fn = Func.get("addExcitementCrit")
		}));

		table.insert(R, RPText:new({
			id = "LINGERING_SHADOW",
			sound = 115656,
			visual = "excitement",
			text_receiver = "Your Shadow Mend causes a void tendril to wrap around your %leftright %Tbreast, tugging at your nipple!",
			requirements = {getCondition("victimBreasts")},
			fn = Func.get("addExcitement")
		}));
		table.insert(R, RPText:new({
			id = "LINGERING_SHADOW",
			sound = 115656,
			visual = "excitement",
			text_sender = "Your Shadow Mend causes a void tendril to wrap around %T's %leftright %Tbreast, tugging at %This nipple!",
			text_receiver = "%S's Shadow Mend causes a void tendril to wrap around your %leftright %Tbreast, tugging at your nipple!",
			requirements = {},
			fn = Func.get("addExcitement")
		}));

	-- PLEASURE_TOUCH
		table.insert(R, RPText:new({
			id = "PLEASURE_TOUCH",
			sound = 26863,
			visual = "excitement",
			text_bystander = "%S rapidly taps %T's %Tgroin in various places, making %Thim a little flustered.",
			text_sender = "You rapidly tap various secret points around %T's %Tgroin...",
			text_receiver = "%S rapidly taps your %Tgroin in various places. You feel something building up...",
			requirements = {},
		}));
		table.insert(R, RPText:new({
			id = "PLEASURE_TOUCH",
			sound = 26863,
			visual = "excitement",
			text_bystander = "%S rapidly taps %This %Tgroin in various places...",
			text_receiver = "Your rapidly tap your %Tgroin in various places. You feel something building up...",
			requirements = {},
		}));
	



-- MELEE SWINGS --
	-- HUMANOIDISH (crits) --

		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S's attack smacks against %T's %leftright %Tbreast!",
			text_receiver = "%S's attack smacks against your %leftright %Tbreast!",
			sound = 37472,
			requirements = {getCondition("attackerHumanoidish"), getCondition("victimBreasts")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "heavyPain",
			fn = Func.get("addExcitementMasochisticCrit")
		}));


		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S's attack smacks across %T's %Tgroin!",
			text_receiver = "%S's attack smacks painfully across your %Tgroin!",
			sound = 37472,
			requirements = {getCondition("attackerHumanoidish")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "heavyPain",
			fn = Func.get("addExcitementMasochisticCrit")
		}))

		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S's attack smacks across %T's %Tbreasts!",
			text_receiver = "%S's attack smacks painfully across your %Tbreasts!",
			sound = 37472,
			requirements = {getCondition("attackerHumanoidish"), getCondition("victimBreasts")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "heavyPain",
			fn = Func.get("addExcitementMasochisticCrit")
		}))

		-- Paralysis
		table.insert(R, RPText:new({
			id = "SWING",
			text_bystander = "%S takes advantage of %T being paralyzed, squeezing %This %Tbreasts hard!",
			text_receiver = "%S takes advantage of you being paralyzed, squeezing your %Tbreasts hard!",
			sound = 25626,
			requirements = {getCondition("attackerHumanoidish"), getCondition("victimBreasts"), getCondition("victimParalyzed")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "heavyPain",
			fn = Func.get("addExcitementMasochisticCrit")
		}))
		table.insert(R, RPText:new({
			id = "SWING",
			text_bystander = "While %T is paralyzed, %S grabs a hold of %This nipples and twists hard!",
			text_receiver = "While you are paralyzed, %S grabs a hold of your nipples and twists hard!",
			sound = 25626,
			requirements = {getCondition("attackerHumanoidish"), getCondition("victimBreasts"), getCondition("victimParalyzed")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "heavyPain",
			fn = Func.get("addExcitementMasochisticCrit")
		}))
		table.insert(R, RPText:new({
			id = "SWING",
			text_bystander = "%S takes advantage of %T being paralyzed, squeezing %This %Tgroin hard!",
			text_receiver = "%S takes advantage of you being paralyzed, squeezing your %Tgroin hard!",
			sound = 25626,
			requirements = {getCondition("attackerHumanoidish"), getCondition("victimBreasts"), getCondition("victimParalyzed")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "heavyPain",
			fn = Func.get("addExcitementMasochisticCrit")
		}))

	-- Pinchers --
		table.insert(R, RPText:new({
			id = "SWING",
			text_bystander = "%S pinches %T's %leftright nipple!",
			text_receiver = "%S pinches your %leftright nipple!",
			--sound = 57787,
			visual = "pain",
			requirements = {getCondition("attackerIsPinchy"), getCondition("victimBreasts")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochistic")
		}));
		table.insert(R, RPText:new({
			id = "SWING",
			text_bystander = "%S pinches %T's %leftright %Tbreast!",
			text_receiver = "%S pinches your %leftright %Tbreast!",
			--sound = 57787,
			visual = "pain",
			requirements = {getCondition("attackerIsPinchy"), getCondition("victimBreasts")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochistic")
		}));
		table.insert(R, RPText:new({
			id = "SWING",
			visual = "pain",
			text_bystander = "%S pinches %T's %Tgroin!",
			text_receiver = "%S pinches your %Tgroin!",
			--sound = 57787,
			requirements = {getCondition("attackerIsPinchy")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochistic")
		}));

		table.insert(R, RPText:new({
			id = {["SWING_CRIT"]=true, ["Pinch"]=true},
			text_bystander = "%S clamps down hard on %T's %Tgroin!",
			text_receiver = "%S clamps down hard on your %Tgroin!",
			--sound = 57787,
			visual = "heavyPain",
			requirements = {getCondition("attackerIsPinchy"), getCondition("victimPenis")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochisticCrit")
		}));
		table.insert(R, RPText:new({
			id = {["SWING_CRIT"]=true, ["Pinch"]=true},
			text_bystander = "%S clamps down hard and tugs at both %T's nipples!",
			text_receiver = "%S clamps down hard and tugs at both your nipples!",
			--sound = 57787,
			visual = "heavyPain",
			requirements = {getCondition("attackerIsPinchy"), getCondition("victimBreasts")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochisticCrit")
		}));
		table.insert(R, RPText:new({
			id = {["SWING_CRIT"]=true, ["Pinch"]=true},
			text_bystander = "%S reaches up between %T's legs and clamps down on %This %Tbutt!",
			text_receiver = "%S reaches up between your legs and clamps down on your %Tbutt!",
			--sound = 57787,
			visual = "heavyPain",
			requirements = {getCondition("attackerIsPinchy")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochisticCrit")
		}));
		table.insert(R, RPText:new({
			id = {["SWING_CRIT"]=true, ["Pinch"]=true},
			text_bystander = "%S clamps down hard on %T's %leftright nipple, twisting it in the process!",
			text_receiver = "%S clamps down hard on your %leftright nipple, twisting it in the process!",
			--sound = 57787,
			visual = "heavyPain",
			requirements = {getCondition("attackerIsPinchy"), getCondition("victimBreasts")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochisticCrit")
		}));


	-- Cloud Serpents
		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S lashes across %T's %Tbreasts!",
			text_receiver = "%S lashes across your %Tbreasts!",
			sound = 3338,
			requirements = {getCondition("attackerIsCloudSerpent"), getCondition("victimBreasts"), getCondition("attackerNotLarge")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "pain",
			fn = Func.get("addExcitementMasochisticCrit")
		}));
		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S lashes across %T's %leftright %Tbreast!",
			text_receiver = "%S lashes across your %leftright %Tbreast!",
			sound = 3338,
			visual = "pain",
			requirements = {getCondition("attackerIsCloudSerpent"), getCondition("victimBreasts"), getCondition("attackerNotLarge")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochisticCrit")
		}));
		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S lashes across %T's %Tgroin!",
			text_receiver = "%S lashes across your %Tgroin!",
			sound = 3338,
			visual = "pain",
			requirements = {getCondition("attackerIsCloudSerpent"), getCondition("attackerNotLarge")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochisticCrit")
		}));
		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S lashes up between %T's legs and flicks %This %leftright buttcheek!",
			text_receiver = "%S lashes up between %T's legs and flicks %This %leftright buttcheek!",
			sound = 3338,
			visual = "pain",
			requirements = {getCondition("attackerIsCloudSerpent"), getCondition("attackerNotLarge")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochisticCrit")
		}));
		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S lashes up between %T's legs and strokes the tail up across %This %Tbutt and over %This %Tgroin!",
			text_receiver = "%S lashes up between %T's legs and flicks %This %leftright buttcheek!",
			sound = 3338,
			requirements = {getCondition("attackerIsCloudSerpent"), getCondition("attackerNotLarge"), getCondition("victimVagina")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "excitement",
			fn = Func.get("addExcitementMasochisticCrit")
		}));
		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S's tail slips into %T's %Tundies!",
			text_receiver = "%S's tail slips into your %Tundies, tickling your %Tgroin!",
			sound = 21727,
			requirements = {getCondition("attackerIsCloudSerpent"), getCondition("attackerNotLarge"), getCondition("targetWearsUnderwear")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "excitement",
			fn = Func.get("addExcitement")
		}));
		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S's tail slips into %T's %Tundies, making %Thim shuffle uncomfortably!",
			text_receiver = "%S's tail slips into your %Tundies wiggling up part way inside your %Tvagina!",
			sound = 21727,
			requirements = {getCondition("attackerIsCloudSerpent"), getCondition("attackerNotLarge"), getCondition("victimVagina"), getCondition("targetWearsUnderwear")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "heavyExcitement",
			fn = Func.get("addExcitementCrit")
		}));



	-- Wasps
		table.insert(R, RPText:new({
			id = "SWING",
			text_bystander = "%S's stinger tickles between %T's legs!",
			text_receiver = "%S's stinger tickles between your legs!",
			--sound = 57787,
			requirements = {getCondition("attackerIsWasp")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "excitement",
			fn = Func.get("addExcitementMasochisticCrit")
		}))


	-- Tentacle fiends (like the one in the draenei start area)
		table.insert(R, RPText:new({
			id = "SWING",
			text_bystander = "%S slips a tentacle into %T's clothes, wiggling against %This %Tgroin!",
			text_receiver = "%S slips a tentacle into your clothes, tickling your %Tgroin!",
			sound = 21727,
			requirements = {getCondition("attackerIsTentacleFiend")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "excitement",
			fn = Func.get("addExcitement")
		}))
		table.insert(R, RPText:new({
			id = "SWING",
			text_bystander = "%S slips a tentacle into %T's clothes, wiggling between %This %Trtag buttcheeks!",
			text_receiver = "%S slips a tentacle into your clothes, tickling between your %Trtag buttcheeks!",
			sound = 21727,
			visual = "excitement",
			requirements = {getCondition("attackerIsTentacleFiend")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitement")
		}))
		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S slips a tentacle into %T's clothes, slipping it up into %This %Tvagina and wiggling it around!",
			text_receiver = "%S slips a tentacle into your clothes, slipping it up into your %Tvagina and wiggling it around!",
			sound = 21727,
			visual = "heavyExcitement",
			requirements = {getCondition("attackerIsTentacleFiend"), getCondition("victimVagina")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementCrit")
		}))
		table.insert(R, RPText:new({
			id = "SWING",
			text_bystander = "%S slips a tentacle into %T's clothes, hooping it around %This nipples and tugs!",
			text_receiver = "%S slips a tentacle into your clothes, hooping it around your nipples and tugs!",
			sound = 21729,
			visual = "heavyPain",
			requirements = {getCondition("attackerIsTentacleFiend"), getCondition("victimBreasts")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochistic")
		}))



	-- Tentacle staff (funggarian?)
	
		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S prods %Shis tentacle staff up between %T's legs, letting it wriggle against %This %Tgroin!",
			text_receiver = "%S prods %Shis tentacle staff up between your legs, letting it wriggle against your %Tgroin!",
			sound = 37480,
			requirements = {
				getCondition("attackerHasTentacleStaff"), 
				getCondition("attackerNotLarge")
			},
			visual = "excitement",
			fn = Func.get("addExcitementCrit")
		}));
		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S prods %Shis wriggling tentacle staff against %T's %Tbreasts!",
			text_receiver = "%S prods %Shis wriggling tentacle staff against your %Tbreasts!",
			sound = 37480,
			requirements = {
				getCondition("attackerHasTentacleStaff"), 
				getCondition("attackerNotLarge"),
				getCondition("victimBreasts")
			},
			visual = "excitement",
			fn = Func.get("addExcitementCrit")
		}));
		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S schlops %Shis tentacle staff up between %T's legs!",
			text_receiver = "%S schlops %Shis tentacle staff up between your legs!",
			sound = 37480,
			visual = "pain",
			requirements = {
				getCondition("attackerHasTentacleStaff"), 
				getCondition("attackerNotLarge")
			},
			fn = Func.get("addExcitementMasochisticCrit")
		}));
		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S smacks %Shis wriggling tentacle staff across %T's %Tbreasts!",
			text_receiver = "%S smacks %Shis wriggling tentacle staff across %T's %Tbreasts!",
			sound = 37480,
			requirements = {
				getCondition("attackerHasTentacleStaff"), 
				getCondition("attackerNotLarge"),
				getCondition("victimBreasts")
			},
			visual = "pain",
			fn = Func.get("addExcitementMasochisticCrit")
		}));




	-- Lashing NPCs
		table.insert(R, RPText:new({
			id = "SWING",
			text_bystander = "%S lashes %T's %Tgroin!",
			text_receiver = "%S lashes your %Tgroin!",
			sound = 3338,
			requirements = {getCondition("attackerIsLasher")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "pain",
			fn = Func.get("addExcitementMasochisticCrit")
		}))

		table.insert(R, RPText:new({
			id = "SWING",
			text_bystander = "%S lashes %T's %leftright %Tbreast!",
			text_receiver = "%S lashes your %leftright %Tbreast!",
			sound = 3338,
			requirements = {getCondition("attackerIsLasher"), getCondition("victimBreasts")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "pain",
			fn = Func.get("addExcitementMasochisticCrit")
		}))

		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S lashes hard across %T's %Tgroin!",
			text_receiver = "%S lashes hard across your %Tgroin!",
			sound = 3338,
			requirements = {getCondition("attackerIsLasher")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "heavyPain",
			fn = Func.get("addExcitementMasochisticCrit")
		}))

		table.insert(R, RPText:new({
			id = "SWING",
			text_bystander = "%S slips a vine between %T's legs and tickles %This %Tgroin!",
			text_receiver = "%S slips a vine between your legs, tickling your %Tgroin!",
			sound = 21727,
			requirements = {getCondition("attackerIsVines")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "excitement",
			fn = Func.get("addExcitement")
		}))

		table.insert(R, RPText:new({
			id = "SWING",
			text_bystander = "A vine slips across %T's %Tbreasts wiggling against %This nipples!",
			text_receiver = "A vine slips across your %Tbreasts, tickling your nipples!",
			sound = 21727,
			requirements = {getCondition("attackerIsVines"), getCondition("victimBreasts")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "excitement",
			fn = Func.get("addExcitement")
		}))

		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S lashes across both %T's %Tbreasts!",
			text_receiver = "%S lashes across both your %Tbreasts!",
			sound = 3338,
			requirements = {getCondition("attackerIsLasher"), getCondition("victimBreasts")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "heavyPain",
			fn = Func.get("addExcitementMasochisticCrit")
		}))

		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S envelops %T's package with a vine, squeezing hard!",
			text_receiver = "%S envelops your package with a vine, squeezing hard!",
			sound = 25626,
			requirements = {getCondition("attackerIsVines"), getCondition("victimPenis")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "heavyPain",
			fn = Func.get("addExcitementMasochisticCrit")
		}))

		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S envelops %T's %Tbreasts with vines, squeezing hard!",
			text_receiver = "%S envelops your %Tbreasts with vines, squeezing hard!",
			sound = 25626,
			requirements = {getCondition("attackerIsVines"), getCondition("victimBreasts")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "heavyPain",
			fn = Func.get("addExcitementMasochisticCrit")
		}))

		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S lashes vines around %T's nipples and tugs back!",
			text_receiver = "%S lashes vines around your nipples and tugs back!",
			sound = 25626,
			requirements = {getCondition("attackerIsVines"), getCondition("victimBreasts")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "heavyPain",
			fn = Func.get("addExcitementMasochisticCrit")
		}))

		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S pushes a vine up between %T's legs, rigorously rubbing %This clit through %This clothes!",
			text_receiver = "%S pushes a vine up between your legs, rigorously rubbing your clit through your clothes!",
			sound = 21727,
			requirements = {getCondition("attackerIsVines"), getCondition("victimVagina")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "heavyExcitement",
			fn = Func.get("addExcitementMasochisticCrit")
		}))

		table.insert(R, RPText:new({
			id = "SWING",
			text_bystander = "%S takes advantage of %T being knocked down and lashes hard across %This %Tgroin!",
			text_receiver = "%S takes advantage of you being knocked down and lashes hard across your %Tgroin!",
			sound = 3338,
			requirements = {getCondition("attackerIsVines"), getCondition("victimKnockedDown")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "heavyPain",
			fn = Func.get("addExcitementMasochisticCrit")
		}))

	-- Ooze NPCs
		table.insert(R, RPText:new({
			id = "SWING",
			text_receiver = "Some ooze trickles into your cleavage.",
			--sound = 3338,
			requirements = {getCondition("attackerIsOoze"), getCondition("victimBreasts")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = function()
				Func.get("addExcitement")(self)
				if math.random() < 0.3 then
					Timer.set(function()
						Effect.run("oozeInClothes")
					end, 3+math.random()*3)
				end
			end
		}))
		table.insert(R, RPText:new({
			id = "SWING",
			text_receiver = "Some ooze trickles into your %Tundies.",
			--sound = 3338,
			requirements = {getCondition("attackerIsOoze"), getCondition("targetWearsUnderwear")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = function(self)
				Func.get("addExcitement")(self)
				if math.random() < 0.5 then
					Timer.set(function()
						Effect.run("oozeInClothes")
					end, 3+math.random()*3)
				end
			end
		}))

	-- Fistfighters, not large
		
		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S twists %T's %leftright nipple!",
			text_receiver = "%S twists your %leftright nipple!",
			sound = 25626,
			requirements = {
				getCondition("attackerNotLarge"), 
				getCondition("victimBreasts"),
				getCondition("attackerIsFistfighter"),
				getCondition("chestLightArmor"),
			},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "heavyPain",
			fn = Func.get("addExcitementMasochisticCrit")
		}))
		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S twists %T's nipples!",
			text_receiver = "%S twists your nipples!",
			sound = 25626,
			requirements = {
				getCondition("attackerNotLarge"), 
				getCondition("victimBreasts"),
				getCondition("attackerIsFistfighter"),
				getCondition("chestLightArmor"),
			},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "heavyPain",
			fn = Func.get("addExcitementMasochisticCrit")
		}))
		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S slaps %T's %Tbreasts!",
			text_receiver = "%S slaps your %Tbreasts!",
			sound = 25626,
			requirements = {
				getCondition("attackerNotLarge"), 
				getCondition("victimBreasts"),
				getCondition("attackerIsFistfighter"),
			},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "heavyPain",
			fn = Func.get("addExcitementMasochisticCrit")
		}))
		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S smacks %T's %Tgroin from below!",
			text_receiver = "%S smacks your %Tgroin from below!",
			sound = 3338,
			requirements = {
				getCondition("attackerIsSmall"),
				getCondition("attackerIsFistfighter"),
			},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "heavyPain",
			fn = Func.get("addExcitementMasochistic")
		}))
		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S reaches in between %T's legs and squeezes %This %Tgroin!",
			text_receiver = "%S reaches in between your legs and squeezes your %Tgroin!",
			sound = 25626,
			requirements = {
				getCondition("attackerNotLarge"),
				getCondition("attackerIsFistfighter"),
			},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "pain",
			fn = Func.get("addExcitementMasochistic")
		}))
		table.insert(R, RPText:new({
			id = "SWING",
			text_bystander = "%S reaches between %T's legs and throws a slap against %This %Tbutt from below!",
			text_receiver = "%S reaches between your legs and throws a slap against your %Tbutt from below!",
			sound = 3338,
			requirements = {
				getCondition("attackerIsSmall"),
				getCondition("attackerIsFistfighter"),
			},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "pain",
			fn = Func.get("addExcitementMasochistic")
		}))
		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S throws a punch from below right at %T's %Tgroin!",
			text_receiver = "%S throws a punch from below right at your %Tgroin!",
			sound = 83716,
			requirements = {
				getCondition("attackerIsSmall"),
				getCondition("attackerIsFistfighter"),
			},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "heavyPain",
			fn = Func.get("addExcitementMasochisticCrit")
		}))


	-- Pale orc npcs
		table.insert(R, RPText:new({
			id = "SWING",
			text_bystander = "%S forces his %Spenis into %T's mouth!",
			text_receiver = "%S forces his %Spenis into your mouth!",
			sound = ExiWoW.getSound("squish"),
			requirements = {
				getCondition("attackerIsPaleOrc"),
				getCondition("victimHeadJumped"),
				getCondition("maleWhispers")
			},
			fn = Func.get("addExcitement")
		}));
		table.insert(R, RPText:new({
			id = "SWING",
			text_bystander = "%S grabs a hold of %T's ears and starts humping %This face!",
			text_receiver = "%S grabs a hold of your ears and starts humping your face!",
			sound = ExiWoW.getSound("squish"),
			requirements = {
				getCondition("attackerIsPaleOrc"),
				getCondition("victimHeadJumped"),
				getCondition("maleWhispers")
			},
			fn = Func.get("addExcitement")
		}));
		table.insert(R, RPText:new({
			id = "SWING",
			text_bystander = "%S rubs %Shis %Spenis across %T's face!",
			text_receiver = "%S rubs %Shis %Spenis across your face!",
			sound = ExiWoW.getSound("squish"),
			requirements = {
				getCondition("attackerIsPaleOrc"),
				getCondition("victimHeadJumped"),
				getCondition("maleWhispers")
			},
			fn = Func.get("addExcitement")
		}));


-- SPELLS --

		-- GENERIC / NPC --

			-- Ice spells
				table.insert(R, RPText:new({
					text_bystander = "The cold spell causes %T's nipples to harden!",
					text_receiver = "The cold spell causes your nipples to harden!",
					requirements = {
						spellAddOrTick, 
						getCondition("victimBreasts"),
						getCondition("ts_cold"),
					},
					visual = "frost",
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					text_receiver = "%spell chills your nipples!",
					requirements = {
						spellAddOrTick, 
						getCondition("victimBreasts"),
						getCondition("ts_cold"),
					},
					visual = "frost",
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					text_receiver = "%spell chills your %Tgroin!",
					requirements = {
						spellAddOrTick, 
						getCondition("victimPenis"),
						getCondition("ts_cold"),
					},
					visual = "frost",
					fn = Func.get("addExcitementMasochistic")
				}))

			-- Lightning
				table.insert(R, RPText:new({
					text_receiver = "The %spell shocks your nipples!",
					sound = 35286,
					requirements = {
						spellAddOrTick,  -- OR
						getCondition("victimBreasts"),
						getCondition("ts_electric"),
						getCondition("spellDetrimental")
					},
					visual = "lightning",
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					text_receiver = "The %spell painfully shocks your %Tbreasts!",
					sound = 35286,
					requirements = {
						spellAddOrTick,  -- OR
						getCondition("victimBreasts"),
						getCondition("ts_electric"),
						getCondition("spellDetrimental")
					},
					visual = "lightning",
					fn = Func.get("addExcitementMasochistic")
				}));
				table.insert(R, RPText:new({
					text_receiver = "The %spell painfully shocks your exposed chest!",
					sound = 35286,
					requirements = {
						spellAddOrTick,  -- OR
						getCondition("noChest"),
						getCondition("noTabard"),
						getCondition("noShirt"),
						getCondition("ts_electric"),
						getCondition("spellDetrimental")
					},
					visual = "lightning",
					fn = Func.get("addExcitementMasochisticCrit")
				}));
				
				table.insert(R, RPText:new({
					text_receiver = "%spell crackles through your chestpiece!",
					sound = 35286,
					requirements = {
						spellAddOrTick,  -- OR
						getCondition("victimBreasts"),
						getCondition("ts_electric"),
						getCondition("chestHeavyArmor"),
						getCondition("spellDetrimental")
					},
					visual = "lightning",
					fn = Func.get("addExcitementMasochisticCrit")
				}))
				table.insert(R, RPText:new({
					text_receiver = "%spell crackles through your crotchpiece!",
					sound = 35286,
					requirements = {
						spellAddOrTick,  -- OR
						getCondition("ts_electric"),
						getCondition("legsHeavyArmor"),
						getCondition("spellDetrimental")
					},
					visual = "lightning",
					fn = Func.get("addExcitementMasochisticCrit")
				}))
				-- Beneficial lightning
				table.insert(R, RPText:new({
					text_receiver = "The %spell causes your nipples to tingle!",
					requirements = {
						spellAddOrTick,
						getCondition("rand10"),
						getCondition("victimBreasts"),
						getCondition("ts_electric"),
						getCondition("spellBeneficial")
					},
					visual = "lightning",
					fn = Func.get("addExcitement")
				}));
				table.insert(R, RPText:new({
					text_receiver = "The %spell causes your %Tgenitals to tingle!",
					requirements = {
						spellAddOrTick,
						getCondition("rand10"),
						getCondition("ts_electric"),
						getCondition("spellBeneficial")
					},
					visual = "lightning",
					fn = Func.get("addExcitement")
				}));
				table.insert(R, RPText:new({
					text_receiver = "The %spell causes your %Tbutt to tingle!",
					requirements = {
						spellAddOrTick,
						getCondition("rand10"),
						getCondition("ts_electric"),
						getCondition("spellBeneficial")
					},
					visual = "lightning",
					fn = Func.get("addExcitement")
				}));


			-- Petrifying (basilisk) spells
				
				table.insert(R, RPText:new({
					text_bystander = "%spell causes %T's nipples to %harden!",
					text_receiver = "%spell causes your nipples to %harden!",
					requirements = {
						getCondition("is_spell_add"),
						getCondition("victimBreasts"),
						getCondition("ts_petrify"),
					},
					fn = Func.get("addExcitement")
				}))
				table.insert(R, RPText:new({
					text_bystander = "%spell causes %T's %Tpenis to %harden!",
					text_receiver = "%spell causes your %Tpenis to %harden!",
					requirements = {
						getCondition("is_spell_add"),
						getCondition("victimPenis"),
						getCondition("ts_petrify"),
					},
					fn = Func.get("addExcitement")
				}))

			-- Uppercut
				table.insert(R, RPText:new({
					id = "Uppercut",
					text_bystander = "%S uppercuts %T's %Tbreasts with enough force to knock %Thim back!",
					text_receiver = "%S uppercuts your %Tbreasts with enough force to knock you back!",
					--sound = 35103,
					requirements = {
						getCondition("is_spell_tick"),
						getCondition("victimBreasts")
					},
					visual = "heavyPain",
					fn = Func.get("addExcitementMasochisticCrit")
				}))
				table.insert(R, RPText:new({
					id = "Uppercut",
					text_bystander = "%S uppercuts %T's %leftright %Tbreast, jiggling it around heavily as %The stagger backwards!",
					text_receiver = "%S uppercuts your %leftright %Tbreast, jiggling it around heavily as you stagger backwards!",
					--sound = 35103,
					requirements = {
						getCondition("is_spell_tick"),
						getCondition("victimBreasts")
					},
					visual = "heavyPain",
					fn = Func.get("addExcitementMasochisticCrit")
				}))

			-- Shield bash
				table.insert(R, RPText:new({
					text_bystander = "%S's shield slams across %T's %Tbreasts!",
					text_receiver = "%S's shield slams across your %Tbreasts!",
					requirements = {
						getCondition("is_spell_tick"),
						getCondition("victimBreasts"),
						getCondition("ts_shield_bash"),
					},
					visual = "pain",
					fn = Func.get("addExcitementMasochistic")
				}))

			-- Steam below
				table.insert(R, RPText:new({
					text_receiver = "Hot steam blasts across your %Tgroin!",
					requirements = {
						getCondition("is_spell_tick"),
						getCondition("ts_steam_below"),
					},
					fn = Func.get("addExcitementMasochistic")
				}))


			-- Headbutt
				table.insert(R, RPText:new({
					id = "Headbutt",
					text_bystander = "%S headbutts straight into %T's %Tbreasts!",
					text_receiver = "%S headbutts straight into your %Tbreasts!",
					requirements = {
						getCondition("is_spell_tick"),
						getCondition("victimBreasts"),
						getCondition("attackerHumanoidish")
					},
					visual = "pain",
					fn = Func.get("addExcitementMasochisticCrit")
				}))

			-- Grappling Hook
				table.insert(R, RPText:new({
					id = "Grappling Hook",
					text_bystander = "%S's hook latches to the front of %T's %Tundies before flinging %Thim through the air!",
					text_receiver = "%S's hook latches to the front of your %Tundies before flinging you through the air!",
					requirements = {
						getCondition("is_spell_ran"),
						getCondition("targetWearsUnderwear"),
						Condition:new({type=ty.RTYPE_ZONE, data="Frostfire Ridge"})
					},
					visual = "pain",
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					id = "Grappling Hook",
					text_bystander = "%S's hook latches to the front of %T's %Tundies, tearing it off as %The is flung through the air!",
					text_receiver = "%S's hook latches to the front of your %Tundies, tearing it off as you are flung through the air!",
					sound = 117818,
					requirements = {
						getCondition("is_spell_ran"),
						getCondition("targetWearsUnderwear"),
						Condition:new({type=ty.RTYPE_ZONE, data="Frostfire Ridge"})
					},
					fn = function()
						Func.get("addExcitementMasochistic")();
						ExiWoW.ME:unequipActiveUnderwear();
					end
				}))

			-- Slitherstrike
				table.insert(R, RPText:new({
					id = "Slitherstrike",
					text_receiver = "Cold goo from the %spell trickles down over your %Tbreasts!",
					--sound = 35103,
					requirements = {
						getCondition("is_spell_tick"),
						getCondition("victimBreasts")
					},
					fn = Func.get("addExcitement")
				}))
				table.insert(R, RPText:new({
					id = "Slitherstrike",
					text_receiver = "Cold goo from the %spell trickles down into your %Tundies!",
					--sound = 35103,
					requirements = {
						getCondition("is_spell_tick"),
						getCondition("targetWearsUnderwear")
					},
					fn = Func.get("addExcitement")
				}))
				

			-- Ground spike
				table.insert(R, RPText:new({
					text_bystander = "%spell prods up between %T's buttcheeks, striking a glancing blow!",
					text_receiver = "%spell prods up between your buttcheeks, tickling your behind!",
					sound = 48922,
					requirements = {
						getCondition("is_spell_tick"),
						getCondition("ts_ground_spike")
					},
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					text_bystander = "%spell lands a glancing blow between %T's legs, smacking %This %Tbulge around!",
					text_receiver = "%spell lands a glancing blow between your legs, smacking your %Tbulge around!",
					sound = 48922,
					requirements = {
						getCondition("is_spell_tick"),
						getCondition("victimPenis"),
						getCondition("ts_ground_spike")
					},
					visual = "heavyPain",
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					text_bystander = "%spell lands a glancing blow between %T's legs, firmly prodding up against %This %Tgroin!",
					text_receiver = "%spell lands a glancing blow between your legs, firmly prodding up against your %Tgroin!",
					sound = 48922,
					requirements = {
						getCondition("is_spell_tick"),
						getCondition("victimVagina"),
						getCondition("ts_ground_spike")
					},
					visual = "pain",
					fn = Func.get("addExcitementMasochistic")
				}))

			-- Cleaving Smack
				table.insert(R, RPText:new({
					id = "Cleaving Smack",
					text_bystander = "%S's %spell lands across %T's %Tbreasts, smacking them around!",
					text_receiver = "%S's %spell lands across your %Tbreasts, smacking them around!",
					requirements = {
						getCondition("victimBreasts"),
						getCondition("attackerNotLarge"),
						getCondition("victimChestNotPlate")
					},
					visual = "pain",
					fn = Func.get("addExcitementMasochisticCrit")
				}))
				table.insert(R, RPText:new({
					id = "Cleaving Smack",
					text_bystander = "%S's %spell bounces off of %T's breastplate!",
					text_receiver = "%S's %spell bounces off of your breastplate!",
					requirements = {
						getCondition("victimBreasts"),
						getCondition("attackerNotLarge"),
						getCondition("victimChestPlate")
					},
					fn = Func.get("addExcitementMasochistic")
				}));

			-- Lick
				table.insert(R, RPText:new({
					id = "Lick",
					text_bystander = "%S's tongue slithers across %T's %Tbreasts!",
					text_receiver = "%S's tongue slithers across your %Tbreasts!",
					requirements = {
						getCondition("victimBreasts"),
						getCondition("attackerIsSaurolisk"),
						getCondition("is_spell_add")
					},
					visual = "excitement",
					fn = Func.get("addExcitement")
				}));
				table.insert(R, RPText:new({
					id = "Lick",
					text_bystander = "%S's big tongue gets into %T's outfit, licking across %This %Tbreasts!",
					text_receiver = "%S's big tongue gets into your outfit, licking across your %Tbreasts!",
					requirements = {
						getCondition("victimBreasts"),
						getCondition("attackerIsSaurolisk"),
						getCondition("is_spell_add"),
						getCondition("rand30"),
					},
					visual = "excitement",
					fn = Func.get("addExcitement")
				}));
				table.insert(R, RPText:new({
					id = "Lick",
					text_bystander = "%S's big tongue slithers up across %T's %Tgroin!",
					text_receiver = "%S's big tongue slithers up across your %Tgroin!",
					requirements = {
						getCondition("attackerIsSaurolisk"),
						getCondition("is_spell_add")
					},
					visual = "excitement",
					fn = Func.get("addExcitement")
				}));
				table.insert(R, RPText:new({
					id = "Lick",
					text_bystander = "%S's big tongue slithers up and into %T's %Tundies!",
					text_receiver = "%S's big tongue slithers down your %Tundies and prods up across your %Tvagina!",
					requirements = {
						getCondition("targetWearsUnderwear"),
						getCondition("victimVagina"),
						getCondition("rand30"),
						getCondition("attackerIsSaurolisk"),
						getCondition("is_spell_add")
					},
					visual = "heavyExcitement",
					fn = Func.get("addExcitementCrit")
				}));
				


			-- Magic whips
				table.insert(R, RPText:new({
					text_bystander = "%S's %spell lashes across %T's %Tbutt!",
					text_receiver = "%S's %spell lashes across your %Tbutt!",
					sound = 75769,
					requirements = {
						getCondition("is_spell_tick"),
						getCondition("ts_magic_whip")
					},
					visual = "pain",
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					text_bystander = "%S's %spell lashes across %T's %Tgroin!",
					text_receiver = "%S's %spell lashes across your %Tgroin!",
					sound = 75769,
					requirements = {
						getCondition("is_spell_tick"),
						getCondition("ts_magic_whip")
					},
					visual = "pain",
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					text_bystander = "%S's %spell lashes across both of %T's %Tbreasts!",
					text_receiver = "%S's %spell lashes across both of your %Tbreasts!",
					sound = 75769,
					requirements = {
						getCondition("is_spell_tick"),
						getCondition("victimBreasts"),
						getCondition("ts_magic_whip")
					},
					visual = "pain",
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					text_bystander = "%S's %spell lashes across %T's %leftright %Tbreast!",
					text_receiver = "%S's %spell lashes across your %leftright %Tbreast!",
					sound = 75769,
					requirements = {
						getCondition("is_spell_tick"),
						getCondition("victimBreasts"),
						getCondition("ts_magic_whip")
					},
					visual = "pain",
					fn = Func.get("addExcitementMasochistic")
				}))


			-- Spillable
				table.insert(R, RPText:new({
					text_bystander = "%spell spills onto %T's %Tbreasts!",
					text_receiver = "Some of the %spell spills onto your %Tbreasts!",
					sound = 1059,
					requirements = {
						getCondition("victimBreasts"),
						getCondition("ts_spillable"),
						getCondition("rand20")
					},
					fn = function()
						Func.get("addExcitement")({id={SWING=true}});
					end
				}))

			-- Bone toss
				table.insert(R, RPText:new({
					id = "Bone Toss",
					text_bystander = "%S's %spell hits %T right between %This legs!",
					text_receiver = "%S's %spell hit you right between the legs!",
					sound = 78936,
					requirements = {},
					visual = "pain",
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					id = "Bone Toss",
					text_bystander = "%S's %spell hits %T's %leftright %Tbreast!",
					text_receiver = "%S's %spell hits your %leftright %Tbreast!",
					sound = 78936,
					requirements = {getCondition("victimBreasts")},
					visual = "pain",
					fn = Func.get("addExcitementMasochistic")
				}))

			-- Slosh
				table.insert(R, RPText:new({
					text_receiver = "Liquid from the %spell trickles down between your %Tbreasts!",
					requirements = {
						getCondition("victimBreasts"), 
						getCondition("ts_slosh"),
						getCondition("rand10"),
						getCondition("spellDetrimental")
					},
					fn = Func.get("addExcitement")
				}));
				table.insert(R, RPText:new({
					text_receiver = "Liquid from the %spell pours into your %Tundies!",
					requirements = {
						getCondition("targetWearsUnderwear"),
						getCondition("rand10"),
						getCondition("spellDetrimental"),
						getCondition("ts_slosh"),
					},
					fn = Func.get("addExcitement")
				}));
				table.insert(R, RPText:new({
					text_receiver = "Liquid from the %spell seeps into your outfit.",
					requirements = {getCondition("ts_slosh"),getCondition("rand10"),getCondition("spellDetrimental"),}
				}));
				table.insert(R, RPText:new({
					text_receiver = "%spell splashes across your %Tbreasts!",
					requirements = {
						getCondition("victimBreasts"), 
						getCondition("ts_slosh"),
						getCondition("rand10"),
						getCondition("spellDetrimental")
					},
					fn = Func.get("addExcitement")
				}));
				table.insert(R, RPText:new({
					text_receiver = "%spell splashes across your %Tgroin!",
					requirements = {
						getCondition("ts_slosh"),
						getCondition("rand10"),
						getCondition("spellDetrimental")
					},
					fn = Func.get("addExcitement")
				}));
				

			-- Small Shards
				table.insert(R, RPText:new({
					text_receiver = "A pulsating crystal shard tumbles into your clothes, coming to a rest between your %Tbreasts!",
					requirements = {
						spellAddOrTick, 
						getCondition("victimBreasts"),
						getCondition("ts_shards")
					},
					fn = function()
						Func.get("addExcitement")();
						DoEmote("LAUGH", "player");
						Effect.run("debuffShardTickleBreasts");
					end
				}))
				table.insert(R, RPText:new({
					text_receiver = "A pulsating crystal shard tumbles into your %Tundies, tickling your %Tgenitals!",
					requirements = {
						spellAddOrTick, 
						getCondition("targetWearsUnderwear"),
						getCondition("ts_shards")
					},
					fn = function()
						DoEmote("LAUGH", "player");
						Func.get("addExcitement")();
						Effect.run("debuffShardTickleGroin")
					end
				}))
				table.insert(R, RPText:new({
					text_receiver = "A crystal shard tumbles down your buttcrack, tickling your %Tbutt!",
					requirements = {
						spellAddOrTick,
						getCondition("ts_shards")
					},
					fn = function()
						DoEmote("LAUGH", "player");
						Func.get("addExcitement")();
						Effect.run("debuffShardTickleButt")
					end
				}))
			
			-- Bop barrage
				table.insert(R, RPText:new({
					id = "Bop Barrage",
					text_bystander = "%S bops %T's %leftright %Tbreast!",
					text_receiver = "%S bops your %leftright %Tbreast!",
					requirements = {spellAddOrTick, getCondition("victimBreasts")},
					visual = "pain",
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					id = "Bop Barrage",
					text_bystander = "%S bops both %T's %Tbreasts!",
					text_receiver = "%S bops both your %Tbreasts!",
					requirements = {spellAddOrTick, getCondition("victimBreasts")},
					visual = "pain",
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					id = "Bop Barrage",
					text_bystander = "%S bops %T's bulge!",
					text_receiver = "%S bops your bulge!",
					requirements = {spellAddOrTick, getCondition("targetWearsUnderwear"), getCondition("victimPenis")},
					visual = "pain",
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					id = "Big Bop",
					text_bystander = "%S bops %T's %Tbreasts with enough force to knock %Thim down!",
					text_receiver = "%S bops your %Tbreasts with enough force to knock you down!",
					requirements = {spellAddOrTick, getCondition("victimBreasts")},
					visual = "heavyPain",
					fn = Func.get("addExcitementMasochisticCrit")
				}))
				table.insert(R, RPText:new({
					id = "Big Bop",
					text_bystander = "%S bops %T's bulge with enough force to knock %Thim to the ground!",
					text_receiver = "%S bops your bulge with enough force to knock you to the ground!",
					requirements = {spellAddOrTick, getCondition("targetWearsUnderwear"), getCondition("victimPenis")},
					visual = "heavyPain",
					fn = Func.get("addExcitementMasochisticCrit")
				}))
				
			-- Dancing thorns
				table.insert(R, RPText:new({
					id = "Dancing Thorns",
					text_receiver = "A dancing thorn pricks your %leftright %Tbreast!",
					requirements = {spellAddOrTick, getCondition("victimBreasts"), Condition:new({type=Condition.Types.RTYPE_ON_QUEST, inverse=true, data={"UNDERVINE_1"}})},
					visual = "pain",
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					id = "Dancing Thorns",
					text_receiver = "A dancing thorn pricks your %Tbutt!",
					requirements = {spellAddOrTick, Condition:new({type=Condition.Types.RTYPE_ON_QUEST, inverse=true, data={"UNDERVINE_1"}})},
					visual = "pain",
					fn = Func.get("addExcitementMasochistic")
				}))


			-- Insect swarm
				table.insert(R, RPText:new({
					text_receiver = "An insect gets into your chestpiece and bites your %leftright nipple!",
					requirements = {
						getCondition("is_spell_tick"), 
						getCondition("victimBreasts"),
						getCondition("ts_insects")
					},
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					text_receiver = "An insect gets into your pants and bites your %Tpenis!",
					requirements = {
						getCondition("is_spell_tick"), 
						getCondition("victimPenis"),
						getCondition("ts_insects")
					},
					fn = Func.get("addExcitementMasochisticCrit")
				}))
				table.insert(R, RPText:new({
					text_receiver = "An insect gets into your pants and skitters across your %Tvagina!",
					requirements = {
						getCondition("is_spell_tick"), 
						getCondition("victimVagina"),
						getCondition("ts_insects")
					},
					fn = Func.get("addExcitement")
				}))

			-- Bonk
				table.insert(R, RPText:new({
					id = "Bonk",
					text_bystander = "%S bonks %T's %leftright %Tbreast!",
					text_receiver = "%S bonks your %leftright %Tbreast!",
					sound = 33927,
					visual = "pain",
					requirements = {getCondition("victimBreasts"), getCondition("is_spell_add")},
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					id = "Bonk",
					text_bystander = "%S bonks across both of %T's %Tbreasts!",
					text_receiver = "%S bonks across both of your %Tbreasts!",
					sound = 33927,
					visual = "pain",
					requirements = {getCondition("victimBreasts"), getCondition("is_spell_add")},
					fn = Func.get("addExcitementMasochisticCrit")
				}))
				
				table.insert(R, RPText:new({
					id = "Bonk",
					text_bystander = "%S bonks %T's %Tgroin!",
					text_receiver = "%S bonks your %Tgroin!",
					sound = 33927,
					visual = "pain",
					requirements = {getCondition("is_spell_add")},
					fn = Func.get("addExcitementMasochisticCrit")
				}))

			-- Kick
				table.insert(R, RPText:new({
					id = "Kick",
					text_bystander = "%S kicks %T right in %This %Tgroin!",
					text_receiver = "%S kicks you right in the %Tgroin!",
					requirements = {getCondition("rand20")},
					visual = "heavyPain",
					fn = Func.get("addExcitementMasochisticCrit")
				}))

			-- Shoot
				table.insert(R, RPText:new({
					id = "Shoot",
					text_receiver = "%S's projectile bounces off your chestplate!",
					sound = 57073,
					requirements = {getCondition("is_spell_tick"), getCondition("chestPlate"), getCondition("victimBreasts")},
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					id = "Shoot",
					text_receiver = "%S shot bounces off your crotchplate!",
					sound = 57073,
					requirements = {getCondition("is_spell_tick"), getCondition("crotchPlate")},
					fn = Func.get("addExcitementMasochistic")
				}))

			-- Lash of pain
				table.insert(R, RPText:new({
					id = "Lash of Pain",
					text_bystander = "%S's whip cracks across %T's %leftright %Tbreast!",
					text_receiver = "%S's whip cracks across your %leftright %Tbreast!",
					visual = "pain",
					sound = 3338,
					requirements = {getCondition("is_spell_tick"), getCondition("victimBreasts")},
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					id = "Lash of Pain",
					text_bystander = "%S's whip cracks across %T's %Tbreasts!",
					text_receiver = "%S's whip cracks across your %Tbreasts!",
					sound = 3338,
					visual = "pain",
					requirements = {getCondition("is_spell_tick"), getCondition("victimBreasts")},
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					id = "Lash of Pain",
					text_bystander = "%S's whip cracks across %T's %Tgroin!",
					text_receiver = "%S's whip cracks across your %Tgroin!",
					sound = 3338,
					visual = "pain",
					requirements = {getCondition("is_spell_tick")},
					fn = Func.get("addExcitementMasochistic")
				}))


			-- Daglop
				table.insert(R, RPText:new({
					id = "DAGLOP_NIPPLE_TWIST",
					text_bystander = "Daglop reaches into %T's chestpiece and twists %This nipples!",
					text_receiver = "Daglop reaches into your chestpiece and twists your nipples!",
					sound = 25626,
					requirements = {},
					visual = "pain",
					fn = Func.get("addExcitementMasochisticCrit")
				}));
				table.insert(R, RPText:new({
					id = "DAGLOP_NIPPLE_TWIST_TEXT",
					is_chat = true,
					sound = 770,
					text_bystander = true,
					text_receiver = "Daglop: Work harder, minion!",
					requirements = {}
				}));

				table.insert(R, RPText:new({
					id = "DAGLOP_WEDIGE",
					text_bystander = "Daglop grabs a hold of %T's %Tundies from behind, giving %Thim a wedgie!",
					text_receiver = "Daglop grabs a hold of the back of your %Tundies, giving you a wedgie!",
					sound = 25626,
					visual = "pain",
					requirements = {getCondition("targetWearsUnderwear")},
					fn = Func.get("addExcitementMasochistic")
				}));
				table.insert(R, RPText:new({
					id = "DAGLOP_WEDIGE_TEXT",
					is_chat = true,
					sound = 770,
					text_bystander = true,
					text_receiver = "Daglop: Huh, interesting choice in underwear!",
					requirements = {}
				}));

				table.insert(R, RPText:new({
					id = "DAGLOP_BUTTKICK",
					text_bystander = "Daglop kicks %T's %Tbutt!",
					text_receiver = "Daglop kicks you in the %Tbutt!",
					sound = 31941,
					requirements = {},
					visual = "pain",
					fn = Func.get("addExcitementMasochistic")
				}));
				table.insert(R, RPText:new({
					id = "DAGLOP_BUTTKICK_TEXT",
					is_chat = true,
					sound = 770,
					text_bystander = true,
					text_receiver = "Daglop: Get to it, chop chop!",
					requirements = {}
				}));
				table.insert(R, RPText:new({
					id = "DAGLOP_BUTTKICK_TEXT",
					is_chat = true,
					sound = 770,
					text_bystander = true,
					text_receiver = "Daglop: Big butts are bound to be beaten for motivation!",
					requirements = {getCondition("largeButt")}
				}));

				table.insert(R, RPText:new({
					id = "DAGLOP_BOOB_GRAB",
					text_bystander = "Daglop grabs a hold of and squeezes %T's %Tbreasts!",
					text_receiver = "Daglop grabs a hold of and squeezes your %Tbreasts!",
					sound = 25626,
					requirements = {getCondition("victimBreasts")},
					visual = "excitement",
					fn = Func.get("addExcitementMasochistic")
				}));
				table.insert(R, RPText:new({
					id = "DAGLOP_BOOB_GRAB_TEXT",
					is_chat = true,
					sound = 770,
					text_bystander = true,
					text_receiver = "Daglop: Oh sorry, I was er... slipping...",
					requirements = {}
				}));
				table.insert(R, RPText:new({
					id = "DAGLOP_BOOB_GRAB_TEXT",
					is_chat = true,
					sound = 770,
					text_bystander = true,
					text_receiver = "Daglop: Why don't I hold onto these big things so you don't get back problems?",
					requirements = {getCondition("largeBreasts")}
				}));

				table.insert(R, RPText:new({
					id = "DAGLOP_MOUTH_FINGER",
					text_bystander = "Daglop forces a finger into %T's mouth!",
					text_receiver = "Daglop forces a finger into your mouth!",
					sound = 3541,
					requirements = {},
					fn = Func.get("addExcitement")
				}));
				table.insert(R, RPText:new({
					id = "DAGLOP_MOUTH_FINGER_TEXT",
					is_chat = true,
					sound = 770,
					text_bystander = true,
					text_receiver = "Daglop: Just making sure my minion is in good health.",
					requirements = {}
				}));

				table.insert(R, RPText:new({
					id = "DAGLOP_RITUAL_TEXT",
					is_chat = true,
					sound = 770,
					text_bystander = true,
					text_receiver = "Daglop: Partake in a ritual some time! I could strap you to an altar, remove your %Tundies and you know...",
					requirements = {}
				}));

			-- Shattering song
				table.insert(R, RPText:new({
					id = "Shattering Song",
					text_receiver = "The shattering song causes your equipment to vibrate heavily!",
					fn = Func.get("addExcitement"),
					visual = "excitement",
					requirements = {}
				}));
			-- Quill barb
				table.insert(R, RPText:new({
					id = "Quill Barb",
					text_bystander = "%S pricks %T's %Tbutt with a %spell!",
					text_receiver = "%S pricks your %Tbutt with the %spell!",
					fn = Func.get("addExcitementMasochistic"),
					visual = "pain",
					requirements = {}
				}));

			-- Icky ink
				table.insert(R, RPText:new({
					id = "Icky Ink",
					text_bystander = "%S slips a tentacle into %T's %Tundies, squirting icky ink inside!",
					text_receiver = "%S slips a tentacle into your %Tundies, squirting icky ink inside!",
					fn = Func.get("addExcitement"),
					sound = 18133,
					requirements = {
						getCondition("is_spell_add"),
						getCondition("targetWearsUnderwear")
					}
				}));
				table.insert(R, RPText:new({
					id = "Icky Ink",
					sound = 18133,
					text_bystander = "%S slithers a tentacle into %T's %Tbutt, squirting a load of icky ink inside %Thim!",
					text_receiver = "%S slithers a tentacle into your %Tbutt, squirting a load of icky ink inside!",
					fn = Func.get("addExcitementCrit"),
					visual = "excitement",
					requirements = {
						getCondition("is_spell_add"),
					}
				}));
				table.insert(R, RPText:new({
					id = "Icky Ink",
					sound = 18133,
					text_bystander = "%S slithers a tentacle into %T's %Tvagina, squirting a load of icky ink inside %Thim!",
					text_receiver = "%S slithers a tentacle into your %Tvagina, squirting a load of icky ink inside!",
					fn = Func.get("addExcitementCrit"),
					visual = "excitement",
					requirements = {
						getCondition("is_spell_add"),
						getCondition("victimVagina")
					}
				}));
				table.insert(R, RPText:new({
					id = "Icky Ink",
					sound = 18133,
					text_bystander = "%S squirts a wad of icky ink that splashes across %T's %Tbreasts!",
					text_receiver = "%S squirts a wad of icky ink that splashes across your %Tbreasts!",
					fn = Func.get("addExcitement"),
					requirements = {
						getCondition("is_spell_add"),
						getCondition("victimBreasts")
					}
				}));
				table.insert(R, RPText:new({
					id = "Icky Ink",
					sound = 18133,
					text_bystander = "%S slips a tentacle down the back of %T's %Tundies, slithering up inside %This %Tvagina, squirting icky ink into %Thim!",
					text_receiver = "%S slips a tentacle down the back of your %Tundies, slithering up inside your %Tvagina, squirting icky ink inside you!",
					fn = Func.get("addExcitementCrit"),
					visual = "excitement",
					requirements = {
						getCondition("is_spell_add"),
						getCondition("targetWearsUnderwear"),
						getCondition("victimVagina")
					}
				}));
				table.insert(R, RPText:new({
					id = "Icky Ink",
					sound = 18133,
					text_bystander = "%S shoves a tentacle into %T's mouth, forcing a load of icky ink down %This throat!",
					text_receiver = "%S shoves a tentacle into your mouth, forcing a load of icky ink down your throat!",
					fn = Func.get("addExcitement"),
					requirements = {
						getCondition("is_spell_add"),
					}
				}));

			-- Daze
				table.insert(R, RPText:new({
					id = "Dazed",
					text_bystander = "%S throws a quick slap across %T's %Tbutt!",
					text_receiver = "%S throws a quick slap across your %Tbutt!",
					fn = Func.get("addExcitementMasochistic"),
					visual = "pain",
					sound = 37472,
					requirements = {
						getCondition("attackerNotLarge"),
						getCondition("is_spell_add"),
						getCondition("attackerHumanoidish")
					}
				}));
				table.insert(R, RPText:new({
					id = "Dazed",
					text_bystander = "%S grabs a hold of and tugs at the back of %T's %Tundies!",
					text_receiver = "%S grabs a hold of and tugs at the back of your %Tundies!",
					fn = Func.get("addExcitementMasochistic"),
					visual = "pain",
					sound = 25626,
					requirements = {
						getCondition("targetWearsUnderwear"),
						getCondition("is_spell_add"),
						getCondition("attackerNotLarge"),
						getCondition("attackerHumanoidish")
					}
				}));
				table.insert(R, RPText:new({
					id = "Dazed",
					text_bystander = "%S reaches around from behind and grabs %T's %Tbreasts!",
					text_receiver = "%S reaches around from behind and grabs your %Tbreasts!",
					fn = Func.get("addExcitement"),
					visual = "excitement",
					sound = 25626,
					requirements = {
						getCondition("targetBreasts"),
						getCondition("is_spell_add"),
						getCondition("attackerNotLarge"),
						getCondition("attackerHumanoidish")
					}
				}));
				table.insert(R, RPText:new({
					id = "Dazed",
					text_bystander = "%S grabs a hold of and squeezes your %Tbutt!",
					text_receiver = "%S grabs a hold of and squeezes your %Tbutt!",
					fn = Func.get("addExcitement"),
					visual = "excitement",
					sound = 25626,
					requirements = {
						getCondition("is_spell_add"),
						getCondition("attackerHumanoidish")
					}
				}));
				
				table.insert(R, RPText:new({
					id = "Dazed",
					text_bystander = "%S jabs at %T's %Tbutt!",
					text_receiver = "%S jabs at your %Tbutt!",
					fn = Func.get("addExcitementMasochistic"),
					visual = "pain",
					sound = 37472,
					requirements = {
						getCondition("attackerNotLarge"),
						getCondition("is_spell_add"),
						getCondition("attackerIsFistfighter"),
					}
				}));
				table.insert(R, RPText:new({
					id = "Dazed",
					text_bystander = "%S lashes across %T's %Tbutt!",
					text_receiver = "%S lashes across your %Tbutt!",
					fn = Func.get("addExcitementMasochistic"),
					visual = "pain",
					sound = 37472,
					requirements = {
						getCondition("is_spell_add"),
						getCondition("attackerIsLasher"),
					}
				}));
				table.insert(R, RPText:new({
					id = "Dazed",
					text_bystander = "%S bites %T's %Tbutt!",
					text_receiver = "%S bites your %Tbutt!",
					fn = Func.get("addExcitementMasochisticCrit"),
					visual = "pain",
					sound = 7374,
					requirements = {
						getCondition("attackerNotLarge"),
						getCondition("is_spell_add"),
						getCondition("attackerBeast"),
					}
				}));
				table.insert(R, RPText:new({
					id = "Dazed",
					text_bystander = "%S pinches %T's %Tbutt!",
					text_receiver = "%S pinches your %Tbutt!",
					fn = Func.get("addExcitementMasochisticCrit"),
					visual = "pain",
					sound = 7374,
					requirements = {
						getCondition("attackerNotLarge"),
						getCondition("is_spell_add"),
						getCondition("attackerIsPinchy"),
					}
				}));
				table.insert(R, RPText:new({
					id = "Dazed",
					text_bystander = "%S stings %T's %Tbutt!",
					text_receiver = "%S stings your %Tbutt!",
					fn = Func.get("addExcitementMasochisticCrit"),
					visual = "pain",
					sound = 84366,
					requirements = {
						getCondition("attackerNotLarge"),
						getCondition("is_spell_add"),
						getCondition("attackerIsWasp"),
					}
				}));

				

			-- Shadow Manacles + Willbreaker combo
				table.insert(R, RPText:new({
					id = "Willbreaker",
					sound = 83716,
					text_bystander = "%S makes the shadow manacles spread %T's legs, then throws a punch at %T's exposed %Tgroin!",
					text_receiver = "%S makes the shadow manacles spread your legs, then throws a punch at your exposed %Tgroin!",
					fn = Func.get("addExcitementMasochisticCrit"),
					requirements = {
						getCondition("hasShadowManacles"),
					}
				}));
				table.insert(R, RPText:new({
					id = "Willbreaker",
					sound = 3338,
					text_bystander = "%S makes the shadow manaces bend %T's forward, then throws a forceful slap at %This exposed %Tbutt!",
					text_receiver = "%S makes the shadow manacles bend you forward, then throws a forceful slap at your exposed %Tbutt!",
					fn = Func.get("addExcitementMasochisticCrit"),
					requirements = {
						getCondition("hasShadowManacles"),
					}
				}));
				table.insert(R, RPText:new({
					id = "Willbreaker",
					sound = 32071,
					text_bystander = "%S grabs a hold of the shackled %Trace's %Tundies from the front, forcefully pulling up!",
					text_receiver = "While you're shackled, %S grabs a hold of your %Tundies from the front, forcefully pulling up!",
					fn = Func.get("addExcitementMasochisticCrit"),
					requirements = {
						getCondition("targetWearsUnderwear"),
						getCondition("hasShadowManacles"),
					}
				}));
				table.insert(R, RPText:new({
					id = "Willbreaker",
					sound = 32071,
					text_bystander = "%S grabs a hold of the shackled %Trace's nipples, twisting and pulling!",
					text_receiver = "While you're shackled, %S grabs a hold of your nipples, painfully twisting and pulling!",
					fn = Func.get("addExcitementMasochisticCrit"),
					requirements = {
						getCondition("hasShadowManacles"),
						getCondition("victimBreasts")
					}
				}));
				table.insert(R, RPText:new({
					id = "Willbreaker",
					sound = 36957,
					text_bystander = "The shadow manacles wrap around %T's %Tbreasts painfully tight!",
					text_receiver = "The shadow manacles wrap around your %Tbreasts painfully tight!",
					fn = Func.get("addExcitementMasochisticCrit"),
					requirements = {
						getCondition("hasShadowManacles"),
						getCondition("victimBreasts")
					}
				}));

				table.insert(R, RPText:new({
					id = "Willbreaker",
					sound = 36957,
					text_bystander = "The shadow manacles wrap around %T's %Tgroin painfully tight!",
					text_receiver = "The shadow manacles wrap around your %Tgroin painfully tight!",
					fn = Func.get("addExcitementMasochisticCrit"),
					requirements = {
						getCondition("hasShadowManacles"),
					}
				}));
				table.insert(R, RPText:new({
					id = "Willbreaker",
					sound = 36957,
					text_bystander = "The shadow manacles lashes %T's %Tgroin!",
					text_receiver = "The shadow manacles lashes your %Tgroin!",
					fn = Func.get("addExcitementMasochisticCrit"),
					requirements = {
						getCondition("hasShadowManacles"),
					}
				}));
				table.insert(R, RPText:new({
					id = "Willbreaker",
					sound = 36957,
					text_bystander = "The shadow manacles lashes %T's %Tbutt!",
					text_receiver = "The shadow manacles lashes your %Tbutt!",
					fn = Func.get("addExcitementMasochisticCrit"),
					requirements = {
						getCondition("hasShadowManacles"),
					}
				}));

			-- Kick
				table.insert(R, RPText:new({
					id = "Opportunistic Strike",
					text_bystander = "Seizing an opportunity, %S grabs a hold of and twists %T's %leftright nipple!",
					text_receiver = "Seizing an opportunity, %S grabs a hold of and twists your %leftright nipple!",
					requirements = {getCondition("attackerHumanoidish"), getCondition("victimBreasts"), getCondition("chestLightArmor")},
					visual = "pain",
					fn = Func.get("addExcitementMasochisticCrit")
				}))
				table.insert(R, RPText:new({
					id = "Opportunistic Strike",
					text_bystander = "Seizing an opportunity, %S throws a punch right in %T's %Tgroin!",
					text_receiver = "Seizing an opportunity, %S throws a punch right at your %Tgroin!",
					requirements = {getCondition("attackerHumanoidish")},
					visual = "pain",
					fn = Func.get("addExcitementMasochisticCrit")
				}))
			-- Jab
				table.insert(R, RPText:new({
					id = "Jab",
					text_bystander = "%S jabs at %T's %leftright %Tbreast!",
					text_receiver = "%S jabs at your %leftright %Tbreast!",
					requirements = {getCondition("attackerIsFistfighter"), getCondition("victimBreasts"), getCondition("victimChestNotPlate")},
					visual = "pain",
					fn = Func.get("addExcitementMasochisticCrit")
				}));
				table.insert(R, RPText:new({
					id = "Jab",
					text_bystander = "%S's jab bounces off %T's chestplate!",
					text_receiver = "%S's jab bounces off your chestplate!",
					requirements = {getCondition("attackerIsFistfighter"), getCondition("victimBreasts"), getCondition("victimChestPlate")},
				}));
				table.insert(R, RPText:new({
					id = "Jab",
					text_bystander = "%S jabs from below at %T's %Tgroin!",
					text_receiver = "%S jabs from below at your %Tgroin!",
					visual = "heavyPain",
					requirements = {getCondition("attackerIsFistfighter"), getCondition("victimBreasts"), getCondition("attackerIsSmall"),getCondition("rand30")},
					fn = Func.get("addExcitementMasochisticCrit")
				}));
			-- Wrenching Smack
				table.insert(R, RPText:new({
					id = "Wrenching Smack",
					text_bystander = "%S smacks %T's %Tbreasts with a wrench!",
					text_receiver = "%S painfully smacks your %Tbreasts with a wrench!",
					requirements = {getCondition("attackerNotLarge"), getCondition("victimBreasts"), getCondition("victimChestNotPlate"),getCondition("rand30")},
					visual = "heavyPain",
					fn = Func.get("addExcitementMasochisticCrit")
				}));
				table.insert(R, RPText:new({
					id = "Wrenching Smack",
					text_bystander = "%S smacks %T's chestplate with a wrench!",
					text_receiver = "%S smacks your chestplate with a wrench!",
					requirements = {getCondition("attackerNotLarge"), getCondition("victimBreasts"), getCondition("victimChestPlate"),getCondition("rand30")},
					fn = Func.get("addExcitementMasochisticCrit")
				}));
				table.insert(R, RPText:new({
					id = "Wrenching Smack",
					text_bystander = "%S smacks %T's crotchplate with a wrench!",
					text_receiver = "%S smacks your crotchplate with a wrench!",
					requirements = {getCondition("attackerNotLarge"), getCondition("victimCrotchPlate"),getCondition("rand30")},
					fn = Func.get("addExcitementMasochisticCrit")
				}));

			-- Coin toss
				table.insert(R, RPText:new({
					id = "Coin Toss",
					text_receiver = "A coin slips into your chestpiece, coming to a rest between your %Tbreasts!",
					requirements = {getCondition("hasChest"),getCondition("rand30")},
					fn = Func.get("addExcitement")
				}));
				table.insert(R, RPText:new({
					id = "Coin Toss",
					text_receiver = "A coin slips into your %Tundies, coming to a rest between your %Tbuttcheeks!",
					requirements = {getCondition("targetWearsUnderwear"),getCondition("rand30")},
					fn = Func.get("addExcitement")
				}));
				table.insert(R, RPText:new({
					id = "Coin Toss",
					text_receiver = "A coin slips down your %Tundies, the cold metal tickles your %Tgroin!",
					requirements = {getCondition("targetWearsUnderwear"),getCondition("rand30")},
					fn = Func.get("addExcitement")
				}));
			-- Wild Punch
				table.insert(R, RPText:new({
					id = "Wild Punch",
					text_receiver = "%S's %spell smacks your %leftright %Tbreast around!",
					requirements = {getCondition("victimChestNotPlate"),getCondition("victimBreasts"),getCondition("rand20")},
					visual = "pain",
					fn = Func.get("addExcitementMasochistic")
				}));
				table.insert(R, RPText:new({
					id = "Wild Punch",
					text_receiver = "%S's %spell smacks across your crotchplate!",
					visual = "pain",
					requirements = {getCondition("victimCrotchPlate"),getCondition("rand20")},
					fn = Func.get("addExcitementMasochistic")
				}));
				table.insert(R, RPText:new({
					id = "Wild Punch",
					text_receiver = "%T's %spell smacks across your %Tgroin!",
					visual = "heavyPain",
					requirements = {getCondition("victimCrotchNotPlate"),getCondition("rand20")},
					fn = Func.get("addExcitementMasochisticCrit")
				}));

			-- Icy grip
				table.insert(R, RPText:new({
					id = "Icy Grip",
					text_bystander = "%S charges their fist with cold and grabs a firm hold of %T's %leftright %Tbreast!",
					text_receiver = "%S charges their fist with cold and grabs a firm hold of your %leftright %Tbreast!",
					visual = "frost",
					requirements = {getCondition("is_spell_add"), getCondition("victimBreasts")},
					fn = Func.get("addExcitementMasochistic")
				}));
				table.insert(R, RPText:new({
					id = "Icy Grip",
					text_bystander = "%S charges their fist with cold and grabs a firm hold of %T's %Tgroin!",
					text_receiver = "%S charges their fist with cold and grabs a firm hold of your %Tgroin!",
					visual = "frost",
					requirements = {getCondition("is_spell_add"), },
					fn = Func.get("addExcitementMasochistic")
				}));
				table.insert(R, RPText:new({
					id = "Icy Grip",
					text_bystander = "%S charges their fists with cold and grabs a firm hold of %T's %Tbutt!",
					text_receiver = "%S charges their fists with cold and grabs a firm hold of your %Tbutt!",
					visual = "frost",
					requirements = {getCondition("is_spell_add"), },
					fn = Func.get("addExcitementMasochistic")
				}));
		-- DRUID --

			-- Entangling Roots
			table.insert(R, RPText:new({
				text_bystander = "A vine from %S's roots slips inside %T's clothes and starts tickling against %This %Tbutt!",
				text_receiver = "A vine from the roots slips inside your clothes and starts tickling your %Tbutt!",
				sound = 48289,
				requirements = {
					getCondition("is_spell_add"),
					getCondition("ts_roots")
				},
				visual = "excitement",
				fn = Func.get("addExcitement")
			}))
			table.insert(R, RPText:new({
				text_bystander = "A vine from %S's roots slips inside %T's clothes, targeting %This %Tgroin!",
				text_receiver = "A vine from the roots slips inside your clothes and squeezes your %Tpenis!",
				sound = 48289,
				requirements = {
					getCondition("is_spell_add"), 
					getCondition("victimPenis"),
					getCondition("ts_roots")
				},
				visual = "excitement",
				fn = Func.get("addExcitement")
			}))
			table.insert(R, RPText:new({
				text_bystander = "A vine from %S's roots slips inside %T's clothes, targeting %This %Tgroin!",
				text_receiver = "A vine from the roots slips inside your clothes and up inside your %Tvagina where it wiggles about!",
				sound = 48289,
				requirements = {
					getCondition("is_spell_add"), 
					getCondition("victimVagina"),
					getCondition("ts_roots")
				},
				visual = "heavyExcitement",
				fn = Func.get("addExcitementCrit")
			}))
			table.insert(R, RPText:new({
				text_bystander = "A vine from %S's roots slips inside %T's clothes and wraps around %This %Tbreasts, squeezing them rigorously!",
				text_receiver = "A vine from the roots slips inside your clothes and wraps around your %Tbreasts, squeezing them rigorously!",
				sound = 48289,
				requirements = {
					getCondition("is_spell_add"), 
					getCondition("victimBreasts"),
					getCondition("ts_roots")
				},
				visual = "pain",
				fn = Func.get("addExcitementMasochisticCrit")
			}))
	--


-- CUSTOM TICKING BUFFS/DEBUFFS
	-- Living goo
		table.insert(R, RPText:new({
			id = "FX_OozeInClothesAdd",
			text_receiver = "The goo in your outfit comes to life!",
			sound = 73580,
			requirements = {},
			visual = "greenSplat",
		}))
		table.insert(R, RPText:new({
			id = "FX_OozeInClothesFade",
			text_receiver = "The living goo expires!",
			--sound = 73580,
			requirements = {},
		}))
		table.insert(R, RPText:new({
			id = "FX_OozeInClothesRem",
			text_receiver = "You forcefully remove the living goo from your clothes!",
			sound = 73580,
			requirements = {},
		}))

		table.insert(R, RPText:new({
			id = "FX_OozeInClothesTick",
			text_receiver = "The living goo tickles your %Tbutt!",
			sound = 48289,
			requirements = {},
			visual = "excitement",
			fn = Func.get("addExcitement")
		}))
		table.insert(R, RPText:new({
			id = "FX_OozeInClothesTick",
			text_receiver = "The living goo tickles your %Tvagina!",
			sound = 48289,
			visual = "excitement",
			requirements = {getCondition("victimVagina")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementCrit")
		}))
		table.insert(R, RPText:new({
			id = "FX_OozeInClothesTick",
			text_receiver = "The living goo tickles your %Tpenis!",
			sound = 48289,
			visual = "excitement",
			requirements = {getCondition("victimPenis")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementCrit")
		}))
		table.insert(R, RPText:new({
			id = "FX_OozeInClothesTick",
			text_receiver = "The living goo tickles your clit!",
			sound = 48289,
			visual = "excitement",
			requirements = {getCondition("victimVagina")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementCrit")
		}))
		table.insert(R, RPText:new({
			id = "FX_OozeInClothesTick",
			text_receiver = "The living goo tickles your %leftright nipple!",
			sound = 48289,
			requirements = {getCondition("victimBreasts")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "excitement",
			fn = Func.get("addExcitement")
		}))
		table.insert(R, RPText:new({
			id = "FX_OozeInClothesTick",
			text_receiver = "The living goo wraps around your %Tbreasts, squeezing both!",
			sound = 18711,
			requirements = {getCondition("victimBreasts")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "excitement",
			fn = Func.get("addExcitementMasochistic")
		}))
		table.insert(R, RPText:new({
			id = "FX_OozeInClothesTick",
			text_receiver = "The living goo wraps around your nipples, pulling your %Tbreasts together!",
			sound = 18711,
			requirements = {getCondition("victimBreasts")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "excitement",
			fn = Func.get("addExcitementMasochisticCrit")
		}))
		table.insert(R, RPText:new({
			id = "FX_OozeInClothesTick",
			text_receiver = "The living goo prods inside your %Tvagina, swirling a tendril around!",
			sound = 21727,
			requirements = {getCondition("victimVagina")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "heavyExcitement",
			fn = Func.get("addExcitementCrit")
		}))
		table.insert(R, RPText:new({
			id = "FX_OozeInClothesTick",
			text_receiver = "The living goo prods inside your %Tbutt, swirling a tendril around!",
			sound = 21727,
			requirements = {},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "heavyExcitement",
			fn = Func.get("addExcitementCrit")
		}))

	-- Mossy vine

		table.insert(R, RPText:new({
			text_receiver = "A mossy vine shattered from the %S falls into your cleavage!",
			sound = 21727,
			requirements = {getCondition("is_monster_kill"), getCondition("attackerIsBogshambler"), getCondition("victimBreasts"), getCondition("rand30")},
			fn = function(self)
				Effect.run("MossyVine");
			end
		}))
		table.insert(R, RPText:new({
			id = "FX_MossyVine_tick",
			text_receiver = "The vine wraps around and squeezes your %Tbreasts rigidly!",
			sound = 18711,
			requirements = {},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "excitement",
			fn = Func.get("addExcitementMasochistic")
		}))
		table.insert(R, RPText:new({
			id = "FX_MossyVine_tick",
			text_receiver = "The vine wraps around and tugs at your %leftright nipple!",
			sound = 18711,
			requirements = {},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "pain",
			fn = Func.get("addExcitement")
		}))
		table.insert(R, RPText:new({
			id = "FX_MossyVine_tick",
			text_receiver = "The vine wraps around your nipples, tugging your %Tbreasts together!",
			sound = 18711,
			requirements = {},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			visual = "excitement",
			fn = Func.get("addExcitementMasochistic")
		}))

	--
	-- FX_SlitheringThongAdd
		table.insert(R, RPText:new({
			id = "FX_SlitheringThongAdd",
			text_receiver = "Your slithering thong wiggles to life!",
			sound = 90073,
			visual = "heavyExcitement",
			requirements = {},
		}));

	-- FX_SlitheringThongAdd
		table.insert(R, RPText:new({
			id = "FX_SlitheringThongProc",
			sound = 21727,
			visual = "excitement",
			text_receiver = "The rear of your slithering thong wriggles between your buttcheeks!",
			fn = Func.get("addExcitement")
		}));
		table.insert(R, RPText:new({
			id = "FX_SlitheringThongProc",
			sound = 21727,
			visual = "excitement",
			text_receiver = "Your slithering thong wriggles heavily, tickling your %Tvagina!",
			requirements = {getCondition("victimVagina")},
			fn = Func.get("addExcitement")
		}));
		table.insert(R, RPText:new({
			id = "FX_SlitheringThongProc",
			sound = 21727,
			visual = "excitement",
			text_receiver = "Your slithering wraps around and envelops your %Tpenis, tickling it with its slippery tendrils!",
			requirements = {getCondition("victimPenis")},
			fn = Func.get("addExcitement")
		}));
		table.insert(R, RPText:new({
			id = "FX_SlitheringThongProc",
			sound = 21727,
			visual = "heavyExcitement",
			text_receiver = "Your living thong slithers a tentacle into your %Tbutt, wriggling it around inside!",
			fn = Func.get("addExcitementCrit")
		}));
		table.insert(R, RPText:new({
			id = "FX_SlitheringThongProc",
			sound = 21727,
			visual = "heavyExcitement",
			text_receiver = "Your living thong slithers a thick tentacle into your %Tvagina, wriggling it around inside!",
			fn = Func.get("addExcitementCrit"),
			requirements = {getCondition("victimVagina")},
		}));
		table.insert(R, RPText:new({
			id = "FX_SlitheringThongProc",
			sound = 21727,
			visual = "heavyExcitement",
			text_receiver = "Two tendrils from your slithering thong force their way up into your %Tvagina, swirling around inside!",
			fn = Func.get("addExcitementCrit"),
			requirements = {getCondition("victimVagina")},
		}));
		table.insert(R, RPText:new({
			id = "FX_SlitheringThongProc",
			sound = 21727,
			visual = "excitement",
			text_receiver = "Your slithering thong contracts, wedging up between the lips of your %Tvagina!",
			fn = Func.get("addExcitement"),
			requirements = {getCondition("victimVagina")},
		}));
		

--

-- Voice chats
	
	-- Feltotem bull
		table.insert(R, RPText:new({
			id = "_WHISPER_",
			is_chat = true,
			sound = 48315,
			text_receiver = "%S whispers: Soon you'll be choking on my fel empowered bull cock!",
			requirements = {
				getCondition("attackerIsFeltotem"),
				getCondition("maleWhispers"),					-- User allows whispers from male
			},
		}))
		table.insert(R, RPText:new({
			id = "_WHISPER_",
			is_chat = true,
			sound = 48315,
			text_receiver = "%S whispers: Ever had fel infused bull dick shoved in your %Tvagina? You'll soon find out what that feels like!",
			requirements = {
				getCondition("victimVagina"),
				getCondition("attackerIsFeltotem"),
				getCondition("maleWhispers"),					-- User allows whispers from male
			},
		}))
		table.insert(R, RPText:new({
			id = "_WHISPER_",
			is_chat = true,
			sound = 48315,
			text_receiver = "%S whispers: Ever had fel infused bull dick shoved in your %Tbutt? You'll soon find out what that feels like!",
			requirements = {
				getCondition("victimPenis"),
				getCondition("attackerIsFeltotem"),
				getCondition("maleWhispers"),					-- User allows whispers from male
			},
		}))
		table.insert(R, RPText:new({
			id = "_WHISPER_",
			is_chat = true,
			sound = 48315,
			text_receiver = "%S whispers: Why don't skip directly to the point where I pin you to the ground and pound your %Tbutt relentlessy?",
			requirements = {
				getCondition("victimPenis"),
				getCondition("attackerIsFeltotem"),
				getCondition("maleWhispers"),					-- User allows whispers from male
			},
		}))
		table.insert(R, RPText:new({
			id = "_WHISPER_",
			is_chat = true,
			sound = 48315,
			text_receiver = "%S whispers: Why don't skip directly to the point where I pin you to the ground and pound your %Tvagina relentlessy?",
			requirements = {
				getCondition("victimVagina"),
				getCondition("attackerIsFeltotem"),
				getCondition("maleWhispers"),					-- User allows whispers from male
			},
		}))
		table.insert(R, RPText:new({
			id = "_WHISPER_",
			is_chat = true,
			sound = 48315,
			text_receiver = "%S whispers: Nice %Tbreasts. Can't wait to stick my fel empowered %Spenis between them!",
			requirements = {
				getCondition("victimBreasts"),
				getCondition("attackerIsFeltotem"),
				getCondition("maleWhispers"),					-- User allows whispers from male
			},
		}))
		table.insert(R, RPText:new({
			id = "_WHISPER_",
			is_chat = true,
			sound = 48315,
			text_receiver = "%S whispers: I will have my way with you before handing you to my demon masters!",
			requirements = {
				getCondition("attackerIsFeltotem"),
				getCondition("maleWhispers"),					-- User allows whispers from male
			},
		}))
		

-- Quest triggers
		-- UNDERVINE_1
			table.insert(R, RPText:new({
				id = "BONESLIME_PROC",
				text_receiver = "Warm slime seeps into your %Tundies, lubricating the withered vines!",
				fn = Func.get("addExcitement"),
				requirements = {}
			}));

			table.insert(R, RPText:new({
				id = "QUILLBARB_PROC",
				text_receiver = "The Quill Barb smacks against your %Tgroin before being absorbed by the %Tundies!",
				fn = Func.get("addExcitementMasochisticCrit"),
				requirements = {}
			}));

		-- Q_SLITHERING_THONG_NAGA_FAIL
			table.insert(R, RPText:new({
				id = "Q_SLITHERING_THONG_NAGA_FAIL",
				is_chat = true,
				text_receiver = "%S says: I will never give up the ssecretsss!",
			}));
			table.insert(R, RPText:new({
				id = "Q_SLITHERING_THONG_NAGA_FAIL",
				is_chat = true,
				text_receiver = "%S says: The ssecret sstays with me, ssssuck it landwalker!",
			}));
			table.insert(R, RPText:new({
				id = "Q_SLITHERING_THONG_NAGA_FAIL",
				is_chat = true,
				text_receiver = "%S says: The relic belongsss to my queen!",
			}));
			
		



	return R;
end
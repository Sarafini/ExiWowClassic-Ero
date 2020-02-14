local aName, aTable = ...;
local require = ExiWoW.require

aTable.underwear = function(self)

	local Underwear = require("Underwear");
	local Event = require("Event");
	local Effect = require("Effect");
	local Condition = require("Condition");
	local Database = require("Database");
	local RPText = require("RPText");

	local out = {}
	table.insert(out, Underwear:new({
		id = "MUSHROOM_UNDERWEAR",
		name = "Mushroom Underwear",
		icon = "Inv_misc_herb_ghostmushroomcap",
		description = "Living mushroom underwear that grows to cover your essentials.",
		flavor = "It wiggles!",
		rarity = 4,
		effects = {
			"MUSHROOM_UNDERWEAR"
		},
		tags = {},
	}));

	table.insert(out, Underwear:new({
		id = "WITHERED_VINE_THONG",
		name = "Withered Vine Thong",
		icon = "spell_nature_naturetouchdecay",
		description = "A thong of dying vines. Not very fashionable.",
		--flavor = "It wiggles!",
		rarity = 2,
		tags = {},
	}));

	table.insert(out, Underwear:new({
		id = "EVERLIVING_VINE_THONG",
		name = "Everliving Vine Thong",
		icon = "spell_nature_magicimmunity",
		description = "A thong woven of everliving green vines.",
		flavor = "Favored by druids of Val'sharah!",
		rarity = 4,
		tags = {},
	}));

	table.insert(out, Underwear:new({
		id = "THONG_OF_VALOR",
		name = "Thong of Valor",
		icon = "70_inscription_vantus_rune_odyn",
		description = "A thong adorned with golden borders, with a glowing rune in the front. Arouses the wearer while they are in combat.",
		flavor = "Prove your valor!",
		rarity = 4,
		tags = {},
		on_equip = function(self)
			self:bind(Event.Types.ENTER_COMBAT, function()
				Effect.get("THONG_OF_VALOR"):add();
			end);
			self:bind(Event.Types.EXIT_COMBAT, function()
				Effect.remByID("THONG_OF_VALOR");
			end);
		end
	}));

	-- SLITHERING THONG
	-- /run ExiWoW.ME:addItem("Underwear","SLITHERING_THONG")
	table.insert(out, Underwear:new({
		id = "SLITHERING_THONG",
		name = "Slithering Thong",
		icon = "inv_qiraj_skinsandworm",
		description = "A thong made of slithery tendrils. Submerging it makes it come to life.",
		flavor = "A gift to Azshara from her weary servant.",
		rarity = 4,
		tags = {},
		on_equip = function(self)
			local trigger = function()
				Effect.run("slitheringThong");
			end
			-- Water spells hydrate it
			self:bind(Event.Types.SPELL_RAN, function(data)
				local aura = data.aura;
				local all = Database.getIDs("Spell", aura.name);
				local eventData = RPText.buildSpellData(aura.spellId, aura.name, aura.harmful, data.name);
				for _,sp in pairs(all) do
					eventData.tags = sp:exportTags();
					if Condition.get("ts_slosh"):validate("player", "player", ExiWoW.ME, ExiWoW.ME, eventData) then
						trigger();
					end
				end
			end);
			-- Going into water hydrates it
			self:bind(Event.Types.SUBMERGE, function(data)
				local submerged = data.submerged;
				self:clearTimer("tick");
				if submerged then
					trigger();
					t = self:setTimer("tick", trigger, 5, math.huge);
				end
			end);
		end,
		on_unequip = function(self)
			Effect.remByID("slitheringThong");
		end
	}));
	

	-- This will cause the property to self delete, it's not needed. 
	return out
end
local aName, aTable = ...;
aTable.id = aName;
local frame = CreateFrame("Frame",nil);
frame:RegisterEvent("ADDON_LOADED");
local INI = false

frame:SetScript("OnEvent", function(self, event, prefix, message, channel, sender)
	
	if event == "ADDON_LOADED" then

		
		if ExiWoW and not INI then
			INI = true;
			-- Build the actual libraries
			for i,f in pairs(aTable) do
				if type(f) == "function" then
					aTable[i] = f();
				end
			end
			ExiWoW.require("Extension").import(aTable);
		end

	end
end)



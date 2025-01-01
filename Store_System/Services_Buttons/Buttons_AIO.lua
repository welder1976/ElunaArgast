local AIO = AIO or require("AIO")
if AIO.AddAddon() then
    return
end

local MyHandlers = AIO.AddHandlers("Dropdown_Client", {})



function MyHandlers.DropDownButton(player, DropDown_Button, t)
for k = 1, #DropDown_Button do
    local DropDown_Name, ParentFrame = DropDown_Button[k][1], DropDown_Button[k][2], DropDown_Button[k][3]
	


local WeaponCategory = {
	["Armor"] = {
		["Cloth"] = "Cloth",
        ["Leather"] = "Leather", 
        ["Mail"] = "Mail",   
        ["Plate"] = "Plate",  		
	},
	
	["Axe"] = {
	    ["One-Hand"] = "Axe-One",
		["Two-Hand"] = "Axe-Two",  
	},
	["Sword"] = {
		["One-Hand"] = "Sword-One",
		["Two-Hand"] = "Sword-Two",
	},
	["Mace"] = {
		["One-Hand"] = "Mace-One",
		["Two-Hand"] = "Mace-Two",
	},
	["Dagger"] = {
		["Daggers"] = "Daggers",
	},
	["Staff"] = {
		["Staves"] = "Staves",
	},
	["Fist Weapon"] = {
		["Fists Weapons"] = "Fists-Weapons",
	},
    ["Polearm"] = {
		["Polearm"] = "Polearms",
	},
	["Warglaive"] = {
		["Warglaives"] = "Warglaives",
	},
	["Shield"] = {
		["Shields"] = "Shields",
	},
	["Ranged Weapons"] = {
		["Bow"] = "Bows",
		["Gun"] = "Guns",
		["Crossbow"] = "Crossbows",
		["Wand"] = "Wands",
		["Thrown"] = "Throwns",
	},
	["Relics"] = {
	    ["Idol"] = "Idols",
		["Libram"] = "Librams",
		["Relic"] = "Relics",
		["Totem"] = "Totems",
	}
}


local selectedWeaponCategory = ""


local WeaponCategoryDropDown = CreateFrame("FRAME", "WeaponCategoryDropDown", _G[ParentFrame], "UIDropDownMenuTemplate")
WeaponCategoryDropDown:SetPoint("RIGHT", _G[ParentFrame], "RIGHT", -225, 225)
WeaponCategoryDropDown:SetFrameLevel(400)
WeaponCategoryDropDown:Show()
DropDownNameStart = WeaponCategoryDropDown:CreateFontString("DropDownName", WeaponCategoryDropDown)
DropDownNameStart:SetFont("Fonts\\FRIZQT__.TTF", 11)
DropDownNameStart:SetShadowOffset(1, -1)
DropDownNameStart:SetPoint("CENTER", WeaponCategoryDropDown, "CENTER", 50, 2)
DropDownNameStart:SetText("Select Category:");

-- Create and bind the initialization function to the dropdown menu
UIDropDownMenu_Initialize(WeaponCategoryDropDown, function(self, level, menuList)
	local info = UIDropDownMenu_CreateInfo()

	if (level or 1) == 1 then 
		for CategoryName, _ in pairs(WeaponCategory) do
			info.text = CategoryName
			info.menuList, info.hasArrow = CategoryName, true
			UIDropDownMenu_AddButton(info)
		end
	else 
		info.func = self.SetValue
		for SpecName, DumpName in pairs(WeaponCategory[menuList]) do
			info.text, info.arg1 = SpecName, {DumpName, menuList, SpecName}
			UIDropDownMenu_AddButton(info, level)
		end
	end
end)


function WeaponCategoryDropDown:SetValue(vars, index)
	selectedWeaponCategory = vars[1]
for k, v in ipairs(t)do		
    if ( selectedWeaponCategory == "Cloth" ) then
	    _G[v]:Hide()
		CLOTH_FRAME:Show()
		DPTotal:Hide()
        DPTotal:Show()
	end
	
	if ( selectedWeaponCategory == "Leather" ) then
	    _G[v]:Hide()
		LEATHER_FRAME:Show()
		DPTotal:Hide()
        DPTotal:Show()
	end
	
    if ( selectedWeaponCategory == "Plate" ) then
	    _G[v]:Hide()
		PLATE_FRAME:Show()
		DPTotal:Hide()
        DPTotal:Show()
	end
	
	if ( selectedWeaponCategory == "Mail" ) then
	    _G[v]:Hide()
		MAIL_FRAME:Show()
		DPTotal:Hide()
        DPTotal:Show()
	end
	
	if ( selectedWeaponCategory == "Axe-One" ) then
	   _G[v]:Hide()
		AXE_ONEHAND_FRAME:Show()
		DPTotal:Hide()
        DPTotal:Show()
	end

	if ( selectedWeaponCategory == "Axe-Two" ) then
	    _G[v]:Hide()
		AXE_TWOHAND_FRAME:Show()
		DPTotal:Hide()
        DPTotal:Show()
	end
	
	if ( selectedWeaponCategory == "Sword-One" ) then
	    _G[v]:Hide()
		SWORD_ONEHAND_FRAME:Show()
		DPTotal:Hide()
        DPTotal:Show()
	end
	
	if ( selectedWeaponCategory == "Sword-Two" ) then
	    _G[v]:Hide()
		SWORD_TWOHAND_FRAME:Show()
		DPTotal:Hide()
        DPTotal:Show()
	end
	if ( selectedWeaponCategory == "Mace-One" ) then
	    _G[v]:Hide()
		MACE_ONEHAND_FRAME:Show()
		DPTotal:Hide()
        DPTotal:Show()
	end
	
	if ( selectedWeaponCategory == "Mace-Two" ) then
	   _G[v]:Hide()
		MACE_TWOHAND_FRAME:Show()
		DPTotal:Hide()
        DPTotal:Show()
	end
	
	if ( selectedWeaponCategory == "Daggers" ) then
	    _G[v]:Hide()
		DAGGERS_FRAME:Show()
		DPTotal:Hide()
        DPTotal:Show()
	end
	
	if ( selectedWeaponCategory == "Staves" ) then
	    _G[v]:Hide()
		STAFF_FRAME:Show()
		DPTotal:Hide()
        DPTotal:Show()
	end
	
	if ( selectedWeaponCategory == "Fists-Weapons" ) then
	    _G[v]:Hide()
		FIST_WEAPON_FRAME:Show()
		DPTotal:Hide()
        DPTotal:Show()
	end
	
	if ( selectedWeaponCategory == "Warglaives" ) then
	    _G[v]:Hide()
		WARGLAIVE_FRAME:Show()
		DPTotal:Hide()
        DPTotal:Show()
	end
	
	if ( selectedWeaponCategory == "Shields" ) then
	    _G[v]:Hide()
		SHIELD_FRAME:Show()
		DPTotal:Hide()
        DPTotal:Show()
	end
	
	if ( selectedWeaponCategory == "Polearms" ) then
	    _G[v]:Hide()
		POLEARMS_FRAME:Show()
		DPTotal:Hide()
        DPTotal:Show()
	end
	
	if ( selectedWeaponCategory == "Librams" ) then
	    _G[v]:Hide()
		LIBRAMS_FRAME:Show()
		DPTotal:Hide()
        DPTotal:Show()
	end
	
	if ( selectedWeaponCategory == "Relics" ) then
	    _G[v]:Hide()
		RELICS_FRAME:Show()
		DPTotal:Hide()
        DPTotal:Show()
	end
	
    if ( selectedWeaponCategory == "Idols" ) then
	    _G[v]:Hide()
		IDOLS_FRAME:Show()
		DPTotal:Hide()
        DPTotal:Show()
	end
	
	if ( selectedWeaponCategory == "Totems" ) then
	    _G[v]:Hide()
		TOTEMS_FRAME:Show()
		DPTotal:Hide()
        DPTotal:Show()
	end
	
	if ( selectedWeaponCategory == "Bows" ) then
	    _G[v]:Hide()
		BOWS_FRAME:Show()
		DPTotal:Hide()
        DPTotal:Show()
	end

	if ( selectedWeaponCategory == "Crossbows" ) then
	    _G[v]:Hide()
		CROSSBOWS_FRAME:Show()
		DPTotal:Hide()
        DPTotal:Show()
	end

	if ( selectedWeaponCategory == "Guns" ) then
	    _G[v]:Hide()
		GUNS_FRAME:Show()
		DPTotal:Hide()
        DPTotal:Show()
	end
	
	if ( selectedWeaponCategory == "Wands" ) then
	    _G[v]:Hide()
		WANDS_FRAME:Show()
		DPTotal:Hide()
        DPTotal:Show()
	end
	
	if ( selectedWeaponCategory == "Throwns" ) then
	    _G[v]:Hide()
		THROWNS_FRAME:Show()
		DPTotal:Hide()
        DPTotal:Show()
	end
	

	CloseDropDownMenus()
end
end

function WeaponCategoryDropDown:GetValue()
	return selectedWeaponCategory;
end
end
end
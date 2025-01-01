local AIO = AIO or require("AIO")
if AIO.AddAddon() then
    return
end

local MyHandlers = AIO.AddHandlers("Page_Client", {})



function MyHandlers.PageButton(player, Page_Button)
for k = 1, #Page_Button do
    local Page_ID, Hide_Page, Show_Page, Page_Number, Page_Total, Previous_Button, Previous_Frame = Page_Button[k][1], Page_Button[k][2], Page_Button[k][3], Page_Button[k][4], Page_Button[k][5], Page_Button[k][6], Page_Button[k][7], Page_Button[k][8]

_G["DisabledRight_"..Page_ID] = CreateFrame("Button", Page_ID, _G[Hide_Page])
_G["DisabledRight_"..Page_ID]:SetSize(30, 30)
_G["DisabledRight_"..Page_ID]:SetFrameLevel(700)
_G["DisabledRight_"..Page_ID]:Hide()
_G["DisabledRight_"..Page_ID]:SetPoint("CENTER", Hide_Page, "CENTER", 335, -280)
_G["DisabledRight_"..Page_ID]:SetNormalTexture("Interface/Store_System/UI/Buttons/Store_UI/Store_Buttons/Right_Disabled.blp")

_G["DisabledLeft_"..Page_ID] = CreateFrame("Button", Page_ID, _G[Hide_Page])
_G["DisabledLeft_"..Page_ID]:SetSize(30, 30)
_G["DisabledLeft_"..Page_ID]:SetFrameLevel(700)
_G["DisabledLeft_"..Page_ID]:Hide()
_G["DisabledLeft_"..Page_ID]:SetPoint("CENTER", Hide_Page, "CENTER", 405, -280)
_G["DisabledLeft_"..Page_ID]:SetNormalTexture("Interface/Store_System/UI/Buttons/Store_UI/Store_Buttons/Left_Disabled.blp")
	
_G["PreviousPage_"..Page_ID] = CreateFrame("Button", Page_ID, _G[Hide_Page])
_G["PreviousPage_"..Page_ID]:SetSize(30, 30)
_G["PreviousPage_"..Page_ID]:SetFrameLevel(700)
_G["PreviousPage_"..Page_ID]:SetPoint("CENTER", Hide_Page, "CENTER", 335, -280)
_G["PreviousPage_"..Page_ID]:SetNormalTexture("Interface/Store_System/UI/Buttons/Store_UI/Store_Buttons/Right_Enabled.blp")
_G["PreviousPage_"..Page_ID]:SetHighlightTexture("Interface/Store_System/UI/Buttons/Store_UI/Store_Buttons/Right_Enabled.blp")

if Previous_Button < 1 then
_G["PreviousPage_"..Page_ID]:Hide()
_G["DisabledRight_"..Page_ID]:Show()
else
_G["PreviousPage_"..Page_ID]:Show()
_G["DisabledRight_"..Page_ID]:Hide()
end

_G["PreviousPage_"..Page_ID]:SetScript("OnClick", function()
_G[Hide_Page]:Hide()
_G[Previous_Frame]:Show()
PlaySound("INTERFACESOUND_CHARWINDOWCLOSE", "Master")
end)

_G["NextPage"..Page_ID] = CreateFrame("Button", Page_ID, _G[Hide_Page])
_G["NextPage"..Page_ID]:SetSize(30, 30)
_G["NextPage"..Page_ID]:SetFrameLevel(700)
_G["NextPage"..Page_ID]:SetPoint("CENTER", Hide_Page, "CENTER", 405, -280)
_G["NextPage"..Page_ID]:SetNormalTexture("Interface/Store_System/UI/Buttons/Store_UI/Store_Buttons/Left_Enabled.blp")
_G["NextPage"..Page_ID]:SetHighlightTexture("Interface/Store_System/UI/Buttons/Store_UI/Store_Buttons/Left_Enabled.blp")



_G["NextPage"..Page_ID]:SetScript("OnClick", function()
if Show_Page > tostring(1) then
_G[Hide_Page]:Hide()
_G[Show_Page]:Show()
PlaySound("INTERFACESOUND_CHARWINDOWCLOSE", "Master")
end
end)


PageValue = _G[Hide_Page]:CreateFontString( Page_Number, _G[Hide_Page])
PageValue:SetFont("Fonts\\FRIZQT__.TTF", 13)
PageValue:SetShadowOffset(1, -1)
PageValue:SetPoint("CENTER", _G[Hide_Page], "CENTER", 370, -280)
PageValue:SetText("|cffffffff"..Page_Number.." / "..Page_Total.."|r");

if Previous_Button == 2 then
_G["NextPage"..Page_ID]:Hide()
_G["DisabledLeft_"..Page_ID]:Show()
end

end
end
--[[Store System--
     -- MADE BY BROWLLER--
Discord:Brøwller#8223
Ac-web contact: http://www.ac-web.org/forums/member.php?290215-Rafael-val%E9o

All support in Discord!
   ]]--


local AIO = AIO or require("AIO")
if AIO.AddAddon() then
    return
end
local MyHandlers = AIO.AddHandlers("NAVIGATION_CLIENT", {})


function MyHandlers.NavigationUI(player, Navigation_Button, t, Account_Rank_Check)
  for i = 1, #Navigation_Button do
    local ID, Name, Texture, Coord_Y, FrameShow, Account_Rank = Navigation_Button[i][1], Navigation_Button[i][2], Navigation_Button[i][3], Navigation_Button[i][4], Navigation_Button[i][5], Navigation_Button[i][6]

for n, p in ipairs(t)do

_G[ID] = CreateFrame("Button", Name, _G[p])
_G[ID]:SetSize(265, 65)
_G[ID]:SetFrameLevel(210)
_G[ID]:SetPoint("LEFT",  _G[p], "LEFT", 93, Coord_Y)
_G[ID]:SetNormalTexture("Interface/Store_System/UI/Buttons/Navigation/"..Texture..".blp")
_G[ID]:SetHighlightTexture("Interface/Store_System/UI/Buttons/Navigation/Highlight")

if Account_Rank_Check < Account_Rank then
_G[ID]:Hide()
end

_G[ID]:SetScript("OnClick",
function()
if Account_Rank_Check <= 0 and Account_Rank >= 1 then
AIO.Handle("NAVIGATION_SERVER", "AccountMessage") 	 
PlaySound("INTERFACESOUND_CHARWINDOWTAB", "Master") 
return;
end


if Account_Rank_Check >= 0 and Account_Rank >= 0 then
for k, v in ipairs(t)do
_G[v]:Hide()
_G[FrameShow]:Show()
PlaySound("INTERFACESOUND_CHARWINDOWTAB", "Master")


end
end
end)


NavigationName = _G[ID]:CreateFontString( Name, _G[ID])
NavigationName:SetFont("Fonts\\FRIZQT__.TTF", 14)
NavigationName:SetShadowOffset(1, -1)
NavigationName:SetPoint("CENTER", _G[ID], "CENTER", 5, 0)
NavigationName:SetText("|cffdbe005"..Name.."|r");
end	  
end
end
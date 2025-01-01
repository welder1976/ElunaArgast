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
local MyHandlers = AIO.AddHandlers("CLIENT_FRAMES", {})

-- Store(MainFrame) --
function MyHandlers.FramesUI(player, Frame_Name, t)
  for i = 1, #Frame_Name do
    local Name, Size, Coords_X, Coords_Y, Bg_File, ParentFrame, Frame_Title = Frame_Name[i][1], Frame_Name[i][2], Frame_Name[i][3], Frame_Name[i][4], Frame_Name[i][5], Frame_Name[i][6], Frame_Name[i][7], Frame_Name[i][8]


index = GetCurrentResolution()

local function Donate()
DPTotal:SetPoint("BOTTOMLEFT", _G[Name], "BOTTOMLEFT" , 150, 253)
DPTotal:Show()

VPTotal:SetPoint("BOTTOMLEFT", _G[Name], "BOTTOMLEFT" , 225, 253)
VPTotal:Show()

if index == 9 then
DPTotal:SetPoint("BOTTOMLEFT", _G[Name], "BOTTOMLEFT" , 150, 233)
VPTotal:SetPoint("BOTTOMLEFT", _G[Name], "BOTTOMLEFT" , 225, 233)

VPTotal:Show()
DPTotal:Show()
end
end

ConfirmationFrame = CreateFrame("Frame", "ConfirmationFrame" , UIParent)
ConfirmationFrame:SetFrameLevel(201)
ConfirmationFrame:SetPoint("LEFT", 0, 30)
ConfirmationFrame:Hide()
ConfirmationFrame:SetSize(1100, 1100)

_G[Name] = CreateFrame("Frame", Name , _G[ParentFrame])
_G[Name]:SetFrameLevel(200)
_G[Name]:SetPoint("LEFT", Coords_X, Coords_Y)
_G[Name]:Hide()
_G[Name]:SetSize(Size, Size)
_G[Name]:SetScript("OnHide", 
function()
ConfirmationFrame:Hide()
VPTotal:Hide()
end)

_G[Name]:SetScript("OnShow", 
function()
Donate()
end)



DPTotal = CreateFrame("Button", "DPTotal")
DPTotal:SetSize(20, 20)
DPTotal:Hide()
DPTotal:SetPoint("CENTER", 0, 0)


--DP-- 
	  DPTotal:SetScript("OnEnter", 
	  function(self) 
	  GameTooltip:SetOwner(self,"ANCHOR_RIGHT")
	  GameTooltip:SetPoint("TOPRIGHT", DPTotal,"TOPRIGHT")
      GameTooltip:SetHyperlink("item:"..600003);
	  GameTooltip:Show() 
	  end)
	  
	  
	  DPTotal:SetScript("OnLeave", 
	  function(self) GameTooltip:Hide()
	  end)

	  --Total Donation Title--
DPAmountBTN = CreateFrame("Button", "DPAmountBTN", DPTotal)
DPAmountBTN:SetPoint("CENTER", DPTotal, 0, 0)
DPAmountBTN:SetFrameLevel(300)
DPAmountBTN:SetScript("OnUpdate",
function()
DPText:SetText(""..GetItemCount(600003).."|TInterface/Store_System/UI/Buttons/Navigation/DT:16:16:0:0|t|r")
end)

DPText = DPAmountBTN:CreateFontString("DPText", DPTotal)
DPText:SetFont("Fonts\\FRIZQT__.TTF", 13, "OUTLINE")
DPText:SetPoint("CENTER", DPTotal, 0, 0)
DPText:SetText(""..GetItemCount(600003).."|TInterface/Store_System/UI/Buttons/Navigation/DT:16:16:0:0|t|r")

--VP--
VPTotal = CreateFrame("Button", "DPTotal")
VPTotal:SetSize(20, 20)
VPTotal:Hide()
VPTotal:SetPoint("CENTER", 0, 0)

 VPTotal:SetScript("OnEnter", 
	  function(self) 
	  GameTooltip:SetOwner(self,"ANCHOR_RIGHT")
	  GameTooltip:SetPoint("TOPRIGHT", VPTotal,"TOPRIGHT")
      GameTooltip:SetHyperlink("item:"..600004);
	  GameTooltip:Show() 
	  end)
	  
	  
	  VPTotal:SetScript("OnLeave", 
	  function(self) GameTooltip:Hide()
	  end)

VPAmountBTN = CreateFrame("Button", "VPAmountBTN", VPTotal)
VPAmountBTN:SetPoint("CENTER", VPTotal, 0, 0)
VPAmountBTN:SetFrameLevel(300)
VPAmountBTN:SetScript("OnUpdate",
function()
VPText:SetText(""..GetItemCount(600004).."|TInterface/Store_System/UI/Buttons/Navigation/VT:16:16:0:0|t|r")
end)

VPText = VPAmountBTN:CreateFontString("VPText", VPTotal)
VPText:SetFont("Fonts\\FRIZQT__.TTF", 13, "OUTLINE")
VPText:SetPoint("CENTER", VPTotal, 0, 0)
VPText:SetText(""..GetItemCount(600004).."|TInterface/Store_System/UI/Buttons/Navigation/VT:16:16:0:0|t|r")

 _G[Name]:EnableKeyboard(1);
 _G[Name]:SetScript("OnKeyDown",function(self,key)
	  for k,v in ipairs(t) do
	  if GetBindingFromClick(key)=="TOGGLEGAMEMENU" then
		_G[t[k]]:Hide();
		DPTotal:Hide()
		VPTotal:Hide()
		Model_Frame:Hide()
       PlaySound("STORE_CLOSE", "Master")
	end
	end
end);

	 MainMenuMicroButton:SetScript("OnClick", function()
	 for k,v in ipairs(t) do
      if GameMenuFrame:IsShown() then
	  _G[t[k]]:Hide();
	  DPTotal:Hide()
	  VPTotal:Hide()
	 end
	 end
	 end)



_G[Name]:SetBackdrop(
{
    bgFile = "Interface/Store_System/UI/Frames/"..Bg_File..".blp",
    edgeFile = "",
    edgeSize = 20,
    insets = 
	{ 
	    left = 5, 
	    right = 5, 
	    top = 5, 
	    bottom = -15
	}
})



--Title--
FrameTitle = _G[Name]:CreateFontString("FrameTitle", _G[Name])
FrameTitle:SetFont("Fonts\\FRIZQT__.TTF", 14)
FrameTitle:SetShadowOffset(1, -1)
FrameTitle:SetPoint("TOP", _G[Name], "CENTER", 0, 265)
FrameTitle:SetText(Frame_Title);

--Close Talent--
local CloseFrame = CreateFrame("Button", "close", _G[Name], "UIPanelCloseButton")
CloseFrame:SetSize(30, 30)
CloseFrame:SetFrameLevel(300)
CloseFrame:SetPoint("RIGHT", _G[Name], "RIGHT", -101, 258)
CloseFrame:EnableMouse(true)
CloseFrame:SetScript("OnClick", 
function()
    PlaySound("STORE_CLOSE", "Master")
	_G[Name]:Hide()
	hidden = true
	DPTotal:Hide()
	Model_Frame:Hide()
end)

end
 end


function MyHandlers.showStore(player)
if TRANSMOG_FRAME:IsShown() and TRANSMOG_FRAME:IsVisible() then
   TRANSMOG_FRAME:Hide()
   PlaySound("STORE_CLOSE", "Master")
   else
   TRANSMOG_FRAME:Show()
   PlaySound("STORE_OPEN", "Master")
end
end
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
local MyHandlers = AIO.AddHandlers("SERVICES_CLIENT", {})


function MyHandlers.ServicesUI(player, Service_Button, t, Spell_Known, Own_Item)
for i = 1, #Service_Button do
    local Box_Name, Box_Coord_Y, Box_Coord_X, InsideBox_Name, Tooltip_Name, Tooltip_Type, Tooltip_Text,  ParentFrame, ICON, Service_Price, Service_Function, HyperLink_ID, Service_ID, Model_Type, Creature_DisplayID, Currency_Type, Discount_Price, Discount_Percent, Discount_Color, Flags, Confirmation_ID  = Service_Button[i][1], Service_Button[i][2], Service_Button[i][3], Service_Button[i][4], Service_Button[i][5], Service_Button[i][6], Service_Button[i][7], Service_Button[i][8], Service_Button[i][9], Service_Button[i][10], Service_Button[i][11], Service_Button[i][12], Service_Button[i][13], Service_Button[i][14], Service_Button[i][15], Service_Button[i][16], Service_Button[i][17], Service_Button[i][18], Service_Button[i][19],Service_Button[i][20], Service_Button[i][21]
	


Model_Frame = CreateFrame("Frame", "Model_Frame")
Model_Frame:SetFrameLevel(500)
Model_Frame:Hide()
Model_Frame:SetSize(350, 400)
Model_Frame:SetScript("OnHide", 
function()
PlaySound("INTERFACESOUND_CHARWINDOWCLOSE", "Master")
end)

Model_Frame:SetScript("OnShow", 
function()
PlaySound("INTERFACESOUND_CHARWINDOWOPEN", "Master")
end)

Model_Frame:SetBackdrop(
{
    bgFile = "Interface/Store_System/UI/Frames/Preview_Frame.blp",
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
Model_Title= Model_Frame:CreateFontString("Model_Title", Model_Frame)
Model_Title:SetFont("Fonts\\FRIZQT__.TTF", 14)
Model_Title:SetShadowOffset(1, -1)
Model_Title:SetPoint("TOP", Model_Frame, "CENTER", 0, 185)
Model_Title:SetText("Preview");

--Close Talent--
local Model_Frame_Close = CreateFrame("Button", "close", Model_Frame, "UIPanelCloseButton")
Model_Frame_Close:SetSize(33, 38)
Model_Frame_Close:SetFrameLevel(300)
Model_Frame_Close:SetPoint("RIGHT", Model_Frame, "RIGHT", -49, 177)
Model_Frame_Close:EnableMouse(true)
Model_Frame_Close:SetScript("OnClick", 
function()
    PlaySound("INTERFACESOUND_CHARWINDOWCLOSE", "Master")
	Model_Frame:Hide()
	hidden = true
end)

if(Box_Coord_Y == 0) then BoxCoordY = 80 end
if(Box_Coord_Y == 1) then BoxCoordY = -160 end

if(Box_Coord_X == 0) then BoxCoordX = -130 end
if(Box_Coord_X == 1) then BoxCoordX = 30 end
if(Box_Coord_X == 2) then BoxCoordX = 190 end
if(Box_Coord_X == 3) then BoxCoordX = 350 end
if(Box_Coord_X == 4)then BoxCoordX = -130 end

_G[""..Box_Name.."_"..Confirmation_ID] = CreateFrame("Button", "Confirmation_ID", ConfirmationFrame)
_G[""..Box_Name.."_"..Confirmation_ID]:SetSize(180, 70)
_G[""..Box_Name.."_"..Confirmation_ID]:SetFrameLevel(500)
_G[""..Box_Name.."_"..Confirmation_ID]:SetPoint("CENTER", ConfirmationFrame, "CENTER", 100, -300)
_G[""..Box_Name.."_"..Confirmation_ID]:SetNormalTexture("Interface/Store_System/UI/Buttons/Store_UI/Store_Buttons/Enabled")
_G[""..Box_Name.."_"..Confirmation_ID]:SetHighlightTexture("Interface/Store_System/UI/Buttons/Store_UI/Store_Buttons/Enabled")
_G[""..Box_Name.."_"..Confirmation_ID]:SetPushedTexture("Interface/Store_System/UI/Buttons/Store_UI/Store_Buttons/Enabled_pushed")
_G[""..Box_Name.."_"..Confirmation_ID]:Hide()
_G[""..Box_Name.."_"..Confirmation_ID]:SetScript("OnClick", function()
AIO.Handle("SERVICES_SERVER", Service_Function, Service_ID)
PlaySound("STORE_CONFIRM", "Master")
end)


ButtonText = _G[""..Box_Name.."_"..Confirmation_ID]:CreateFontString("DPText", _G[""..Box_Name.."_"..Confirmation_ID])
ButtonText:SetFont("Fonts\\FRIZQT__.TTF", 13, "OUTLINE")
ButtonText:SetPoint("CENTER", _G[""..Box_Name.."_"..Confirmation_ID], 0, 0)
ButtonText:SetText("Buy Now")


_G[Box_Name] = CreateFrame("Button", Box_Name, _G[ParentFrame])
_G[Box_Name]:SetSize(150, 280)
_G[Box_Name]:SetFrameLevel(200)
_G[Box_Name]:SetPoint("CENTER", ParentFrame, "CENTER", BoxCoordX, BoxCoordY)
_G[Box_Name]:SetNormalTexture("Interface/Store_System/UI/Buttons/Store_UI/Boxes_Background")
_G[Box_Name]:SetHighlightTexture("Interface/Store_System/UI/Buttons/Store_UI/Boxes_Highlight")
_G[Box_Name]:Show()

--Animation
local BoxAnimationFrame = 0
function BoxAnimation(filepath, filename, updateSpeed, maxFrames)

	local BoxAnimation = "animationFrame_"..BoxAnimationFrame
	BoxAnimationFrame = BoxAnimationFrame + 1
	
	animFrame = CreateFrame("Frame", BoxAnimation, ConfirmationFrame, nil)
	animFrame:SetBackdrop({bgFile = filepath..filename..'0'})

	local time = 0
	local frameNumber = 1
	animFrame:SetScript("OnUpdate", function()
		time = time + arg1
		if(time > updateSpeed)then
			frameNumber = frameNumber + 1
			time = 0
			this:SetBackdrop({bgFile = filepath.."\\"..filename..frameNumber})
			
			if(frameNumber == maxFrames)then
				frameNumber = 0
			end
		end

	end)

	return animFrame
end

_G[Box_Name.."Clicked"] = BoxAnimation("interface\\Store_System\\UI\\Buttons\\Store_UI\\Animation\\Effect_1", "Borda", 0.03, 180)
_G[Box_Name.."Clicked"]:SetSize(600, 570)
_G[Box_Name.."Clicked"]:SetFrameLevel(201)
_G[Box_Name.."Clicked"]:SetPoint("CENTER", _G[Box_Name], "CENTER", 0, 0)
_G[Box_Name.."Clicked"]:Hide()


local function Hider()
local HideOPTS = {
ConfirmationFrame:GetChildren()
};

for _, v in ipairs(HideOPTS)do
v:Hide()
end
end

_G[Box_Name]:SetScript("OnClick", function()
if Flags >= 0 then
ConfirmationFrame:Show()
Hider()
_G[""..Box_Name.."_"..Confirmation_ID]:Show()
_G[Box_Name.."Clicked"]:Show()
PlaySound("STORE_BUY", "Master") 
end
end)



model = CreateFrame("DressUpModel", "model", Model_Frame)
model:SetFrameLevel(500)
model:SetPoint("CENTER", Model_Frame, "CENTER", 0, 20)
model:SetSize(250,400)
model:Hide()

model:SetScript("OnShow", function()
model:Undress()
end)

local function ShowModel_Player()
if model:IsVisible()then
return
else
model:SetUnit("player")
model:Show()
model:Undress()
PlaySound("INTERFACESOUND_GAMESCROLLBUTTON", "Master") 
end

Model_Frame:SetPoint("CENTER", _G[ParentFrame], "RIGHT", 19, -95)
Model_Frame:Show()
end



local function ShowModel_Mount()
if model:IsVisible()then
return
else
model:Show()
end
Model_Frame:SetPoint("CENTER", _G[ParentFrame], "RIGHT", 19, -95)
Model_Frame:Show()
PlaySound("INTERFACESOUND_GAMESCROLLBUTTON", "Master") 
end

Model_Frame_Name= Model_Frame:CreateFontString("Model_Frame_Name", Model_Frame)
Model_Frame_Name:SetFont("Fonts\\FRIZQT__.TTF", 14)
Model_Frame_Name:SetShadowOffset(1, -1)
Model_Frame_Name:SetPoint("CENTER", Model_Frame, "Bottom", 10, 75)

local RotateLeftButton = CreateFrame("Button", nil, model)
RotateLeftButton:SetSize(35, 35)
RotateLeftButton:SetFrameLevel(400)
RotateLeftButton:SetPoint("CENTER", model, "Bottom", 0, 13)
RotateLeftButton:SetNormalTexture("Interface/Store_System/UI/Buttons/Store_Ui/ui-rotationleft-button-up.blp")
RotateLeftButton:SetHighlightTexture("Interface/Store_System/UI/Buttons/Store_Ui/ui-common-mousehilight.blp")
RotateLeftButton:SetPushedTexture("Interface/Store_System/UI/Buttons/Store_Ui/ui-rotationleft-button-down.blp")

RotateLeftButton:SetScript("OnMouseDown", function(self, button)    
    PlaySound("igInventoryRotateCharacter");
    RotateLeftButton:SetScript("OnUpdate", function(self, elapsed)     
    model:SetFacing(model:GetFacing() - 0.03);
    end)
end)

RotateLeftButton:SetScript("OnMouseUp", function(self, button)
    self:SetScript("OnUpdate", nil)
end)

local RotateRightButton = CreateFrame("Button", "RotateRightButton", model)
RotateRightButton:SetSize(35, 35)
RotateRightButton:SetFrameLevel(400)
RotateRightButton:SetPoint("CENTER", model, "Bottom", 30, 13)
RotateRightButton:SetNormalTexture("Interface/Store_System/UI/Buttons/Store_Ui/ui-rotationright-button-up.blp")
RotateRightButton:SetHighlightTexture("Interface/Store_System/UI/Buttons/Store_Ui/ui-common-mousehilight.blp")
RotateRightButton:SetPushedTexture("Interface/Store_System/UI/Buttons/Store_Ui/ui-rotationright-button-down.blp")

RotateRightButton:SetScript("OnMouseDown", function(self, button)    
    PlaySound("igInventoryRotateCharacter");
    RotateRightButton:SetScript("OnUpdate", function(self, elapsed)     
    model:SetFacing(model:GetFacing() + 0.03);
    end)
end)

RotateRightButton:SetScript("OnMouseUp", function(self, button)
    self:SetScript("OnUpdate", nil)
end)

_G["Model_"..Box_Name] = CreateFrame("Button", nil, _G[Box_Name])
_G["Model_"..Box_Name]:SetSize(55, 55)
_G["Model_"..Box_Name]:SetFrameLevel(400)
_G["Model_"..Box_Name]:SetPoint("CENTER", _G[Box_Name], "LEFT", 25, 90)
_G["Model_"..Box_Name]:SetNormalTexture("Interface/Store_System/UI/Buttons/Store_Ui/ShowModel_Button.blp")
_G["Model_"..Box_Name]:SetHighlightTexture("Interface/Store_System/UI/Buttons/Store_Ui/ShowModel_Button.blp")
_G["Model_"..Box_Name]:Hide()


_G["Model_"..Box_Name]:SetScript("OnClick", function(self, button)
if Creature_DisplayID < 1 then
model:Hide()
Model_Frame:Hide()
ShowModel_Player()
model:TryOn(HyperLink_ID)
model:Show()
Model_Frame_Name:SetText(InsideBox_Name)
end

if Creature_DisplayID > 1 then
model:Hide()
Model_Frame:Hide()
ShowModel_Mount()
model:SetCreature(Creature_DisplayID)
Model_Frame_Name:SetText(InsideBox_Name)
end
end)

_G["Item_Count_"..Box_Name] = CreateFrame("Button", nil, _G[Box_Name])
_G["Item_Count_"..Box_Name]:SetSize(55, 55)
_G["Item_Count_"..Box_Name]:SetFrameLevel(400)
_G["Item_Count_"..Box_Name]:SetPoint("CENTER", _G[Box_Name], "RIGHT", -25, 90)
_G["Item_Count_"..Box_Name]:SetNormalTexture("Interface/Store_System/UI/Buttons/Store_Ui/Confirm_Item.blp")
_G["Item_Count_"..Box_Name]:SetHighlightTexture("Interface/Store_System/UI/Buttons/Store_Ui/Confirm_Item.blp")
_G["Item_Count_"..Box_Name]:Hide()


_G["Item_Count_"..Box_Name]:SetScript("OnEnter", 
	  function(self) 
	  GameTooltip:SetOwner(self,"ANCHOR_RIGHT")
	  GameTooltip:SetPoint("TOPRIGHT", _G["Item_Count_"..Box_Name],"TOPRIGHT")
      GameTooltip:AddLine("|cffffffffYou already own this item.|r")  --Tooltip InsideBox_Name
	  GameTooltip:Show() 
	  end)
	  
	  _G["Item_Count_"..Box_Name]:SetScript("OnLeave", 
	  function(self) 
	  GameTooltip:Hide() 
	  end)
	  
	  
--IconBehind--
_G[ICON] = CreateFrame("Button", ICON, _G[Box_Name])
_G[ICON]:SetSize(55, 55)
_G[ICON]:SetFrameLevel(198)
_G[ICON]:SetPoint("CENTER", _G[Box_Name], "CENTER", 3, 57)
_G[ICON]:SetNormalTexture("Interface/Icons/"..ICON..".blp")


_G[Box_Name]:SetScript("OnEnter", 
	  function(self) 
	  --Flag == 0 Service, Flag ==  1 Item, Flag ==  2, Sets, Flag == 3 Mounts

	  GameTooltip:SetOwner(self,"ANCHOR_RIGHT")
	  GameTooltip:SetPoint("TOPRIGHT", _G[Box_Name],"TOPRIGHT")
	  
	  if Tooltip_Type and Flags == 0 then  --Service
      GameTooltip:AddLine("|cffffffff"..Tooltip_Name.."|r")  --Tooltip InsideBox_Name
	  GameTooltip:AddLine(Tooltip_Text)  --Tooltip Line 01
	  end
	 
   	  if Tooltip_Type and Flags == 1 or Flags == 3 then     --Item
	  GameTooltip:SetHyperlink(""..Tooltip_Type..":"..HyperLink_ID)
	  GameTooltip:AddLine(Tooltip_Text)  --Tooltip Line 01
	  end
	  
	  if Tooltip_Type and Flags == 2 then     --Sets
	  GameTooltip:AddLine("|cffffffff"..Tooltip_Name.."|r")
	  GameTooltip:AddLine(Tooltip_Text)  --Tooltip Line 01
	  end
	 
	  
	  GameTooltip:Show() 
	  end)
	  
	  _G[Box_Name]:SetScript("OnLeave", 
	  function(self) 
	  GameTooltip:Hide() 
	  end)



_G[Box_Name]:SetScript("OnUpdate", function(self, button)
if Model_Type >= 1 then
_G["Model_"..Box_Name]:Show()
end

if Model_Type < 1 then
_G["Model_"..Box_Name]:Hide()
end
end)

ServiceName = _G[Box_Name]:CreateFontString( InsideBox_Name, _G[Box_Name])
ServiceName:SetFont("Fonts\\FRIZQT__.TTF", 11)
ServiceName:SetShadowOffset(1, -1)
ServiceName:SetPoint("CENTER", _G[Box_Name], "CENTER", 0, -10)
ServiceName:SetText("|cffffffff"..InsideBox_Name.."|r");

ServicePrice = _G[Box_Name]:CreateFontString( InsideBox_Name, _G[Box_Name])
ServicePrice:SetFont("Fonts\\FRIZQT__.TTF", 13)
ServicePrice:SetShadowOffset(1, -1)
ServicePrice:SetPoint("CENTER", _G[Box_Name], "CENTER", 0, -70)
ServicePrice:SetText("|cffdbe005"..Service_Price.."|r");

DPICON = CreateFrame("Button", "DPICON", _G[Box_Name])
DPICON:SetSize(18, 18)
DPICON:SetFrameLevel(201)
DPICON:SetPoint("CENTER", _G[Box_Name], "CENTER", 20, -70)
DPICON:SetNormalTexture("Interface/Store_System/UI/Buttons/Navigation/"..Currency_Type..".blp")

--Discount--
if Discount_Price > 1 then
DiscountPrice = _G[Box_Name]:CreateFontString(InsideBox_Name, ServicePrice)
DiscountPrice:SetFont("Fonts\\FRIZQT__.TTF", 10)
DiscountPrice:SetShadowOffset(1, -1)
DiscountPrice:SetPoint("CENTER", ServicePrice, "CENTER", -20, 0)
DiscountPrice:SetText("|cffdbe005"..Discount_Price.."|r");
ServicePrice:SetText(""..Discount_Color..""..Service_Price.."|r");

--Discount Line--
DiscountTexture = CreateFrame("Button", "Discount_Texture", _G[Box_Name])
DiscountTexture:SetSize(18, 18)
DiscountTexture:SetFrameLevel(202)
DiscountTexture:SetPoint("CENTER", _G[Box_Name], "CENTER", -15, -70)
DiscountTexture:SetNormalTexture("Interface/Store_System/UI/Buttons/Store_UI/Discount.blp")

--Discount Background--
Discount_Background = CreateFrame("Button", nil, _G[Box_Name])
Discount_Background:SetSize(80, 25)
Discount_Background:SetFrameLevel(202)
Discount_Background:SetPoint("CENTER", _G[Box_Name], "RIGHT", -42, 107)
Discount_Background:SetNormalTexture("Interface/Store_System/UI/Buttons/Store_UI/DiscountBackground.blp")

--Save--
SaveTxT = Discount_Background:CreateFontString("SaveTxT", Discount_Background)
SaveTxT:SetFont("Fonts\\FRIZQT__.TTF", 11)
SaveTxT:SetShadowOffset(1, -1)
SaveTxT:SetPoint("CENTER", Discount_Background, "CENTER", 0, 0)
SaveTxT:SetText("|cffffffffYou save "..Discount_Percent.."%|r");

end

end
end



--Purchase Icon and Functions--
PurchaseConfirm = CreateFrame("Button", "PurchaseConfirm", ParentUI)
PurchaseConfirm:SetSize(280, 100)
PurchaseConfirm:SetFrameLevel(250)
PurchaseConfirm:SetAlpha(1)
PurchaseConfirm:Hide()
PurchaseConfirm:SetPoint("CENTER", ParentUI, "CENTER", 0, 340)
PurchaseConfirm:SetNormalTexture("Interface/Store_System/UI/Buttons/Store_UI/PurchasePopUp.blp")





function MyHandlers.showPurchaseIcon(player)
	PurchaseConfirm:Show()
end

function MyHandlers.HidePurchaseIcon(player)
	PurchaseConfirm:Hide()
end

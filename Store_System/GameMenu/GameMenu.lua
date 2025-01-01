--[[Store System--
     -- MADE BY BROWLLER--
Discord:Brøwller#8223
Ac-web contact: http://www.ac-web.org/forums/member.php?290215-Rafael-val%E9o

All support in Discord!
   ]]--


local AIO = AIO or require("AIO") and require("Parent_Tables")
if AIO.AddAddon() then
    return
end
local MyHandlers = AIO.AddHandlers("GameMenu", {})

local StoreGameMenu = CreateFrame("Button", "StoreGameMenu", GameMenuFrame);
      StoreGameMenu:SetPoint("CENTER", GameMenuFrame, 0, 95)
      StoreGameMenu:SetSize(188, 30)
      StoreGameMenu:SetNormalTexture("Interface/Store_System/UI/Buttons/GameMenu/GameMenuButton")
      StoreGameMenu:SetHighlightTexture("Interface/Store_System/UI/Buttons/GameMenu/GameMenuButtonHighLight")
	  StoreGameMenu:SetPushedTexture("Interface/Store_System/UI/Buttons/GameMenu/GameMenuButtonPushed")
	  
	  StoreGameMenu:SetScript("OnClick", function()
      HideUIPanel(GameMenuFrame)
	  AIO.Handle("SERVER_FRAMES", "FramesUI")
	  AIO.Handle("SERVER_FRAMES", "showStore")
	  AIO.Handle("SERVICES_SERVER", "ServicesUI")
	  AIO.Handle("NAVIGATION_SERVER", "NavigationUI")
	  AIO.Handle("SERVICES_SERVER", "ConfirmationButtons")
	  AIO.Handle("SERVER_MODELS", "ModelsUI")	  
      AIO.Handle("Dropdown_Server", "DropDownButton")
      AIO.Handle("Page_Server", "PageButton")
      AIO.Handle("CreatureDisplay", "AddDisplayID")  	  
	  end)
	  
	  StoreGameMenuName = StoreGameMenu:CreateFontString("StoreGameMenuName", StoreGameMenu)
      StoreGameMenuName:SetFont("Fonts\\FRIZQT__.TTF", 13, "OUTLINE")
      StoreGameMenuName:SetShadowOffset(1, -1)
      StoreGameMenuName:SetPoint("CENTER", StoreGameMenu, "CENTER", 0, 2)
      StoreGameMenuName:SetText("|cffdbe005Store");
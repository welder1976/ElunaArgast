--[[Store System--
     -- MADE BY BROWLLER--
Discord:Brøwller#8223
Ac-web contact: http://www.ac-web.org/forums/member.php?290215-Rafael-val%E9o

All support in Discord!
   ]]--


local AIO = AIO or require("AIO")
--[[if AIO.AddAddon() then-- \*Return Client only if addon*/
    return
end]]


local MyHandlers = AIO.AddHandlers("Page_Server", {})


  --Navigation--
function MyHandlers.PageButton(player)
local PageUI = WorldDBQuery("SELECT * FROM store_page_buttons")
  
  if PageUI then 
  
    local Page_Button = {}
    local rowCount = PageUI:GetRowCount()
    repeat
      table.insert(Page_Button, {PageUI:GetString(0), PageUI:GetString(1), PageUI:GetString(2), PageUI:GetFloat(3), PageUI:GetFloat(4),PageUI:GetFloat(5), PageUI:GetString(6)}) 
    until not PageUI:NextRow()
    AIO.Handle(player, "Page_Client", "PageButton", Page_Button)
  end
  end
  
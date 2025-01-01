--[[Store System--
     -- MADE BY BROWLLER--
Discord:Brøwller#8223
Ac-web contact: http://www.ac-web.org/forums/member.php?290215-Rafael-val%E9o

All support in Discord!
   ]]--


local AIO = AIO or require("AIO") and require("Parent_Tables")

local MyHandlers = AIO.AddHandlers("Dropdown_Server", {})


  --Navigation--
function MyHandlers.DropDownButton(player)
local DropDown_UI = WorldDBQuery("SELECT * FROM store_dropbutton")
 local t = GetNavigationFrame() 
 
  if DropDown_UI then 
  
    local DropDown_Button = {}
    local rowCount = DropDown_UI:GetRowCount()
    repeat
      table.insert(DropDown_Button, {DropDown_UI:GetString(0), DropDown_UI:GetString(1)}) 
    until not DropDown_UI:NextRow()
    AIO.Handle(player, "Dropdown_Client", "DropDownButton", DropDown_Button, t)
  end
  end
  
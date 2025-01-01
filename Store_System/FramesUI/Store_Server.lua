--[[Store System--
     -- MADE BY BROWLLER--
Discord:Brøwller#8223
Ac-web contact: http://www.ac-web.org/forums/member.php?290215-Rafael-val%E9o

All support in Discord!
   ]]--


local AIO = AIO or require("AIO") and require("Parent_Tables")
local MyHandlers = AIO.AddHandlers("SERVER_FRAMES", {})


function MyHandlers.Print(player, ...)
    print(...)
end


--LoadAIOButtons--

function MyHandlers.FramesUI(player, t)
local STORE_FRAME = WorldDBQuery("SELECT * FROM store_frames_ui")


 local t = GetNavigationFrame() 

  if STORE_FRAME then 
  
    local Frame_Name = {}
    local rowCount = STORE_FRAME:GetRowCount()
    repeat
      table.insert(Frame_Name, {STORE_FRAME:GetString(0), STORE_FRAME:GetUInt32(1), STORE_FRAME:GetUInt32(2), STORE_FRAME:GetUInt32(3), STORE_FRAME:GetString(4), STORE_FRAME:GetString(5), STORE_FRAME:GetString(6)}) 
    until not STORE_FRAME:NextRow()
    AIO.Handle(player,  "CLIENT_FRAMES", "FramesUI", Frame_Name, t)
  end
  end
     
function MyHandlers.showStore(player)
AIO.Handle(player, "CLIENT_FRAMES", "showStore")
end

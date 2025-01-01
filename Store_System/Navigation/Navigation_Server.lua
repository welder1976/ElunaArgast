--[[Store System--
     -- MADE BY BROWLLER--
Discord:Brøwller#8223
Ac-web contact: http://www.ac-web.org/forums/member.php?290215-Rafael-val%E9o

All support in Discord!
   ]]--


local AIO = AIO or require("AIO") and require("Parent_Tables")


local MyHandlers = AIO.AddHandlers("NAVIGATION_SERVER", {})


function MyHandlers.AccountMessage(player)
local MessageDB = WorldDBQuery("SELECT * FROM store_navigation_ui")
player:SendBroadcastMessage("You need Account rank "..MessageDB:GetUInt32(5).. " to open this layer.")
end


  --Navigation--
function MyHandlers.NavigationUI(player)
local Navigation_UI = WorldDBQuery("SELECT * FROM store_navigation_ui")
local t = GetNavigationFrame()
local Account_Rank_Check = player:GetGMRank()



  if Navigation_UI then 
  
    local Navigation_Button = {}
	
    local rowCount = Navigation_UI:GetRowCount()
    repeat
      table.insert(Navigation_Button, {Navigation_UI:GetUInt32(0), Navigation_UI:GetString(1), Navigation_UI:GetString(2), Navigation_UI:GetFloat(3), Navigation_UI:GetString(4), Navigation_UI:GetUInt32(5)}) 
    until not Navigation_UI:NextRow()
    AIO.Handle(player, "NAVIGATION_CLIENT", "NavigationUI", Navigation_Button, t, Account_Rank_Check) 
  end
  end
  

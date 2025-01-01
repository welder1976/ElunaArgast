--[[Store System--
     -- MADE BY BROWLLER--
Discord:Brøwller#8223
Ac-web contact: http://www.ac-web.org/forums/member.php?290215-Rafael-val%E9o

All support in Discord!
   ]]--


local AIO = AIO or require("AIO") and require("Parent_Tables")


local MyHandlers = AIO.AddHandlers("SERVICES_SERVER", {})


local ServiceCache = {
{},
}

local ItemCache = {
{},
}

local function ConfirmBuy(i, ii, iii, player)
AIO.Handle(player, "SERVICES_CLIENT", "showPurchaseIcon")
end

local function ConfirmBuyHide(i, ii, iii, player)
AIO.Handle(player, "SERVICES_CLIENT", "HidePurchaseIcon")
end

local function  AllRegister(i, ii, iii, player)
            player:RegisterEvent(ConfirmBuy, 0, 1)
			player:RegisterEvent(ConfirmBuyHide, 2000, 1)
end


--Data rewards--
local function ServiceConfig()
    local Squery = WorldDBQuery("SELECT * FROM store_services");
    if(Squery)then
        repeat
            ServiceCache[Squery:GetUInt32(0)] = {
			    Service_ID = Squery:GetUInt32(0),
				Service_Name = Squery:GetString(1),
                Level = Squery:GetUInt32(2),
				Reward_01 = Squery:GetFloat(3),
				Reward_02 = Squery:GetFloat(4),
				Reward_03 = Squery:GetFloat(5),
				Reward_04 = Squery:GetFloat(6),
				Reward_05 = Squery:GetFloat(7),
				Reward_06 = Squery:GetFloat(8),
				Reward_07 = Squery:GetFloat(9),
				Reward_08 = Squery:GetFloat(10),
				Reward_Amount_01 = Squery:GetFloat(11),
				Reward_Amount_02 = Squery:GetFloat(12),
				Reward_Amount_03 = Squery:GetFloat(13),
				Reward_Amount_04 = Squery:GetFloat(14),
				Reward_Amount_05 = Squery:GetFloat(15),
				Reward_Amount_06 = Squery:GetFloat(16),
				Reward_Amount_07 = Squery:GetFloat(17),
				Reward_Amount_08 = Squery:GetFloat(18),
				Title_reward = Squery:GetFloat(19),
				Spell_01 = Squery:GetFloat(20),
				Spell_02 = Squery:GetFloat(21),
				Spell_03 = Squery:GetFloat(22),
				Spell_04 = Squery:GetFloat(23),
				Spell_05 = Squery:GetFloat(24),
				Spell_06 = Squery:GetFloat(25),
				Spell_07 = Squery:GetFloat(26),
				Quests = Squery:GetUInt32(27),
				Service_Price = Squery:GetUInt32(28),
				Flags = Squery:GetUInt32(29),
				Currency_ID = Squery:GetFloat(30)
				
            };
        until not Squery:NextRow()
    end
end

local function ItemConfig()
    local Iquery = WorldDBQuery("SELECT * FROM store_services");
    if(Iquery)then
        repeat
            ItemCache[Iquery:GetUInt32(0)] = {
			    Service_ID = Iquery:GetUInt32(0),
				Reward_01 = Iquery:GetFloat(3),
				Reward_02 = Iquery:GetFloat(4),
				Reward_03 = Iquery:GetFloat(5),
				Reward_04 = Iquery:GetFloat(6),
				Reward_05 = Iquery:GetFloat(7),
				Reward_06 = Iquery:GetFloat(8),
				Reward_07 = Iquery:GetFloat(9),
				Reward_08 = Iquery:GetFloat(10),
				Reward_Amount_01 = Iquery:GetFloat(11),
				Reward_Amount_02 = Iquery:GetFloat(12),
				Reward_Amount_03 = Iquery:GetFloat(13),
				Reward_Amount_04 = Iquery:GetFloat(14),
				Reward_Amount_05 = Iquery:GetFloat(15),
				Reward_Amount_06 = Iquery:GetFloat(16),
				Reward_Amount_07 = Iquery:GetFloat(17),
				Reward_Amount_08 = Iquery:GetFloat(18),
				Service_Price = Iquery:GetUInt32(28),
				Currency_ID = Iquery:GetFloat(30)
            };
        until not Iquery:NextRow()
    end
end

--Confirm Functionality--
function MyHandlers.ServiceRename(player, index)
	if(ServiceCache[index]) then
	    local cache = ServiceCache[index]
		
local CharacterName = CharDBQuery("SELECT * FROM characters WHERE guid= "..player:GetGUIDLow().."")
local name = CharacterName:GetString(2)
local Service_ID = cache["Service_ID"]
local ItemID = cache["Service_Name"]
local comment = "Service "..ItemID.." bought in Ingame Store by character "..name..""
local Price = cache["Service_Price"]
	
	if (not (player:HasItem(cache["Currency_ID"], cache["Service_Price"])))then
	player:SendBroadcastMessage("You do not have enough cash to buy this service!") --Player Message     
	return;
	end
	
    if player:HasItem(cache["Currency_ID"], cache["Service_Price"])then
	        player:RemoveItem(cache["Currency_ID"], cache["Service_Price"])
	        player:SetAtLoginFlag(cache["Flags"])
			player:RegisterEvent(AllRegister, 0, 1)
            player:SendBroadcastMessage("|cff00ca00Purchase successful, please logout to apply it!") --Player Message 

--Save Logs--
WorldDBQuery("INSERT INTO `store_logs` (`charID`, `Username`, `Character`, `Service_ID`, `Item/Spell_ID`,  `Amount_dp_used`, `Comment`) VALUES ('" .. player:GetGUIDLow() .. "','" .. player:GetAccountName() .. "', '" .. name .. "', '" .. Service_ID .. "', '" .. ItemID .. "', '" .. Price .. "', '" .. comment .. "')")

			
   end
  end
 end
 
function MyHandlers.FactionChange(player, index)
	if(ServiceCache[index]) then
	    local cache = ServiceCache[index]
	
local CharacterName = CharDBQuery("SELECT * FROM characters WHERE guid= "..player:GetGUIDLow().."")
local name = CharacterName:GetString(2)
local Service_ID = cache["Service_ID"]
local ItemID = cache["Service_Name"]
local comment = "Service "..ItemID.." bought in Ingame Store by character "..name..""
local Price = cache["Service_Price"]
	
	if (not (player:HasItem(cache["Currency_ID"], cache["Service_Price"])))then
	player:SendBroadcastMessage("You do not have enough cash to buy this service!") --Player Message     
	return;
	end

    if player:HasItem(cache["Currency_ID"], cache["Service_Price"])then
	        player:RemoveItem(cache["Currency_ID"], cache["Service_Price"])
	        player:SetAtLoginFlag(cache["Flags"])
			player:RegisterEvent(AllRegister, 0, 1)
            player:SendBroadcastMessage("|cff00ca00Purchase successful, please logout to apply it!") --Player Message   

--Save Logs--
WorldDBQuery("INSERT INTO `store_logs` (`charID`, `Username`, `Character`, `Service_ID`, `Item/Spell_ID`,  `Amount_dp_used`, `Comment`) VALUES ('" .. player:GetGUIDLow() .. "','" .. player:GetAccountName() .. "', '" .. name .. "', '" .. Service_ID .. "', '" .. ItemID .. "', '" .. Price .. "', '" .. comment .. "')")

			
   end
  end
 end
 
function MyHandlers.RaceChange(player, index)
	if(ServiceCache[index]) then
	    local cache = ServiceCache[index]
		
local CharacterName = CharDBQuery("SELECT * FROM characters WHERE guid= "..player:GetGUIDLow().."")
local name = CharacterName:GetString(2)
local Service_ID = cache["Service_ID"]
local ItemID = cache["Service_Name"]
local comment = "Service "..ItemID.." bought in Ingame Store by character "..name..""
local Price = cache["Service_Price"]
	
	if (not (player:HasItem(cache["Currency_ID"], cache["Service_Price"])))then
	player:SendBroadcastMessage("You do not have enough cash to buy this service!") --Player Message     
	return;
	end
	
    if player:HasItem(cache["Currency_ID"], cache["Service_Price"])then
	        player:RemoveItem(cache["Currency_ID"], cache["Service_Price"])
	        player:SetAtLoginFlag(cache["Flags"])
			player:RegisterEvent(AllRegister, 0, 1)
            player:SendBroadcastMessage("|cff00ca00Purchase successful, please logout to apply it!") --Player Message 
--Save logs--
WorldDBQuery("INSERT INTO `store_logs` (`charID`, `Username`, `Character`, `Service_ID`, `Item/Spell_ID`,  `Amount_dp_used`, `Comment`) VALUES ('" .. player:GetGUIDLow() .. "','" .. player:GetAccountName() .. "', '" .. name .. "', '" .. Service_ID .. "', '" .. ItemID .. "', '" .. Price .. "', '" .. comment .. "')")
			
   end
  end
 end
 
function MyHandlers.Boost(player, index, spell)
	if(ServiceCache[index]) then
	    local cache = ServiceCache[index]
	
	if (not (player:HasItem(cache["Currency_ID"], cache["Service_Price"]))) then
	player:SendBroadcastMessage("You do not have enough cash to buy this service!") --Player Message     
	return;
	end
	
    if player:HasSpell(300001) then
	player:SendBroadcastMessage("You already purchased this service!") --Player Message     
	return;
	end
	
    if player:HasItem(cache["Currency_ID"], cache["Service_Price"]) and not player:HasSpell(300001)then
	        player:RemoveItem(cache["Currency_ID"], cache["Service_Price"])
	        player:SetLevel(cache["Level"])
		    player:LearnSpell(300001)
			player:RegisterEvent(AllRegister, 0, 1)
            player:SendBroadcastMessage("|cff00ca00Purchase successful, your character has been boosted to Level 50!") --Player Message       
   end
  end
 end

function MyHandlers.Mounts(player, index, spell)
	if(ServiceCache[index]) then
	    local cache = ServiceCache[index]
		
local CharacterName = CharDBQuery("SELECT * FROM characters WHERE guid= "..player:GetGUIDLow().."")
local name = CharacterName:GetString(2)
local Service_ID = cache["Service_ID"]
local ItemID = cache["Spell_02"]
local comment = "Mount "..ItemID.." bought in Ingame Store by character "..name..""
local Price = cache["Service_Price"]
local Spell = cache["Spell_02"]

	if (not (player:HasItem(cache["Currency_ID"], cache["Service_Price"])))then
	player:SendBroadcastMessage("You do not have enough cash to buy this mount!") --Player Message     
	return;
	end
	
    if player:HasSpell(cache["Spell_02"])then
	player:SendBroadcastMessage("You already have this mount!") --Player Message     
	return;
	end
	
    if player:HasItem(cache["Currency_ID"], cache["Service_Price"]) and Spell > 0 then
	        player:RemoveItem(cache["Currency_ID"], cache["Service_Price"])
		    player:CastSpell(player, 483, false)
			player:LearnSpell(cache["Spell_02"])	
			player:RegisterEvent(AllRegister, 0, 1) 		
			
--Save Logs--
WorldDBQuery("INSERT INTO `store_logs` (`charID`, `Username`, `Character`, `Service_ID`, `Item/Spell_ID`,  `Amount_dp_used`, `Comment`) VALUES ('" .. player:GetGUIDLow() .. "','" .. player:GetAccountName() .. "', '" .. name .. "', '" .. Service_ID .. "', '" .. ItemID .. "', '" .. Price .. "', '" .. comment .. "')")

			
   end
  end
 end
 
function MyHandlers.ItemsFunction(player, index)
	if(ItemCache[index]) then
	local item_cache = ItemCache[index]
	
local CharacterName = CharDBQuery("SELECT * FROM characters WHERE guid= "..player:GetGUIDLow().."")
local name = CharacterName:GetString(2)
local Service_ID = item_cache["Service_ID"]
local ItemID = item_cache["Reward_01"]
local comment = "Item "..ItemID.." bought in Ingame Store by character "..name..""
local Price = item_cache["Service_Price"]
local PlayerGuid = player:GetGUIDLow()


if (not (player:HasItem(item_cache["Currency_ID"], item_cache["Service_Price"]))) then
	player:SendBroadcastMessage("You do not have enough cash to buy this Item!") --Player Message     
	return;
	end

if player:HasItem(item_cache["Currency_ID"], item_cache["Service_Price"])then
player:RemoveItem(item_cache["Currency_ID"], item_cache["Service_Price"])
SendMail("Ingame Store", "Thanks for your purchase", PlayerGuid , 0, 61, 0, 0, 0, item_cache["Reward_01"], item_cache["Reward_Amount_01"])
player:RegisterEvent(AllRegister, 0, 1)
player:SendBroadcastMessage("|cff00ca00Purchase successful!") --Player Message  ]] 
WorldDBQuery("INSERT INTO `store_logs` (`charID`, `Username`, `Character`, `Service_ID`, `Item/Spell_ID`,  `Amount_dp_used`, `Comment`) VALUES ('" .. player:GetGUIDLow() .. "','" .. player:GetAccountName() .. "', '" .. name .. "', '" .. Service_ID .. "', '" .. ItemID .. "', '" .. Price .. "', '" .. comment .. "')")
end

end
end
 
function MyHandlers.SetsFunction(player, index)
	if(ItemCache[index]) then
	    local item_cache = ItemCache[index]
		
local PlayerGuid = player:GetGUIDLow()
		
if (not (player:HasItem(item_cache["Currency_ID"], item_cache["Service_Price"]))) then
	player:SendBroadcastMessage("You do not have enough cash to buy this Item!") --Player Message     
	return;
	end
	
	
if player:HasItem(item_cache["Currency_ID"], item_cache["Service_Price"])then


			player:RegisterEvent(AllRegister, 0, 1)
            player:SendBroadcastMessage("|cff00ca00Purchase successful!") --Player Message   
			player:RemoveItem(item_cache["Currency_ID"], item_cache["Service_Price"])
			SendMail("Ingame Store", "Thanks for your purchase", PlayerGuid , 0, 61, 0, 0, 0, item_cache["Reward_01"], item_cache["Reward_Amount_01"])
			SendMail("Ingame Store", "Thanks for your purchase", PlayerGuid , 0, 61, 0, 0, 0, item_cache["Reward_02"], item_cache["Reward_Amount_02"])
			SendMail("Ingame Store", "Thanks for your purchase", PlayerGuid , 0, 61, 0, 0, 0, item_cache["Reward_03"], item_cache["Reward_Amount_03"])
			SendMail("Ingame Store", "Thanks for your purchase", PlayerGuid , 0, 61, 0, 0, 0, item_cache["Reward_04"], item_cache["Reward_Amount_04"])
			SendMail("Ingame Store", "Thanks for your purchase", PlayerGuid , 0, 61, 0, 0, 0, item_cache["Reward_05"], item_cache["Reward_Amount_05"])
			SendMail("Ingame Store", "Thanks for your purchase", PlayerGuid , 0, 61, 0, 0, 0, item_cache["Reward_06"], item_cache["Reward_Amount_06"])
			SendMail("Ingame Store", "Thanks for your purchase", PlayerGuid , 0, 61, 0, 0, 0, item_cache["Reward_07"], item_cache["Reward_Amount_07"])
			SendMail("Ingame Store", "Thanks for your purchase", PlayerGuid , 0, 61, 0, 0, 0, item_cache["Reward_08"], item_cache["Reward_Amount_08"])    
   end
  end
 end



  --Navigation--
function MyHandlers.ServicesUI(player)
local Service_UI = WorldDBQuery("SELECT * FROM store_boxes_buttons")

local t = GetNavigationFrame()
local Spell_Known = player:HasSpell(Service_UI:GetFloat(11))
local Own_Item = player:HasItem(Service_UI:GetFloat(11))

    local Service_Button = {}
    local rowCount = Service_UI:GetRowCount()
    repeat
      table.insert(Service_Button, {Service_UI:GetString(0), Service_UI:GetFloat(1), Service_UI:GetFloat(2), Service_UI:GetString(3), Service_UI:GetString(4), Service_UI:GetString(5), Service_UI:GetString(6), Service_UI:GetString(7), Service_UI:GetString(8), Service_UI:GetFloat(9),  Service_UI:GetString(10), Service_UI:GetFloat(11), Service_UI:GetUInt32(12), Service_UI:GetFloat(13), Service_UI:GetFloat(14), Service_UI:GetString(15), Service_UI:GetFloat(16), Service_UI:GetFloat(17), Service_UI:GetString(18), Service_UI:GetFloat(19), Service_UI:GetFloat(20)}) 
    until not Service_UI:NextRow()


    AIO.Handle(player, "SERVICES_CLIENT", "ServicesUI", Service_Button, t, Spell_Known, Own_Item)
  end
    


ServiceConfig()
ItemConfig()
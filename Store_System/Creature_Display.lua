local AIO = AIO or require("AIO")
local MyHandlers = AIO.AddHandlers("CreatureDisplay", {})
function MyHandlers.Print(player, ...)
    print(...)
end


local BoxesButtonsData = {}

function DisplayInfo()
BoxesButtonsData.DisplayID_Table = {};

local Query = WorldDBQuery("SELECT Creature_DisplayID FROM store_boxes_buttons;");
if(Query) then
   repeat
    table.insert(BoxesButtonsData.DisplayID_Table , Query:GetFloat(0))
        until not Query:NextRow()
	end
end

function GetDisplayID_Table()
    return BoxesButtonsData.DisplayID_Table;
end

function MyHandlers.AddDisplayID(player)
local DisplayID = GetDisplayID_Table()

player:SpawnCreature(unpack(DisplayID), player:GetX(), player:GetY(), player:GetY() - 10, 0, 1, 0)
end


DisplayInfo()

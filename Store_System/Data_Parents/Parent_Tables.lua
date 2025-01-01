--[[Store System--
     -- MADE BY BROWLLER--
Discord:Brøwller#8223
Ac-web contact: http://www.ac-web.org/forums/member.php?290215-Rafael-val%E9o

All support in Discord!
   ]]--


local FrameData = {}
local BoxesButtonsData = {}


function FrameData.Load()
    -- Create subtables
    FrameData.NavFrames = {};
    FrameData.HiddenFrames = {};
    
    -- Load frame data
    local Query = WorldDBQuery("SELECT Name FROM store_frames_ui;");
    if(Query) then
        repeat
            table.insert(FrameData.NavFrames, Query:GetString(0))
        until not Query:NextRow()
    end
end

function BoxesButtonsData.Load()
    -- Create subtables
    BoxesButtonsData.BoxName = {};
    
    -- Load frame data
    local Query = WorldDBQuery("SELECT Box_Name FROM store_boxes_buttons;");
    if(Query) then
        repeat
            table.insert(BoxesButtonsData.BoxName, Query:GetString(0))
        until not Query:NextRow()
    end
end

function GetNavigationFrame()
    return FrameData.NavFrames;
end

function GetBoxesName()
    return BoxesButtonsData.BoxName;
end

function HideDropdownFunction()
    return FrameData.HiddenFrames;
end

FrameData.Load() 
BoxesButtonsData.Load()



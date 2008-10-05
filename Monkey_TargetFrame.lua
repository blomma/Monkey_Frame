function Monkey_TargetFrameOnLoad ()

    this:RegisterEvent("UNIT_HEALTH");
	this:RegisterEvent("UNIT_MAXHEALTH");
    this:RegisterEvent("PLAYER_TARGET_CHANGED");

	Init();

end

function Monkey_TargetFrameOnEvent (event)

    if( event == "PLAYER_TARGET_CHANGED" ) then
        Monkey_ShowTargetHealth();
	elseif( event == "UNIT_HEALTH" or event == "UNIT_MAXHEALTH" ) then
        if( arg1 == "target" ) then
            Monkey_ShowTargetHealth();
        end
	end
	
end

function Init()

    Monkey_TargetHealthText:SetTextColor(1, 1, 1);

end

function Monkey_ShowTargetHealth()

    local CurrentHealth = UnitHealth( "target" );
    local MaxHealth = UnitHealthMax( "target" );
    
	local percent = floor( CurrentHealth / MaxHealth * 100 );    
    if( percent >= 75 ) then
        TargetFrameHealthBar:SetStatusBarColor(0, 1, 0);
    elseif( percent >= 50 ) then 
        TargetFrameHealthBar:SetStatusBarColor(1, 1, 0);
    elseif( percent >= 25 ) then 
        TargetFrameHealthBar:SetStatusBarColor(1, 0.5, 0);
    else 
        TargetFrameHealthBar:SetStatusBarColor(1, 0, 0);
    end
    
    if( percent == 0 ) then
        Monkey_TargetHealthText:SetText("");
    else
        Monkey_TargetHealthText:SetText(percent .. "%");
	end
    
end
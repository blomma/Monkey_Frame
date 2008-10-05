function Monkey_PlayerFrameOnLoad ()

    this:RegisterEvent("UNIT_HEALTH");
    this:RegisterEvent("UNIT_HEALTHMAX");
	this:RegisterEvent("UNIT_MANA");
	this:RegisterEvent("UNIT_MANAMAX");
	this:RegisterEvent("PLAYER_ENTERING_WORLD");

	Init();

end

function Monkey_PlayerFrameOnEvent( event )

	if( event == "PLAYER_ENTERING_WORLD" ) then
		Monkey_ShowPlayerHealth();
		Monkey_ShowPlayerMana();
	elseif( event == "UNIT_HEALTH" or event == "UNIT_HEALTHMAX" ) then
        if( arg1 == "player" ) then
            Monkey_ShowPlayerHealth();
        end
	elseif( event == "UNIT_MANA" or event == "UNIT_MANAMAX" ) then
        if( arg1 == "player" ) then
            Monkey_ShowPlayerMana();
        end
	end
	
end

function Init()

    Monkey_PlayerHealthText:SetTextColor(1, 1, 1);
	Monkey_PlayerManaText:SetTextColor(1, 1, 1);

end

function Monkey_ShowPlayerHealth()

    local CurrentHealth = UnitHealth( "player" );
    local MaxHealth = UnitHealthMax( "player" );
    
    Monkey_PlayerHealthText:SetText( CurrentHealth .. " / " .. MaxHealth );
    
	local percent = floor( CurrentHealth / MaxHealth * 100 );    
    if (percent >= 75) then
        PlayerFrameHealthBar:SetStatusBarColor(0, 1, 0);
    elseif (percent >= 50) then 
        PlayerFrameHealthBar:SetStatusBarColor(1, 1, 0);
    elseif (percent >= 25) then 
        PlayerFrameHealthBar:SetStatusBarColor(1, 0.5, 0);
    else 
        PlayerFrameHealthBar:SetStatusBarColor(1, 0, 0);
    end

    Monkey_PlayerHealthPercent:SetText(percent .. "%");
    
end

function Monkey_ShowPlayerMana()

    local CurrentMana = UnitMana( "player" );
    local MaxMana = UnitManaMax( "player" );

	Monkey_PlayerManaText:SetText( CurrentMana .. " / " .. MaxMana );
    	
end
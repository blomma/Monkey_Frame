function Monkey_PetFrameOnLoad ()

    this:RegisterEvent( "UNIT_HEALTH" );
	this:RegisterEvent( "UNIT_MAXHEALTH" );
	this:RegisterEvent( "UNIT_MANA" );
	this:RegisterEvent( "UNIT_MAXMANA" );
	this:RegisterEvent( "PLAYER_ENTERING_WORLD" );
	this:RegisterEvent( "PLAYER_PET_CHANGED" );

	Init();

end

function Monkey_PetFrameOnEvent( event )

	if( event == "PLAYER_ENTERING_WORLD" ) then
        if( UnitExists( "pet" )) then
		    Monkey_ShowPetHealth();
		    Monkey_ShowPetMana();
        end
	elseif( event == "PLAYER_PET_CHANGED" ) then
		Monkey_ShowPetHealth();
		Monkey_ShowPetMana();
	elseif( event == "UNIT_HEALTH" or event == "UNIT_HEALTHMAX" ) then
        if( arg1 == "pet" ) then
            Monkey_ShowPetHealth();
        end
	elseif( event == "UNIT_MANA" or event == "UNIT_MANAMAX" ) then
        if( arg1 == "pet" ) then
            Monkey_ShowPetMana();
        end        
	end
	
end

function Init()

	Monkey_PetHealthText:SetTextColor(1, 1, 1);
	Monkey_PetManaText:SetTextColor(1, 1, 1);

end

function Monkey_ShowPetHealth()

    local CurrentHealth = UnitHealth( "pet" );
    local MaxHealth = UnitHealthMax( "pet" );
    
    Monkey_PetHealthText:SetText( CurrentHealth .. " / " .. MaxHealth );
    
	local percent = floor( CurrentHealth / MaxHealth * 100 );    
    if( percent >= 75 ) then
        PetFrameHealthBar:SetStatusBarColor(0, 1, 0);
    elseif( percent >= 50 ) then 
        PetFrameHealthBar:SetStatusBarColor(1, 1, 0);
    elseif( percent >= 25 ) then 
        PetFrameHealthBar:SetStatusBarColor(1, 0.5, 0);
    else
        PetFrameHealthBar:SetStatusBarColor(1, 0, 0);
    end

    Monkey_PetHealthPercent:SetText( percent .. "%" );
	
end

function Monkey_ShowPetMana()

    local CurrentMana = UnitMana( "pet" );
    local MaxMana = UnitManaMax( "pet" );

	Monkey_PetManaText:SetText( CurrentMana .. " / " .. MaxMana );
    	
	local percent = floor( CurrentMana / MaxMana * 100 );    
    Monkey_PetManaPercent:SetText( percent .. "%" );
	
end
function()
    if UnitAffectingCombat("player") and aura_env.recommended then
        local default = aura_env.targetCount > 1 and aura_env.targetCount or nil
        local fury = UnitPower("player")
        local fel_rush_charges = GetSpellCharges(195072) or 0
        local blade_dance_charges = GetSpellCharges(188499) or 0
        local throw_glaive_stacks = GetSpellCharges(185123) or 0
        local fel_barrage_stacks = select(1, GetSpellCharges(211053)) or 0
        -- Charged abilities
        if aura_env.recommended == 195072
        then return fel_rush_charges .. "/2\n\n\n" .. fury .. "F" end

        if aura_env.recommended == 188499
        then return blade_dance_charges .. "/2\n\n\n" .. fury .. "F" end

        if aura_env.recommended == 211053 then return fel_barrage_stacks .. "/5\n\n\n\n" end

        if aura_env.recommended == 203555
            or aura_env.recommended == 198793
            or aura_env.recommended == 162794
            or aura_env.recommended == 191427
            or aura_env.recommended == 206491
            or aura_env.recommended == 201427
        then return fury .. "F\n\n\n\n" end
        return default
    else
        return "ooc\n\n\n\n"
    end
end

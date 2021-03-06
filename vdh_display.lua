function()
    if UnitAffectingCombat("player") and aura_env.recommended then
        local rec = aura_env.recommended
        local default = ""
        if (aura_env.targetCount > 1) then default = string.format("%.0f", aura_env.targetCount) end

        local soul_fragments = aura_env.soul_fragments()
        local pain = UnitPower("player")
        local infernal_strike_charges = GetSpellCharges(189110)
        local demon_spikes_charges = GetSpellCharges(203720)
        local health_percentage = math.ceil( (UnitHealth("player") / UnitHealthMax("player") * 100) )

        -- Defensives
        if (rec == 207407 and health_percentage <90)
            or (rec == 204021 and health_percentage <90)
            or rec == 187827
            or rec == 196718
        then return health_percentage .. "%%\n\n\n\n" end

        -- Soul Cleave
        if rec == 228477 then
            if health_percentage < 90
            then return health_percentage .. "%%\n\n\n" .. pain .. "P"
            else return pain .. "P\n\n\n\n"  end
        end

        -- Pain generators / Pure spenders
        if rec == 203782
            or rec == 209795
            or rec == 213241
        then return pain .. "P\n\n\n\n" end

        -- Spirit Bomb
        if rec == 218679
        then return soul_fragments .. "/5\n\n\n" .. aura_env.targetCount end

        -- Charged abilities
        if rec == 189110
        then return infernal_strike_charges .. "/2\n\n\n\n" end

        if rec == 203720
        then return demon_spikes_charges .. "/2\n\n\n\n" end

        -- Default if no matches
        return " \n\n\n" .. default
    end
end

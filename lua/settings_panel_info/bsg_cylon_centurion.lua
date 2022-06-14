return {
    name = "[VJ] Cylon Centurion",
    subtree = {
        ["Settings"] = {
            controls = {
                ["Health"] = {
                    default = 1000,
                    convar = "vj_bsg_centurion_health",
                    desc = "Controls the amount of health the Cylon Centurion spawns with."
                },
                ["Bullet Damage Multiplier"] = {
                    default = 1,
                    convar = "vj_bsg_centurion_damage",
                    desc = "Multiplies the Cylon Centurion's bullet damage by X.",
                    panel = {decimals = 2}
                },
                ["Bullet Spread Multiplier"] = {
                    default = 1,
                    convar = "vj_bsg_centurion_accuracy",
                    desc = "Multiplies the Cylon Centurion's bullet spread by X.",
                    panel = {decimals = 2}
                },
                ["Melee Damage Multiplier"] = {
                    default = 1,
                    convar = "vj_bsg_centurion_melee_damage",
                    desc = "Multiplies the Cylon Centurion's melee damage by X.",
                    panel = {decimals = 2}
                },
                ["NPC Incoming Damage Multiplier"] = {
                    default = 1,
                    convar = "vj_bsg_centurion_npc_inc_damage",
                    desc = "Scales the damage the NPC receives from other NPCs by X.",
                    panel = {decimals = 2}
                },
            }
        }
    }
}
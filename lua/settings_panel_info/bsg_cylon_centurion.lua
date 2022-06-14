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
                ["Damage Multiplier"] = {
                    default = 1,
                    convar = "vj_bsg_centurion_damage",
                    desc = "Multiplies the Cylon Centurion's damage by X.",
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
truncus_names = {
    "hyacinthum",
    "viridi",
    "purpura"
}

for i, name in ipairs(truncus_names) do
    minetest.register_node("default:truncus_" .. i, {
        description = "Truncus " .. name,
        drawtype = "plantlike",
        tiles = { "default_truncus_" .. i .. ".png" },
        wield_image = "default_truncus_" .. i .. ".png",
        inventory_image = "default_truncus_" .. i .. ".png",
        paramtype = "light",
        walkable = false,
        groups = { snappy = 3 },
    })
end

pars_names = {
    "ordinarius",
    "insignis",
    "comantem",
    "longus",
    "lenis"
}

for i, name in ipairs(pars_names) do
    minetest.register_node("default:pars_" .. i, {
        description = "Pars " .. name,
        drawtype = "plantlike",
        tiles = { "default_pars_" .. i .. ".png" },
        wield_image = "default_pars_" .. i .. ".png",
        inventory_image = "default_pars_" .. i .. ".png",
        paramtype = "light",
        walkable = false,
        groups = { snappy = 3, attached_node = 1 },
    })
end

for _, name in ipairs({ "rami", "spears", "viriditas" }) do
    minetest.register_node("default:" .. name, {
        description = name:gsub("^%l", string.upper),
        drawtype = "plantlike",
        tiles = { "default_" .. name .. ".png" },
        wield_image = "default_" .. name .. ".png",
        inventory_image = "default_" .. name .. ".png",
        paramtype = "light",
        walkable = false,
        groups = { snappy = 3 }
    })
end

minetest.register_node("default:naga", {
    description = "Naga",
    drawtype = "plantlike",
    tiles = { "default_naga.png" },
    wield_image = "default_naga.png",
    inventory_image = "default_naga.png",
    paramtype = "light",
    walkable = false,
    light_source = 5,
    groups = { snappy = 3, attached_node = 1 }
})

small_mushrooms = {
    ["pusilli"] = {
        damage = 5,
        place_on = {
            "default:cinnabar",
            "default:red_mercury_oxide",
            "default:mercury_oxide"
        },
        optimal_light = 11,
        fill_ratio = 0.01,
        biomes = "default:redland",
    },
    ["rosea"] = {
        damage = 4,
        place_on = "default:copper_sulfate",
        fill_ratio = 0.05,
        biomes = "default:azure",
    },
    ["purpura"] = {
        features = { light_source = 5 },
        place_on = "default:copper_sulfate",
        fill_ratio = 0.05,
        biomes = "default:azure",
    },
    ["picea"] = {
        damage = 9,
        place_on = "default:copper_sulfate",
        fill_ratio = 0.05,
        biomes = "default:azure",
    },
    ["caput"] = {
        damage = 15,
        place_on = {
            "default:cinnabar",
            "default:red_mercury_oxide",
            "default:mercury_oxide"
        },
        optimal_light = 11,
        fill_ratio = 0.01,
        biomes = "default:redland",
    },
    ["periculum"] = {
        features = { light_source = 3 },
        damage = 18,
        place_on = "default:ammonium_manganese_pyrophosphate",
        fill_ratio = 0.01,
        biomes = "default:purple_swamp",
    },
    ["vastatorem"] = { features = { light_source = 8 } },
    ["quercu"] = {
        damage = 7,
        place_on = {
            "default:cinnabar",
            "default:red_mercury_oxide",
            "default:mercury_oxide"
        },
        optimal_light = 11,
        biomes = "default:redland",
    },
    ["grebe"] = {
        damage = 11,
        place_on = "default:ammonium_manganese_pyrophosphate",
        fill_ratio = 0.01,
        biomes = "default:purple_swamp",
    },
    ["secreta"] = {
        damage = 12,
        place_on = "default:ammonium_manganese_pyrophosphate",
        fill_ratio = 0.01,
        biomes = "default:purple_swamp",
    },
    ["pulchram"] = { damage = 3 },
    ["conc"] = { damage = 16 }
}

for name, params in pairs(small_mushrooms) do
    local info = {
        description = name:gsub("^%l", string.upper),
        drawtype = "plantlike",
        tiles = { "default_" .. name .. ".png" },
        wield_image = "default_" .. name .. ".png",
        inventory_image = "default_" .. name .. ".png",
        paramtype = "light",
        walkable = false,
        groups = { snappy = 3, attached_node = 1 },
        on_use = function(itemstack, user, pointed_thing)
            local damage = params.damage or 1
            user:set_hp(user:get_hp() - damage)

            itemstack:set_count(itemstack:get_count() - 1)
            return itemstack
        end
    }

    for key, value in pairs(params.features or {}) do
        info[key] = value
    end

    minetest.register_node("default:" .. name, info)
    minetest.register_abm({
        label = name:gsub("^%l", string.upper) .. " spread",
        nodenames = { "default:" .. name },
        interval = 11,
        chance = 150,
        action = function(pos)
            local positions = minetest.find_nodes_in_area_under_air(
                { x = pos.x - 1, y = pos.y - 2, z = pos.z - 1 },
                { x = pos.x + 1, y = pos.y + 1, z = pos.z + 1 },
                params.place_on
            )

            if #positions == 0 then
                return
            end

            local pos2 = positions[math.random(#positions)]
            pos2.y = pos2.y + 1
            if minetest.get_node_light(pos) <= (params.optimal_light or 7) then
                minetest.set_node(pos2, { name = "default:" .. name })
            end
        end
    })

    if params.place_on and params.fill_ratio and params.biomes then
        minetest.register_decoration({
            deco_type = "simple",
            place_on = params.place_on,
            sidelen = 16,
            fill_ratio = params.fill_ratio,
            biomes = params.biomes,
            decoration = "default:" .. name,
            height = 1
        })
    end
end
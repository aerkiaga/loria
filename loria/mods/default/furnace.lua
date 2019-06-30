gases_list = {
    ["default:oxygen_balloon"] = balloon_coeff * 3
}

fuel_list = {
    ["default:cinnabar"] = 1,
    ["default:potassium"] = 3,
    ["default:potassium_azure"] = 4,
    ["default:potassium_ingot"] = 5,
    ["default:bucket_trisilane"] = 10,
}

crafts = {
    {
        input = {
            { name = "default:mercury_oxide", count = 2 },
            { name = "default:empty_balloon", count = 1 },
            { name = "default:bucket_empty", count = 2 }
        },
        output = {
            { name = "default:oxygen_balloon", count = 1 },
            { name = "default:bucket_mercury", count = 2 }
        },
        time = 3
    },
    {
        input = {
            { name = "default:red_mercury_oxide", count = 2 },
            { name = "default:empty_balloon", count = 1 },
            { name = "default:bucket_empty", count = 2 }
        },
        output = {
            { name = "default:oxygen_balloon", count = 1 },
            { name = "default:bucket_mercury", count = 2 }
        },
        time = 3
    },
    {
        input = {
            { name = "default:copper_sulfate", count = 1 },
            { name = "default:bucket_empty", count = 5 }
        },
        output = {
            { name = "default:copper_sulfate_pure", count = 1 },
            { name = "default:bucket_water", count = 5 }
        },
        time = 5
    },
    {
        input = {
            { name = "default:aluminium", count = 1 }
        },
        output = {
            { name = "default:aluminium_ingot", count = 1 },
            { name = "default:cinnabar", count = 1 }
        },
        time = 3
    },
    {
        input = {
            { name = "default:aluminium_azure", count = 1 }
        },
        output = {
            { name = "default:aluminium_ingot", count = 1 },
            { name = "default:cobalt_blue", count = 1 }
        },
        time = 3
    },
    {
        input = {
            { name = "default:aluminium_ingot", count = 5 }
        },
        output = {
            { name = "default:bucket_empty", count = 1 }
        },
        time = 8
    },
    {
        input = {
            { name = "default:zinc_ingot", count = 4 }
        },
        output = {
            { name = "default:bucket_empty", count = 1 }
        },
        time = 10
    },
    {
        input = {
            { name = "default:aluminium_ingot", count = 3 }
        },
        output = {
            { name = "default:empty_balloon", count = 1 }
        },
        time = 3
    },
    {
        input = {
            { name = "default:aluminium_ingot", count = 1 }
        },
        output = {
            { name = "default:aluminium_case", count = 1 }
        },
        time = 3
    },
    {
        input = {
            { name = "default:mercury_oxide", count = 1 },
            { name = "default:bucket_potassium_hydroxide", count = 1 },
            { name = "default:zinc_ingot", count = 1 },
            { name = "default:aluminium_case", count = 1 }
        },
        output = {
            { name = "default:battery", count = 1 },
            { name = "default:bucket_empty", count = 1 }
        },
        time = 2,
    },
    {
        input = {
            { name = "default:red_mercury_oxide", count = 1 },
            { name = "default:bucket_potassium_hydroxide", count = 1 },
            { name = "default:zinc_ingot", count = 1 },
            { name = "default:aluminium_case", count = 1 }
        },
        output = {
            { name = "default:battery", count = 1 },
            { name = "default:bucket_empty", count = 1 }
        },
        time = 2,
    },
    {
        input = {
            { name = "default:bucket_empty", count = 1 },
            { name = "default:mercury", count = 1 }
        },
        output = {
            { name = "default:bucket_mercury" }
        },
        time = 5,
    },
    {
        input = {
            { name = "default:silicon_dioxide", count = 9 }
        },
        output = {
            { name = "default:fused_quartz" }
        },
        time = 3,
    },
    {
        input = {
            { name = "default:uranium_tetrachloride_ore", count = 1 }
        },
        output = {
            { name = "default:uranium_tetrachloride", count = 1 },
            { name = "default:cinnabar", count = 1 },
        },
        time = 5,
    },
    {
        input = {
            { name = "default:lead_sulfate", count = 1 },
            { name = "default:bucket_empty", count = 1 }
        },
        output = {
            { name = "default:lead_oxide", count = 1 },
            { name = "default:bucket_sulfur_trioxide", count = 1 }
        },
        time = 4,
    },
    {
        input = {
            { name = "default:lead_oxide", count = 1 },
            { name = "default:hydrogen_balloon", count = 1 },
            { name = "default:bucket_empty", count = 1 }
        },
        output = {
            { name = "default:lead", count = 1 },
            { name = "default:empty_balloon", count = 1 },
            { name = "default:bucket_water", count = 1 }
        },
        time = 2,
    },
    {
        input = {
            { name = "default:bucket_potassium_permanganate", count = 2 },
            { name = "default:empty_balloon", count = 1 },
        },
        output = {
            { name = "default:potassium_manganate", count = 1 },
            { name = "default:manganese_dioxide", count = 1 },
            { name = "default:oxygen_balloon", count = 1 },
        },
        time = 2,
    },
    {
        input = {
            { name = "default:manganese_dioxide", count = 1 },
            { name = "default:bucket_empty", count = 1 },
            { name = "default:hydrogen_balloon", count = 1 },
        },
        output = {
            { name = "default:manganese_oxide", count = 1 },
            { name = "default:bucket_water", count = 1 },
            { name = "default:empty_balloon", count = 1 },
        },
        time = 3,
    },
}

for _, name in ipairs(ores) do
    table.insert(crafts, {
        input = {
            { name = "default:" .. name, count = 1 }
        },
        output = {
            { name = "default:" .. name .. "_ingot", count = 1 },
            { name = "default:cinnabar", count = 1 }
        },
        time = 3
    })
    table.insert(crafts, {
        input = {
            { name = "default:" .. name .. "_azure", count = 1 }
        },
        output = {
            { name = "default:" .. name .. "_ingot", count = 1 },
            { name = "default:cobalt_blue", count = 1 }
        },
        time = 3
    })
end

for _, mushroom in ipairs(giant_mushrooms) do
    table.insert(crafts, {
        input = {
            { name = "default:" .. mushroom .. "_body", count = 3 }
        },
        output = {
            { name = "default:silicon_dioxide" }
        },
        time = 5
    })

    table.insert(crafts, {
        input = {
            { name = "default:" .. mushroom .. "_stem", count = 5 }
        },
        output = {
            { name = "default:silicon_dioxide" }
        },
        time = 8
    })
end

function furnace_formspec(conf, craft_percent)
    return
        "size[11,9.5]"..
        "label[4,0.5;Input]"..
        "image[7,2;1,1;gui_arrow.png^[lowpart:"
        .. craft_percent .. ":gui_active_arrow.png]]"..
        "list[context;input;4,1;3,3;]"..
        "label[8,0.5;Output]"..
        "list[context;output;8,1;3,3;]"..
        "list[current_player;main;2,5;8,1;]"..
        "list[current_player;main;2,6.5;8,3;8]"..
        conf.additional_formspec
end

function run_furnace(pos)
    minetest.swap_node(pos, { name = "default:furnace_active" })
    minetest.get_node_timer(pos):start(1)
end

function stop_furnace(conf, pos)
    local meta = minetest.get_meta(pos)

    minetest.swap_node(pos, { name = "default:furnace" })
    minetest.get_node_timer(pos):stop()

    meta:set_string("formspec", furnace_formspec(conf, 0))
    meta:set_float("cooking", 0)
end

function check_and_run_furnace(conf, pos)
    if conf.is_furnace_ready(pos) then
        run_furnace(pos)
    end
end

function check_and_stop_furnace(conf, pos)
    if not conf.is_furnace_ready(pos) then
        stop_furnace(conf, pos)
    end
end

function add_or_drop(inv, listname, stack, pos)
    if inv:room_for_item(listname, stack) then
        inv:add_item(listname, stack)
    else
        minetest.add_item(pos, stack)
    end
end

function furnace_on_timer(conf)
    return (function(pos, elapsed)
        local meta = minetest.get_meta(pos)
        local inv = meta:get_inventory()

        for _, func in ipairs(conf.on_tick) do
            if not func(meta, inv, elapsed) then
                stop_furnace(conf, pos)
                return
            end
        end

        local cooking = meta:get_float("cooking") + elapsed
        local recipe = get_craft(crafts, inv)

        if recipe ~= nil and cooking >= recipe.time then
            cooking = 0
            for _, reagent in ipairs(recipe.input) do
                inv:remove_item("input", reagent)
            end

            for _, result in ipairs(recipe.output) do
                add_or_drop(
                    inv, "output", result,
                    vector.add(pos, vector.new(0, 1, 0))
                )
            end
        end

        if recipe == nil then
            cooking = 0
            meta:set_string("formspec", furnace_formspec(conf, 0))
        else
            meta:set_string("formspec", furnace_formspec(
                conf, math.floor(100 * cooking / recipe.time)
            ))
        end

        meta:set_float("cooking", cooking)

        return true
    end)
end

function construct_furnace(conf)
    return (function(pos)
        local meta = minetest.get_meta(pos)
        meta:set_string("formspec", furnace_formspec(conf, 0))
        meta:set_float("cycle", 0)
        meta:set_float("cooking", 0)

        local inv = meta:get_inventory()

        inv:set_size('input', 9)
        inv:set_size('output', 9)
        for name, size in pairs(conf.lists) do
            inv:set_size(name, size)
        end
    end)
end

function register_furnace(conf)
    minetest.register_node("default:" .. conf.name, {
        description = conf.description,
        tiles = {
            conf.textures.side, conf.textures.side,
            conf.textures.side, conf.textures.side,
            conf.textures.side, conf.textures.front_inactive,
        },

        on_destruct = drop_everything,
        on_construct = construct_furnace(conf),

        paramtype2 = "facedir",
        legacy_facedir_simple = true,
        groups = { cracky = 2 },

        allow_metadata_inventory_put = function(pos, listname, index, stack, player)
            if listname == "output" then
                return 0
            else
                return stack:get_count()
            end
        end,

        on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
            check_and_run_furnace(conf, pos)
        end,
        on_metadata_inventory_put = function(pos, listname, index, stack, player)
            check_and_run_furnace(conf, pos)
        end,
        on_metadata_inventory_take = function(pos, listname, index, stack, player)
            check_and_run_furnace(conf, pos)
        end,
    })

    minetest.register_node("default:" .. conf.name .. "_active", {
        description = conf.description,
        drop = "default:" .. conf.name,
        tiles = {
            conf.textures.side, conf.textures.side,
            conf.textures.side, conf.textures.side,
            conf.textures.side, conf.textures.front_active,
        },

        light_source = conf.light_source,
        paramtype2 = "facedir",
        legacy_facedir_simple = true,
        groups = { cracky = 2 },

        allow_metadata_inventory_put = function(pos, listname, index, stack, player)
            if listname == "output" then
                return 0
            else
                return stack:get_count()
            end
        end,

        allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
            if to_list == "input" then
                return 0
            else
                local meta = minetest.get_meta(pos)
                local inv = meta:get_inventory()
                local stack = inv:get_stack(from_list, from_index)
                return stack:get_count()
            end
        end,

        allow_metadata_inventory_take = function(pos, listname, index, stack, player)
            if listname == "input" then
                return 0
            else
                return stack:get_count()
            end
        end,

        on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
            check_and_stop_furnace(conf, pos)
        end,
        on_metadata_inventory_put = function(pos, listname, index, stack, player)
            check_and_stop_furnace(conf, pos)
        end,
        on_metadata_inventory_take = function(pos, listname, index, stack, player)
            check_and_stop_furnace(conf, pos)
        end,

        on_destruct = drop_everything,
        on_timer = furnace_on_timer(conf),
    })
end

------------------------------
function is_furnace_ready(pos)
    local meta = minetest.get_meta(pos)
    local inv = meta:get_inventory()

    local gas = inv:get_list("gas")[1]:get_name()
    local fuel = inv:get_list("fuel")[1]:get_name()

    return gases_list[gas] ~= nil and fuel_list[fuel] ~= nil
end

function update_gas(meta, inv, elapsed)
    local gas = inv:get_list("gas")[1]
    local wear = gas:get_wear() + gases_list[gas:get_name()]

    if wear >= 65535 then
        inv:set_stack("gas", 1, { name = "default:empty_balloon" })
        return false
    else
        gas:set_wear(wear)
    end
    inv:set_stack("gas", 1, gas)

    return true
end

function update_fuel(meta, inv, elapsed)
    local fuel = inv:get_list("fuel")[1]

    local cycle = meta:get_float("cycle") + elapsed
    local fuel_name = fuel:get_name()
    if cycle > fuel_list[fuel_name] then
        cycle = 0

        local count = fuel:get_count() - 1
        fuel:set_count(count)
        inv:set_stack("fuel", 1, fuel)

        if count == 0 then
            if bucket.is_bucket[fuel_name] then
                add_or_drop(
                    inv, "output",
                    { name = "default:bucket_empty" },
                    vector.add(pos, vector.new(0, 1, 0))
                )
            end
            return false
        end
    end

    meta:set_float("cycle", cycle)
    return true
end

gas_furnace = {
    name = "furnace",
    description = "Gas furnace",
    lists = { gas = 1, fuel = 1 },
    on_tick = { update_fuel, update_gas },
    is_furnace_ready = is_furnace_ready,
    additional_formspec =
        "label[0,1.5;Gas]"..
        "list[context;gas;0,2;1,1;]"..
        "label[2,1.5;Fuel]"..
        "list[context;fuel;2,2;1,1;]",
    textures = {
        side = "default_furnace_side.png",
        front_inactive = "default_furnace_front.png",
        front_active = {
            image = "default_furnace_front_active.png",
            backface_culling = false,
            animation = {
                type = "vertical_frames",
                aspect_w = 16,
                aspect_h = 16,
                length = 1.5
            }
        },
    },
    light_source = 10,
}
register_furnace(gas_furnace)
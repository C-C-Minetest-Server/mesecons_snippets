-- mesecons_snippets/init.lua
-- Execute snippets with Mesecons
-- Copyright (C) 2011-2016 Mesecons Mod Developer Team and contributors
-- Copyright (C) 2024  1F616EMO
-- SPDX-License-Identifier: LGPL-3.0-only

local S = minetest.get_translator("mesecons_snippets")

local function action_on(pos, node)
    local meta = minetest.get_meta(pos)
    local snippet = meta:get_string("snippet")
    if not snippet or snippet == "" then return end

    if snippets.registered_snippets[snippet] then
        snippets.run(snippet, name)
    end
end

minetest.register_node("mesecons_snippets:snippets_block", {
    description = S("Mesecons Snippets Block"),
    tiles = { "mesecons_snippets_block_off.png" },
    is_ground_content = false,
    groups = {dig_immediate = 2, mesecon_effector_off=1, not_in_creative_inventory = 1 },
    on_construct = snippets_buttons.on_construct,
    on_receive_fields = snippets_buttons.on_receive_fields,
    mesecons = {effector = {
		action_on = action_on
	}},
})

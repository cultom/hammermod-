minetest.register_tool("thomod:steel_hammer", {
	 description = "Steel Hammer",
        short_description = "Steel Hammer",
        groups={hard=1, metal=1},
        inventory_image="steel_hammer.png",
        range=8,
        liquids_pointable = false,
        light_source = 3,
        tool_capabilities = {
            full_punch_interval = 1.0,
            max_drop_level = 999,
            groupcaps = {
                -- For example:
                choppy = {times = {[1] = 2.50, [2] = 1.40, [3] = 1.00},uses = 20, maxlevel = 2},
                cracky={times={[1]=4.00, [2]=1.50, [3]=1.00}, uses=70, maxlevel=1},
                crumbly = {times={[2]=3.00, [3]=0.70}, uses=0, maxlevel=1},
                snappy = {times={[3]=0.40}, uses=0, maxlevel=1},
		 oddly_breakable_by_hand = {times={[1]=3.50,[2]=2.00,[3]=0.70}, uses=0}
            },
            damage_groups = {fleshy=1},

        },
  
})


minetest.register_node("thomod:decowood", {
	tiles = {"decowood.png"},
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})

thomas_dig_none = "tupeuxyaller"

function thom_dig(pos, digger) 
	minetest.dig_node(pos)
	--minetest.node_dig(pos, minetest.get_node(pos), digger)
end

minetest.register_on_dignode(
function(pos, oldnode, digger)		

 --TODO  	thomas_dig_none per player 
	if digger == nil or digger:get_wielded_item():get_name()  ~= "thomod:steel_hammer" then
		return
	end

	if thomas_dig_none ~= "tupeuxyaller" then
		return
	end
	
	thomas_dig_none = "kesketufousla"
	
	local posDiff = pos.y - digger:get_pos().y
	if(posDiff < 2 and posDiff > 1) then
		if 
			digger:get_look_horizontal() > math.pi / 4 and digger:get_look_horizontal() < 3 * math.pi / 4 or
			digger:get_look_horizontal() > 5 * math.pi / 4 and digger:get_look_horizontal() < 7 * math.pi / 4 
		then
			pos.y = pos.y -1
			pos.z = pos.z -1
			thom_dig(pos, digger) 

			pos.y = pos.y +1
			thom_dig(pos, digger) 

			pos.y = pos.y +1
			thom_dig(pos, digger) 

			pos.z = pos.z +1
			thom_dig(pos, digger) 
			 
			 pos.z = pos.z +1
			thom_dig(pos, digger) 
			 
			 pos.y = pos.y -1
			thom_dig(pos, digger) 

			pos.y = pos.y -1
			thom_dig(pos, digger) 

			pos.z = pos.z -1
			thom_dig(pos, digger) 
		else
			pos.y = pos.y -1
			pos.x = pos.x -1
			thom_dig(pos, digger) 

			pos.y = pos.y +1
			thom_dig(pos, digger) 

			pos.y = pos.y +1
			thom_dig(pos, digger) 

			pos.x = pos.x +1
			thom_dig(pos, digger) 
			 
			 pos.x = pos.x +1
			thom_dig(pos, digger) 
			 
			 pos.y = pos.y -1
			thom_dig(pos, digger) 

			pos.y = pos.y -1
			thom_dig(pos, digger) 

			pos.x = pos.x -1
			thom_dig(pos, digger) 
		end
	else
		pos.x = pos.x -1
		pos.z = pos.z -1
		thom_dig(pos, digger) 

		pos.x = pos.x +1
		thom_dig(pos, digger) 

		pos.x = pos.x +1
		thom_dig(pos, digger) 

		pos.z = pos.z +1
		thom_dig(pos, digger) 
		 
		 pos.z = pos.z +1
		thom_dig(pos, digger) 
		 
		 pos.x = pos.x -1
		thom_dig(pos, digger) 

		pos.x = pos.x -1
		thom_dig(pos, digger) 

		pos.z = pos.z -1
		thom_dig(pos, digger) 
	
	end
	thomas_dig_none = "tupeuxyaller"
end
)

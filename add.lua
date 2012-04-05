local function add(literal)
   return function(s, v)
	     if v then
		return nil
	     else
		local x = literal[1]
		local y = literal[2]
		local z = literal[3]
		if y:is_const() and z:is_const() then
		   return {y.id + z.id, y.id, z.id}
		elseif x:is_const() and z:is_const() then
		   return {x.id, x.id - z.id, z.id}
		elseif x:is_const() and y:is_const() then
		   return {x.id, y.id, x.id - y.id}
		else
		   return nil
		end
	     end
	  end
end

datalog.add_iter_prim("add", 3, add)

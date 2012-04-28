local function succ(literal)
   return function(s, v)
	     if v then
		return nil
	     else
		local x = literal[1]
		local y = literal[2]
		if y:is_const() then
		   local j = tonumber(y.id)
		   if j and j >= 0 then
		      return {j + 1, j}
		   else
		      return nil
		   end
		elseif x:is_const() then
		   local i = tonumber(x.id)
		   if i and i > 0 then
		      return {i, i - 1}
		   else
		      return nil
		   end
		else
		   return nil
		end
	     end
	  end
end

datalog.add_iter_prim("succ", 2, succ)

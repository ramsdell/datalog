require "datalog"

-- RULES

-- The even and odd rules are:
--
-- even(N) :- N = 0.
-- even(N) :- succ(N, M), odd(M).
-- odd(N) :- succ(N, M), even(M).

-- Convenience functions for making literals used in the rules

function even(n)
   return datalog.make_literal("even", {n})
end

function odd(n)
   return datalog.make_literal("odd", {n})
end

function succ(m, n)
   return datalog.make_literal("succ", {m, n})
end

function eq(m, n)
   return datalog.make_literal("=", {m, n})
end

-- Translation of:
-- even(N) :- N = 0.

function even_base_case()
   local head = even(datalog.make_var("N"))
   local body = {eq(datalog.make_var("N"),
		    datalog.make_const("0"))}
   return datalog.assert(datalog.make_clause(head, body))
end

-- Translation of:
-- even(N) :- succ(N, M), odd(M).

function even_inductive_case()
   local head = even(datalog.make_var("N"))
   local body = {succ(datalog.make_var("N"),
		      datalog.make_var("M")),
		 odd(datalog.make_var("M"))}
   return datalog.assert(datalog.make_clause(head, body))
end

-- Translation of:
-- odd(N) :- succ(N, M), even(M).

function odd_inductive_case()
   local head = odd(datalog.make_var("N"))
   local body = {succ(datalog.make_var("N"),
		      datalog.make_var("M")),
		 even(datalog.make_var("M"))}
   return datalog.assert(datalog.make_clause(head, body))
end

-- Assert the rules

function rules()
   even_base_case()
   even_inductive_case()
   odd_inductive_case()
end

-- The successor relation as a database table

function facts()
   for i = 1,2000 do
      local fact = succ(datalog.make_const(i),
			datalog.make_const(i-1))
      datalog.assert(datalog.make_clause(fact, {}))
   end
end

-- The successor relation as a primitive

function prims()
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
   return datalog.add_iter_prim("succ", 2, succ)
end

-- Load the rules and either the facts or the prims and then ask if
-- 1999 is odd.  The answer is quickly found when the successor
-- relation is implmented as a primitive, but is found slowly when it
-- is a database table.

function ask_odd(n)
   local ans = datalog.ask(odd(datalog.make_const(n)))
   if ans then
      for i = 1,#ans do
	 io.write(ans.name)
	 for j = 1,ans.arity do
	    io.write("\t")
	    io.write(ans[i][j])
	 end
	 io.write("\n")
      end
   end
   return ans
end

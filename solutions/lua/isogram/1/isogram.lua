return function(s)
   local counts = {}
   for m in string.gmatch(s, "%a") do
      local l = string.lower(m)
      if counts[l] then return false end

      counts[l] = true
   end

   return true
end

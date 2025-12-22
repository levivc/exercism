return function(s)
   local counts = {}
   for m in s:lower():gmatch("%l") do
      if counts[m] then return false end

      counts[m] = true
   end

   return true
end

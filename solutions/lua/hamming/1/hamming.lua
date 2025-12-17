local Hamming = {}

function Hamming.compute(a, b)
   assert(#a == #b, "strands must be of equal length")

   local distance = 0
   for i=1, #a do
      if string.byte(a, i) ~= string.byte(b, i) then
         distance = distance + 1
      end
   end

   return distance
end

return Hamming

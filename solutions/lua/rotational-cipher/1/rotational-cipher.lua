return {
   rotate = function(input, key)
      return (string.gsub(input, "[a-zA-Z]", function(c)
         local b = c <= "Z" and 65 or 97
         return string.char((c:byte() - b + key) % 26 + b)
      end))
   end
}

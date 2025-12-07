local leap_year = function(number)
  if number % 400 == 0 then return true end
  if number % 100 == 0 then return false end
  return number % 4 == 0
end

return leap_year

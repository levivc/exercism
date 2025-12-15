local EliudsEggs = {}

function EliudsEggs.egg_count(number)
  local count = 0
  local n = number

  while n ~= 0 do
    n = n & (n - 1)
    count = count + 1
  end

  return count
end

return EliudsEggs

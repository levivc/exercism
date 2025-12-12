local ArmstrongNumbers = {}

function ArmstrongNumbers.is_armstrong_number(number)
  assert(number >= 0)

  local digits = #string.format("%d", number)
  local total = 0
  local n = number

  while (n > 0) do
    total = total + (n % 10)^digits
    n = n // 10
  end

  return number == total
end

return ArmstrongNumbers

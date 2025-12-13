local Darts = {}

function Darts.score(x, y)
  local distsq = x^2 + y^2
  if distsq <= 1 then return 10 end
  if distsq <= 25 then return 5 end
  if distsq <= 100 then return 1 end
  return 0
end

return Darts

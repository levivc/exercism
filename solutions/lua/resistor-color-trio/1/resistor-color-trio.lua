local code = {
  black = 0, brown = 1, red = 2, orange = 3, yellow = 4,
  green = 5, blue = 6, violet = 7, grey = 8, white = 9
}

local units = { "ohms", "kiloohms", "megaohms", "gigaohms" }

local function engi(res)
  local n = math.floor((#tostring(res) - 1) / 3)
  return res / (1000^n), units[n+1]
end

return {
  decode = function(c1, c2, c3)
    local res = (code[c1] * 10 + code[c2]) * 10^code[c3]
    return engi(res)
  end
}

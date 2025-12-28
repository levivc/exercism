local MERCURY_ORBIT = 0.2408467
local VENUS_ORBIT = 0.61519726
local MARS_ORBIT = 1.8808158
local JUPITER_ORBIT = 11.862615
local SATURN_ORBIT = 29.447498
local URANUS_ORBIT = 84.016846
local NEPTUNE_ORBIT = 164.79132

local EARTH_ORBIT_SECS = 31557600

local SpaceAge = {}

local function round(n)
   return math.floor(n * 100 + 0.5) / 100
end

local function earth_years(seconds)
   return seconds / EARTH_ORBIT_SECS
end

function SpaceAge:new(seconds)
   local o = {seconds = seconds}

   function o.on_earth()   return round(earth_years(seconds)) end
   function o.on_mercury() return round(earth_years(seconds) / MERCURY_ORBIT) end
   function o.on_venus()   return round(earth_years(seconds) / VENUS_ORBIT) end
   function o.on_mars()    return round(earth_years(seconds) / MARS_ORBIT) end
   function o.on_jupiter() return round(earth_years(seconds) / JUPITER_ORBIT) end
   function o.on_saturn()  return round(earth_years(seconds) / SATURN_ORBIT) end
   function o.on_uranus()  return round(earth_years(seconds) / URANUS_ORBIT) end
   function o.on_neptune() return round(earth_years(seconds) / NEPTUNE_ORBIT) end

   return o
end

return SpaceAge

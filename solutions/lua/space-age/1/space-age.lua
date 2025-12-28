local MERCURY_ORBIT = 0.2408467
local VENUS_ORBIT = 0.61519726
local MARS_ORBIT = 1.8808158
local JUPITER_ORBIT = 11.862615
local SATURN_ORBIT = 29.447498
local URANUS_ORBIT =	84.016846
local NEPTUNE_ORBIT = 164.79132

local EARTH_ORBIT_SECS = 31557600

local SpaceAge = {}
local instance = {}

function SpaceAge:new(seconds)
   instance.seconds = seconds
   return instance
end

local function round(n)
   return math.floor(n * 100 + 0.5) / 100
end

local function earth_years()
   return instance.seconds / EARTH_ORBIT_SECS
end

function instance.on_earth()
   return round(earth_years())
end

function instance.on_mercury()
   return round(earth_years() * 1/MERCURY_ORBIT)
end

function instance.on_venus()
   return round(earth_years() * 1/VENUS_ORBIT)
end

function instance.on_mars()
   return round(earth_years() * 1/MARS_ORBIT)
end

function instance.on_jupiter()
   return round(earth_years() * 1/JUPITER_ORBIT)
end

function instance.on_saturn()
   return round(earth_years() * 1/SATURN_ORBIT)
end

function instance.on_uranus()
   return round(earth_years() * 1/URANUS_ORBIT)
end

function instance.on_neptune()
   return round(earth_years() * 1/NEPTUNE_ORBIT)
end

return SpaceAge

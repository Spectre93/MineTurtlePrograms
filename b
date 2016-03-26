--FOR DIGGING BONESPIKES

local args = {...}

if(#args~=1) then
  print("Usage: <amount of side spikes>")
  return
end

print("test")
local hoogte = tonumber(args[1])

function mineUp(a)
  for i=1,a do
    turtle.dig()
    turtle.up()
  end
end

function mineDigUp(a)
  turtle.dig()
  turtle.forward()
  
  for i=1,a do
    turtle.dig()
    turtle.digUp()
    turtle.up()
  end
  
  turtle.dig()
end

function mineDigDown(a)
  turtle.dig()
  turtle.forward()
  
  for i=1,a do
    turtle.dig()
    turtle.digDown()
    turtle.down()
  end
  
  turtle.dig()
end

for i=1,hoogte*2-1 do
  turtle.up()
end
mineDigDown(hoogte*2-1)
turtle.forward()
mineUp(hoogte*2+1)
turtle.down()
turtle.down()
turtle.forward()
mineDigDown(hoogte*2-1)

turtle.turnRight()
turtle.turnRight()
turtle.forward()
turtle.turnLeft()

mineDigUp(hoogte*2-1)
turtle.turnLeft()
turtle.turnLeft()
turtle.forward()
mineDigDown(hoogte*2-1)

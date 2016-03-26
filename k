--STRIP MINING

local args = {...}

if #args ~= 2 then
  print("Usage: myTunnel <length> <width>")
  return
end

local length = tonumber(args[1])
local width = tonumber(args[2])
turtle.digUp()

for j=1,width do
  for i=1,length do
    turtle.dig()
    turtle.forward()
    turtle.digUp()
  end

  if(j ~= width) then  
    if(j%2==0) then
      turtle.turnLeft()
      turtle.dig()
      turtle.forward()
      turtle.digUp()
      turtle.dig()
      turtle.forward()
      turtle.digUp()
      turtle.turnLeft()
    else
      turtle.turnRight()
      turtle.dig()
      turtle.forward()
      turtle.digUp()
      turtle.dig()
      turtle.forward()
      turtle.digUp()
      turtle.turnRight()
    end
  end
end

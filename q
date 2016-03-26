--DIGGING OUT ENTIRE ROOMS

local args = {...}

local hoogte = tonumber(args[1])
local breedte = tonumber(args[2])
local diepte = tonumber(args[3])

if(#args ~= 3) then
  print("Usage: <h> <b> <d>")
  return
end

function forward()
  while(turtle.forward()==false) do
    turtle.dig()
    sleep(0,25)
  end
end

function digUp()
  while(turtle.detectUp()) do
    turtle.digUp()   
  end
end

function digLine(a)
  for i=1,a-1 do
    forward()
  end
end

function digFloor(a,b)
  for i=1,b do
    digLine(a)
    
    if(i==b) then return end
    if(i%2==0) then
      turtle.turnLeft()
      forward()
      turtle.turnLeft()
    else
      turtle.turnRight()
      forward()      
      turtle.turnRight()
    end
  end
end

forward()

for i=1,hoogte do
  digFloor(diepte,breedte)
  if(i~=hoogte) then
    digUp()
    turtle.up()
    
    if(diepte==1 and breedte==1) then
      return
    end
    
    turtle.turnRight()
    
    if(breedte%2==0) then
      local temp = breedte
      breedte = diepte
      diepte = temp
    else
      turtle.turnRight()
    end  
  end
end    

for i=1,hoogte do
  turtle.down()
end

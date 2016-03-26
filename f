--REPLACING FLOORS

local args = {...}

local breedte = tonumber(args[1])
local diepte = tonumber(args[2])

if(#args ~= 2) then
  print("Usage: <b> <d>")
  return
end

turtle.select(1)

function forward()
  while(turtle.forward()==false) do
    turtle.dig()
  end
end

function digDown()
  while(turtle.detectDown()) do
    turtle.digDown()   
  end
end

function placeDown()
  turtle.placeDown()
  if(turtle.getItemCount()==0 and turtle.getSelectedSlot() ~= 16) then
    turtle.select(turtle.getSelectedSlot()+1)
  else
	return
  end
end

for i=1,breedte do
  for j=1,diepte do
    digDown()
    placeDown()
	if(j ~=diepte) then
	  forward()
	end
  end
  if(i==breedte) then return end
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
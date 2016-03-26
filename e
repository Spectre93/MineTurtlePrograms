--REPLACING CEILINGS

local args = {...}

local breedte = tonumber(args[1])
local diepte = tonumber(args[2])

if(#args ~= 2) then
  print("Usage: <b> <d>")
  return
end

turtle.select(1)

function digUp()
  while(turtle.detectUp()) do
    turtle.digUp()   
  end
end

function placeUp()
  turtle.placeUp()
  if(turtle.getItemCount()==0 and turtle.getSelectedSlot() ~= 16) then
    turtle.select(turtle.getSelectedSlot()+1)
  else
	return
  end
end

for i=1,breedte do
  for j=1,diepte do
    digUp()
    placeUp()
	if(j ~=diepte) then
	  turtle.forward()
	end
  end
  if(i==breedte) then return end
  if(i%2==0) then
	turtle.turnLeft()
	turtle.forward()
	turtle.turnLeft()
  else
	turtle.turnRight()
	turtle.forward()      
	turtle.turnRight()
  end
end
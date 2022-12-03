local vals = {
	A = 1,
	B = 2,
	C = 3,
	X = 1,
	Y = 2,
	Z = 3
}

local map = {
	A = "rock",
	B = "paper",
	C = "scissors",
	X = "rock",
	Y = "paper",
	Z = "scissors"
}

local wins = {
	A = "Y",
	B = "Z",
	C = "X"
}

local losses = {
	A = "Z",
	B = "X",
	C = "Y"
}


local points = 0
local altpoints = 0
for line in io.stdin:lines() do
	local left, right = line:match("(%a) (%a)")
	points = points + vals[right]
	if vals[left] == vals[right] then
		points = points + 3
	elseif wins[left] == right then
		points = points + 6
	end
	if right == "X" then
		altpoints = altpoints + vals[losses[left]]
	elseif right == "Y" then
		altpoints = altpoints + vals[left] + 3
	else
		altpoints = altpoints + vals[wins[left]] + 6
	end
end

print(points)
print(altpoints)
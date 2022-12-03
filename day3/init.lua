local priorities do
	local a, A = string.byte("aA", 1, 2)
	local left, right = "", ""
	for i=0, 25 do
		left = left .. string.char(a+i)
		right = right .. string.char(A+i)
	end
	priorities = left .. right
	print(priorities)
end

local sum = 0
local badge_sum = 0
local buffer = {}


local function check_badges()
	table.sort(buffer, function(a, b) return #a < #b end)
	local longest = buffer[3]
	local checked = ""
	for i=1, #longest do
		local item = longest:sub(i,i)
		if not checked:find(item, 1, true) and buffer[1]:find(item, 1, true) and buffer[2]:find(item, 1, true) then
			badge_sum = badge_sum + priorities:find(item, 1, true)
			buffer = {}
			return
		else
			checked = checked .. item
		end
	end
	error("failed!")
end

for line in io.stdin:lines() do
	local len = #line
	local left, right = line:sub(1, len//2), line:sub((len//2)+1)
	local checked = ""
	for i=1, len//2 do
		local item = left:sub(i,i)
		print("item", item)
		if not checked:find(item, 1, true) and right:find(item, 1, true) then
			checked = checked .. item
			sum = sum + priorities:find(item, 1, true)
		end
	end
	table.insert(buffer, line)
	if (#buffer == 3) then
		check_badges()
	end
end

print(sum)
print(badge_sum)
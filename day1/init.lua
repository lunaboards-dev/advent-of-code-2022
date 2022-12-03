local running = 0
local elves = {}
for line in io.stdin:lines() do
	if line ~= "" then
		running = running + tonumber(line, 10)
	else
		table.insert(elves, running)
		running = 0
	end
end
table.insert(elves, running)
table.sort(elves)
local top3 = 0
for i=#elves-2, #elves do
	top3 = top3 + elves[i]
end
print("max: "..elves[#elves])
print("top 3: "..top3)
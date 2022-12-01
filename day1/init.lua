local max = 0
local running = 0
local count = 1
local maxlen = 0
local elves = {}
for line in io.stdin:lines() do
	if line ~= "" then
		running = running + tonumber(line, 10)
	else
		table.insert(elves, running)
		running = 0
		count = count + 1
	end
	--[[local s = string.format("count: %i, max: %i, running: %i, cur: %s", count, max, running, line)
	if #s < maxlen then
		s = s .. string.rep(" ", maxlen-#s)
	else
		maxlen = #s
	end
	io.stderr:write(s, "\r")]]
end
table.insert(elves, running)
table.sort(elves)
print("")
local top3 = 0
for i=#elves-2, #elves do
	print(elves[i], top3)
	top3 = top3 + elves[i]
end
print("\nmax: "..elves[#elves])
print("top 3: "..top3)
#!/bin/bash
mkdir -p .cache
if [[ ! -f .cache/day$1 ]]; then
	curl -s --cookie "session="$(cat .session) https://adventofcode.com/2022/day/$1/input > .cache/day$1
fi
cat .cache/day$1 | lua day$1/init.lua
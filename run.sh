#!/bin/bash
curl -s --cookie "session="$(cat .session) https://adventofcode.com/2022/day/$1/input | lua day$1/init.lua
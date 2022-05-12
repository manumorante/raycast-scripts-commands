#!/usr/bin/env ruby

# @raycast.schemaVersion 1
# @raycast.title Puntos
# @raycast.mode inline
# @raycast.icon 🟢
# @raycast.refreshTime 24h


RED = 31
GREEN = 32
YELLOW = 33

def step(number, hours)
    "#{number} \e[#{GREEN}m#{hours}h\e[0m   "
end

steps =  step(1, 3)
steps << step(2, 6)
steps << step(3, 8)
steps << step(5, 16)
steps << step(8, 24)

puts steps



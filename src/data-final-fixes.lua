local table = require("__flib__.table")

local constants = require("constants")

-- Extract settings
local status_colors = {}
local status_icons = {}
for name, spec in pairs(settings.startup) do
  local matched, _, type, key = string.find(name, "^bnl%-(.-)%-(.-)$")
  if matched then
    local tbl = type == "color" and status_colors or status_icons
    tbl[key] = spec.value
  end
end

status_colors = table.map(status_colors, function(color) return constants.colors[color] end)

local crafters = {
  "assembling-machine",
  "furnace",
  "rocket-silo"
}

local function create_wv(root)
  local wv = root.working_visualisations
  if not wv then
    wv = {}
    root.working_visualisations = wv
  end
  local new_wv = {
    render_layer = "light-effect",
    draw_as_light = true,
    draw_as_sprite = true,
    apply_tint = "status",
    always_draw = true,
    animation = {
      -- FIXME: It doesn't appear that you can have different icons per status :(
      filename = "__BottleneckLite__/graphics/solid.png",
      size = 64,
      scale = 0.15,
      line_length = 1,
      frame_count = 1,
      -- FIXME: Calculate offset based on entity size
      shift = {-0.6, 1.3},
      animation_speed = 1,
      direction_count = 1,
    },
  }
  wv[#wv + 1] = new_wv
end

for _, type in pairs(crafters) do
  for name, crafter in pairs(data.raw[type]) do
    crafter.status_colors = status_colors
    create_wv(crafter)
  end
end

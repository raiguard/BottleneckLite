local constants = require("constants")

-- Extract settings
local status_colors = {}
for name, spec in pairs(settings.startup) do
  local matched, _, key = string.find(name, "^bnl%-color%-(.-)$")
  if matched then
    status_colors[key] = constants.colors[spec.value]
  end
end

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
  for _, crafter in pairs(data.raw[type]) do
    crafter.status_colors = status_colors
    create_wv(crafter)
  end
end

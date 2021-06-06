local constants = require("constants")

if not settings.startup["bnl-enable"].value then return end

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

local enable_glow = settings.startup["bnl-glow"].value
local size = constants.sizes[settings.startup["bnl-indicator-size"].value]

local function add_indicator(prototype, wv_root)
  wv_root = wv_root or prototype

  -- Set status colors
  wv_root.status_colors = status_colors

  -- Calculate shift for the indicator
  local selection_box = prototype.selection_box
  local left_top = selection_box[1]
  local right_bottom = selection_box[2]
  local x = left_top[1] + (math.abs(right_bottom[1] - left_top[1]) * constants.horizontal_position)
  local y = right_bottom[2] - size - constants.additional_vertical_offset

  -- Get or create working visualisations table
  local wv = wv_root.working_visualisations
  if not wv then
    wv = {}
    wv_root.working_visualisations = wv
  end

  -- Add to working visualisations
  wv[#wv + 1] = {
    always_draw = true,
    apply_tint = "status",
    draw_as_light = enable_glow,
    draw_as_sprite = true,
    render_layer = "light-effect",
    animation = {
      filename = "__BottleneckLite__/graphics/solid.png",
      size = 64,
      scale = size,
      line_length = 1,
      frame_count = 1,
      shift = {x, y},
      animation_speed = 1,
      direction_count = 1,
    },
  }
end

for _, type in pairs(crafters) do
  for _, crafter in pairs(data.raw[type]) do
    add_indicator(crafter)
  end
end

if settings.startup["bnl-include-mining-drills"].value then
  for _, drill in pairs(data.raw["mining-drill"]) do
    drill.status_colors = status_colors

    -- Ensure the drill has a graphics set
    if not drill.graphics_set then
      drill.graphics_set = {
        animation = drill.animations
      }
    end

    add_indicator(drill, drill.graphics_set)

    if drill.wet_mining_graphics_set then
      add_indicator(drill, drill.wet_mining_graphics_set)
    end
  end
end


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

local enable_glow = settings.startup["bnl-glow"].value
local size = constants.sizes[settings.startup["bnl-indicator-size"].value]

local function build_indicator(prototype)
  -- Calculate shift for the indicator
  local selection_box = prototype.selection_box
  local left_top = selection_box[1]
  local right_bottom = selection_box[2]
  local x = left_top[1] + (math.abs(right_bottom[1] - left_top[1]) * constants.horizontal_position)
  local y = right_bottom[2] - size - constants.additional_vertical_offset

  -- Indicator animation
  return {
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

local function add_to_wv(prototype, wv_root)
  wv_root = wv_root or prototype

  -- Set status colors
  wv_root.status_colors = status_colors

  -- Get or create working visualisations table
  local wv = wv_root.working_visualisations
  if not wv then
    wv = {}
    wv_root.working_visualisations = wv
  end

  -- Add indicator to working visualisations
  wv[#wv + 1] = build_indicator(prototype)
end

for _, type in pairs{"assembling-machine", "furnace", "rocket-silo"} do
  for _, crafter in pairs(data.raw[type]) do
    if not crafter.bottleneck_ignore then
      add_to_wv(crafter)
    end
  end
end

if settings.startup["bnl-include-mining-drills"].value then
  for _, drill in pairs(data.raw["mining-drill"]) do
    if not drill.bottleneck_ignore then
      drill.status_colors = status_colors

      -- Ensure the drill has a graphics set
      if not drill.graphics_set then
        drill.graphics_set = {
          animation = drill.animations
        }
      end

      add_to_wv(drill, drill.graphics_set)

      if drill.wet_mining_graphics_set then
        add_to_wv(drill, drill.wet_mining_graphics_set)
      end
    end
  end
end

-- HACK: Labs do not support working_visualisations, so we must add the indicators to the actual lab animations
if settings.startup["bnl-include-labs"].value then
  for _, lab in pairs(data.raw["lab"]) do
    for tbl_name, status in pairs{off_animation = "idle", on_animation = "working"} do
      -- Ensure the lab has `layers` in this animation
      local animation = lab[tbl_name]
      local layers = animation.layers
      if not layers then
        layers = {animation}
        lab[tbl_name] = {layers = layers}
      end

      -- Generate frame sequence for the single-frame source image
      local frame_count = layers[1].frame_count
      local frame_sequence = {}
      for i = 1, frame_count do
        frame_sequence[i] = 1
      end

      -- Add a new layer
      local indicator = build_indicator(lab).animation
      indicator.tint = status_colors[status]
      indicator.frame_sequence = frame_sequence
      layers[#layers + 1] = indicator
    end
  end
end

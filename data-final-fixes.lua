local bounding_box = require("__flib__/bounding-box")

local constants = require("__BottleneckLite__/constants")

if not settings.startup["bnl-enable"].value then
  return
end

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
local style = settings.startup["bnl-indicator-style"].value
local animation
if style == "default" then
  animation = {
    filename = "__flib__/graphics/indicators.png",
    flags = { "icon" },
    y = 32,
    size = 32,
    scale = size * 4,
    line_length = 1,
    frame_count = 1,
    animation_speed = 1,
    direction_count = 1,
  }
elseif style == "solid" then
  animation = {
    filename = "__BottleneckLite__/graphics/solid.png",
    flags = { "icon" },
    size = 64,
    scale = size,
    line_length = 1,
    frame_count = 1,
    animation_speed = 1,
    direction_count = 1,
  }
end

local function build_indicator(prototype)
  -- Calculate shift for the indicator
  local box = bounding_box.ensure_explicit(prototype.selection_box or prototype.collision_box or prototype.drawing_box)
  local positions = {
    north_south = {},
    east_west = {},
  }
  for _, tbl in pairs(positions) do
    tbl[1] = box.left_top.x + (bounding_box.width(box) * constants.horizontal_position) -- X
    tbl[2] = box.right_bottom.y - size - constants.additional_vertical_offset -- Y
    box = bounding_box.rotate(box)
  end

  return {
    always_draw = true,
    apply_tint = "status",
    draw_as_light = enable_glow,
    draw_as_sprite = true,
    render_layer = "light-effect",
    animation = animation,
    north_position = positions.north_south,
    east_position = positions.east_west,
    south_position = positions.north_south,
    west_position = positions.east_west,
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

for _, type in pairs({ "assembling-machine", "furnace", "rocket-silo" }) do
  for name, crafter in pairs(data.raw[type]) do
    if not constants.ignored_entities[name] then
      if crafter.bottleneck_ignore then
        -- Remove the property to avoid pollution with some debugging features
        crafter.bottleneck_ignore = nil
      else
        add_to_wv(crafter)
      end
    end
  end
end

if settings.startup["bnl-include-mining-drills"].value then
  for name, drill in pairs(data.raw["mining-drill"]) do
    if not constants.ignored_entities[name] then
      if drill.bottleneck_ignore then
        -- Remove the property to avoid pollution with some debugging features
        drill.bottleneck_ignore = nil
      else
        drill.status_colors = status_colors

        -- Ensure the drill has a graphics set
        if not drill.graphics_set then
          drill.graphics_set = {
            animation = drill.animations,
          }
        end

        add_to_wv(drill, drill.graphics_set)

        if drill.wet_mining_graphics_set then
          add_to_wv(drill, drill.wet_mining_graphics_set)
        end
      end
    end
  end
end

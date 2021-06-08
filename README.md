# Bottleneck Lite

Bottleneck Lite is a mod for Factorio that helps you find bottlenecks in your factory. It is inspired by the [Bottleneck](https://mods.factorio.com/mod/Bottleneck) mod, but takes advantage of newer API features to eliminate _all_ runtime overhead and improve responsiveness.

[Download on the Mod Portal.](https://mods.factorio.com/mod/BottleneckLite)

## Features

Bottleneck Lite adds "indicators" to every crafting machine and mining drill, allowing you to quickly determine its status.

The indicators will be colored according to these statuses:

- Disabled (red)
- Full output (yellow)
- Idle (red)
- Insufficient input (red)
- Low power (yellow)
- No minable resources (red)
- No power (red)
- Working (green)

The colors can be customized in the settings menu. Along with green, red, and yellow, you can also change the colors to cyan, blue, purple, white, or "off" (which hides the indicator for that status). Other settings include indicator size, whether or not they will glow in the dark, and whether or not they will be drawn on mining drills.

**NOTE:** Because of the way the mod works, all settings are under the `Startup` tab in the mod settings menu, and any changes require restarting Factorio to take effect.## Features

## Compared to [Bottleneck](https://mods.factorio.com/mod/Bottleneck)

Bottleneck Lite, in comparison to Bottleneck, has _no runtime scripting_. The indicators are added to the actual sprites of each entity, and are tinted based on the working visualisations property. This means that Bottleneck Lite is infinitely scaleable, and will instantly respond to changes in entity status regardless of how many entities there are.

### Pros

- Zero runtime overhead
- Instant responsiveness regardless of scale
- Indicators can glow in the dark
- Significantly fewer settings (some might consider this a con)

### Cons

- Changing settings requires restarting Factorio
- No hotkey to toggle the indicators - enabling/disabling them is a setting, and so requires a restart
- Only one style of indicator (no alert, cross, stop, minus, or 3D variants)
- No indicators on labs

## Compatibility

For mod authors - if you don't want an indicator to show on your entity for some reason, add `bottleneck_ignore = true` to its prototype and BNL will ignore it.

## Screenshots

![](resources/demo-screenshot.png)

![](resources/demo-screenshot-night.png)

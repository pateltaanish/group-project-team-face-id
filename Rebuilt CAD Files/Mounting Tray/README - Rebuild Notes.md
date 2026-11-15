# ESP32 + Raspberry Pi 5 mounting tray: SolidWorks rebuild (v2)

The tray existed as an OpenSCAD model and its faceted STL export. This rebuilds it as a native SolidWorks part with a named feature tree, using the exact dimensions from `bass_esp32_rpi5_mounting_tray.scad`.

## Files

| File | What it is |
|---|---|
| `bass_esp32_rpi5_mounting_tray_v2.SLDPRT` | The tray |
| `STEP/bass_esp32_rpi5_mounting_tray_v2.STEP` | Neutral STEP |
| `STL/bass_esp32_rpi5_mounting_tray_v2.STL` | Print STL, same orientation/origin as the original STL (print flat, bottom down) |

Units are mm. In SolidWorks the model is Y-up (STL z → SW Y, STL y → SW −Z).

## Feature tree

| Feature | Definition |
|---|---|
| Tray Body | 172 × 165 × 6 with R6 corners |
| Tray Pocket | 164 × 157 pocket down to the 3 mm floor, leaving a 4 mm wide, 6 mm tall rim |
| ESP32 Housing Guide | 2.5 × 2.5 rails around a 158 × 61.8 zone. This is the 152 × 55.8 housing (including its tabs) plus 3 mm clearance each side. |
| Pi5 Cage Guide | 2.5 × 2.5 rails around a 104.5 × 76.3 zone. This is the 98.5 × 70.3 cage plus 3 mm clearance each side. |
| Center Divider | 3 mm wide, 2.5 mm tall wall at y 76 to 79, spanning the rim |
| M4 Mounting Holes | 4 × Ø4.2 through, at 10 mm from each corner (152 × 145 mm pattern) |

## Accuracy vs. the original STL

| Volume change | Mean dev | Max dev |
|---|---|---|
| 0.0 % | < 0.01 mm | 0.03 mm |

The geometry is a dimensionally exact match. The only change is that the corners and holes are true arcs instead of 32-sided polygons.

## Points worth checking (unchanged from the original)

1. **There are thin slots between the guides and the rim.** The outer guide rails stop 0.5 mm short of the rim on three sides of the ESP32 zone and on the left side of the Pi zone, and 1.2 mm short at the top of the Pi zone. Slots that narrow print poorly and collect debris. Consider extending the guides to merge into the rim.
2. **The corner hole at (10, 155) is partly under the Pi cage.** Its edge overlaps the cage footprint corner by about 2 × 1.3 mm, so a screw head there would sit under the cage. The other three holes are clear of both devices.
3. **The Pi 5 cage size is approximate** (98.5 × 70.3, per the original README). Test-fit the actual CanaKit cage before a production print.

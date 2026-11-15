# ESP32 perfboard sensor housing: SolidWorks rebuild (v2)

The original base, lid and assembly existed only as triangle-mesh STLs. These files rebuild the base and lid as native SolidWorks parts with a named feature tree, plus a simple perfboard reference part for checking fit. They replace the meshes for review and printing.

## Files

| File | What it is |
|---|---|
| `bass_esp32_perfboard_assembly_v2.SLDASM` | Base + lid + perfboard reference, in the same positions as the original assembly STL (components fixed at the origin, no mates yet) |
| `bass_esp32_perfboard_base_v2.SLDPRT` | Enclosure base (print) |
| `bass_esp32_perfboard_lid_v2.SLDPRT` | Vented lid (print) |
| `bass_esp32_perfboard_PCB_reference.SLDPRT` | 124 × 47 × 1.6 perfboard, for fit checks only (not printed) |
| `STEP/` | Neutral STEP of each part and the assembly |
| `STL/` | Print STLs of the base and lid, same orientation/origin as the original STLs |

Units are mm. In SolidWorks the model is Y-up (STL z → SW Y, STL y → SW −Z). All parts share one origin, so the lid is modelled in its assembled position (z = 43 to 55). For printing, flip the lid so the top plate is on the bed.

## How each part is built

- **Base:**
  - Shell: 132.8 × 55.8 × 43 with R4 outer corners, 2.4 mm walls and a 2.8 mm floor.
  - Four 9.6 × 12 full-height mounting tabs with Ø3.4 holes, on 140 × 31.8 mm centres (x = −3.6 / 136.4, y = 12 / 43.8).
  - A 2 mm wide internal lip at z 4–6, which leaves a 1.2 mm gap above the floor.
  - Two board rails (2 × 48 × 1.5) on top of the lip at each end.
  - Cable slots through the end walls at z 6–16: 15 mm wide at the x = 0 end and 18 mm wide at the other end.
  - Four Ø3.4 floor holes with Ø6.8 × 1 mm counterbores on the inside.
- **Lid:**
  - 3 mm top plate, same R4 outline as the base.
  - 34 × Ø4.2 vent holes on a 19 × 7 mm grid; the two centre positions of the middle row are left solid.
  - A 9 mm deep, 2.4 mm wall locating skirt, 0.35 mm inside the base's inner wall.
  - Four 12 mm tall tab blocks that land on the base tabs, with matching Ø3.4 holes.

## Accuracy vs. the original STLs

Measured as the distance from each surface to the other mesh, sampled both ways:

| Part | Volume change | Mean dev | 99th pct | Max |
|---|---|---|---|---|
| Base | 0.0 % | < 0.01 mm | 0.01 mm | 0.02 mm |
| Lid | 0.0 % | < 0.01 mm | 0.01 mm | 0.02 mm |

The geometry is a dimensionally exact match. Nothing was simplified. The only visual difference is that holes and corners are now true arcs instead of 64-sided polygons.

## Issues found in the original design (worth checking)

1. **The perfboard has nothing to sit on, and it clashes with the rails.**
   - The board (124 × 47) is exactly the size of the opening inside the lip, so the lip doesn't support it.
   - In the original assembly the board floats at z 5.6–7.2.
   - The two rails (x 3.9–5.9 and 126.9–128.9, z 6–7.5) overlap the board's short edges by 1.5 mm × 1.2 mm along their whole length.
   - Decide whether the board should rest on the lip (make the board, or the lip opening, about 2 mm smaller or larger) or slot between the rails (open up the rail gap).
2. **The lid skirt doesn't go into the base.**
   - The skirt hangs from z 52 down to 43, which is exactly the top of the base, and sits 0.35 mm inside the base wall.
   - It never engages the base. The lid only bears on the four tab blocks.
   - When the lid is closed, this leaves a 9 mm tall band set back 2.75 mm all round between the base rim and the lid plate.
   - The 0.35 mm clearance suggests the skirt was meant to plug into the base. If so, it needs to move down, or the base walls need to rise by about 9 mm.
3. **The floor screw holes are hard to reach.**
   - The four corner holes (Ø3.4 with Ø6.8 counterbores) sit half under the board rails, and partly under the lip.
   - A screwdriver can't reach them straight down.
   - A socket-head M3 in the 1 mm counterbore would hit the underside of the lip, so use a pan or low-profile head.

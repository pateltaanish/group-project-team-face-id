# Accord Camera Mount: SolidWorks rebuild (v14 / cam v21)

The v13/v20 parts existed only as triangle-mesh STLs. The helmet assembly alone had ~77,600 facets. These files rebuild every part as a native SolidWorks solid with a named feature tree. They replace the meshes for review and printing.

## Files

| File | What it is |
|---|---|
| `Accord_HELMET_FULL_ASSEMBLY_v14.SLDASM` | Assembly of the 4 parts below, positioned as in the v13 assembly (components fixed, no mates yet) |
| `Accord_HELMET_RAIL_CONNECTED_v14.SLDPRT` | Helmet shell + slide rail (one print) |
| `Accord_CAMERA_CARRIAGE_STAND_v14.SLDPRT` | Sliding camera carriage |
| `Pi_IR-CUT_CAM_v21_front.SLDPRT` | Camera housing, front shell |
| `Pi_IR-CUT_CAM_v21_back.SLDPRT` | Camera housing, back cover with 3-finger hinge |
| `STEP/` | Neutral STEP of each part and the full assembly |
| `STL/` | Print-ready STLs, in the same orientation/origin as the v13 STLs |

Units are mm. In SolidWorks the model is Y-up (STL z → SW Y, STL y → SW −Z). The STL exports are converted back to the original Z-up frame.

## How each part is built

- **Helmet + rail:** The outer walls and dome are lofts through measured horizontal sections. The cavity is cut by matching inner lofts. The curved front lip is trimmed between the feet. The feet, rail anchor block, rail base, side lips and Ø3.6 slide slot are plain extrudes and cuts.
- **Carriage:** Base plate 92.82 × 31 × 4, camera block 42 × 29 × 5, Ø3.6 × 4 slide-pin hole from below, two 2 × 8 cable-tie slots.
- **Camera front:** Stadium shell (pods R12.5 at ±30.95, 2 mm wall, 2 mm front plate) with top and bottom bumps. Openings: Ø16 lens, Ø7 light sensor, Ø21 IR LED openings with notches, and the IR retaining rings.
- **Camera back:** Cover skirt (slides over the front shell, 2 mm wall) and back plate. Also IR board posts, a ribbon-cable cap/slot, and three 3 mm hinge fingers with Ø3.2 pivot holes.

## Accuracy vs. the original STLs

Surface deviation was measured by sampling both surfaces:

| Part | Volume change | Mean dev | 95th pct | Max |
|---|---|---|---|---|
| Helmet + rail | −0.2 % | 0.22 mm | 0.42 mm | 2.7 mm |
| Carriage | 0.0 % | 0.07 mm | 0.12 mm | 0.2 mm |
| Camera front | +3.4 % | 0.11 mm | 0.25 mm | 1.3 mm |
| Camera back | +2.3 % | 0.13 mm | 0.25 mm | 3.7 mm |
| Full assembly placement | | 0.24 mm | 0.51 mm | |

Known simplifications are listed here so they can be added back if they matter:

- **Camera housings:** Small edge fillets and chamfers are left off. These are the front-edge round (~R2), the bump corner rounds (~R1), and the skirt lead-in chamfer. This accounts for the +2–3 % volume.
- **Helmet:**
  - The dome top is a small flat cap (≤0.4 mm low).
  - The bottom edge is flat at z = −77 except for the curved front lip; the original dips to about −78 at the back corners.
  - The outer bottom edge round is left off.

## Issues found in the original v13 design (worth checking)

1. **The carriage is wider than the rail channel.** The carriage base is 31 mm wide (y ±15.5) and sits on the channel floor at z = 4. The rail side lips (y ±11…13, up to z = 7) run inside that footprint, giving a 2 × 3 mm overlap on each side along the carriage length. The parts as drawn can't slide. Either narrow the carriage to under 22 mm, or raise it to ride on the lips.
2. **The camera back cover collides with the carriage block.** The back cover's bottom bump reaches z = 11, but the carriage block top is at z = 13, so they overlap by 2 mm. The front shell sits exactly on the block.

# kicad-nightly-create-gerbers

Experimental Github Action to plot Kicad PCB files
This uses the Kicad Nightly build and **WILL** break often.

## Inputs
### `pcb-file`
**Required** .kicad-pcb file from the Kicad project

## Example usage

```
uses: TiltMeSenpai/kicad-nightly-create-gerbers
with:
  pcb-file: my-project.kicad_pcb
```
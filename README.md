# kicad-nightly-create-gerbers

Experimental Github Action to plot Kicad PCB files
This plots against the most recent 7.x stable, but is a bit jank,
so trust me at your own discretion.

## Inputs
### `pcb-file`
**Required** .kicad-pcb file from the Kicad project

## Example usage

```
uses: TiltMeSenpai/kicad-nightly-create-gerbers
with:
  pcb-file: my-project.kicad_pcb
```

Any text instances of `${GIT_REV}` will be replaced by a commit identifier,
preferring a format including the most recent tag. If the repo does not have
any Git tags, the commit short hash will be used instead.

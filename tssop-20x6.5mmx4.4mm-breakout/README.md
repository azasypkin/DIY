Steps

1. Take [20-pin-SOIC-TSSOP-Eagle.brd](./20-pin-SOIC-TSSOP-Eagle.brd) (downloaded from [Adafruit SMT Breakout for 20-pin SOIC+TSSOP](https://github.com/adafruit/Adafruit-SMT-Breakout-PCBs/blob/master/20-pin%20SOIC%2BTSSOP.brd)) and `Import Non-KiCad Board File` in `KiCad` and save it as `KiCad` board. See [board.kicad_pcb](./board.kicad_pcb)
2. Open the board in `KiCad` and choose `Place the origin point for drill and place files` at the toolbox and set the origin point to the bottom left corner of the board cutout
3. Generate gerber (for the bottom layer only and edge cuts) and drill files, open them in the `Flatcam`
4. Generate tool paths (see [flatcam project file](./cnc/flatcam)) and export G-Code

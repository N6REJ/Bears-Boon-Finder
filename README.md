# Bears Boon Finder

Bears Boon Finder scans for Mislaid Curiosity vignettes (vignette ID 5482),
including hidden entries, and places blue treasure chest pins on the minimap as
soon as their Delve map positions are available. It scans only inside Delves and the
Labyrinth of Kindo'jan. It does not require native minimap markers or use or
consume L00T-RAID-R Minis.

Click the spyglass button beside the minimap, or use `/boonfinder` (or `/bbf`),
to open the Finder window. Use **Scan Delve** for an immediate scan; the addon
also scans automatically every half second. It checks the current map, its
parent and floor maps, and related Delve maps for vignette positions. The map
shows every cached location for the current floor; minimap chest pins appear for
nearby locations and track the current minimap zoom. Map pins scale with map
zoom. Collegiate Calamity floor coordinates are translated between its
related map layers. Turn off **Show Mislaid Curiosity treasure chest pins** to pause
scanning and hide pins.

Pins mark map locations. The vignette API provides map coordinates, not the
3D screen position needed to draw a reticle directly over a curiosity in the
game scene.

The scanner checks hidden Mislaid Curiosity vignette IDs directly, then queries
the current and related floor maps for their positions; it does not wait for a
native minimap icon to appear. Results are potential locations until confirmed
in the Delve. If the client supplies no usable position, the Finder reports
the vignette and map counts rather than inventing a location.

## Development notes

- Addon metadata and the Ace3 dependency load order are in
  `Bears_Boon_Finder.toc`.
- User-facing strings are in `Locales/enUS.lua` and use AceLocale.
- `scanner.lua` owns Delve detection, Mislaid Curiosity vignette scans, map
  position conversion, and map/minimap pins.
- `ui.lua` owns the scan window and pin toggle.
- `.pkgmeta` fetches the Ace3, LibDataBroker, and LibDBIcon libraries for
  release packaging.

## Installation

Install the packaged `Bears_Boon_Finder` folder into your World of Warcraft
`Interface/AddOns` directory, or use a compatible addon manager.

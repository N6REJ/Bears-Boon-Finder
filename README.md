# Bears Boon Finder

Bears Boon Finder is a World of Warcraft addon skeleton for locating boon
pickups within a Delve. It follows the Ace3 addon structure used by
[Bears Boon Viewer](https://github.com/N6REJ/Bears-boon-viewer).

Use `/boonfinder` (or `/bbf`) to open the starter window. The window and addon
lifecycle are in place, but boon discovery and location reporting have not been
implemented yet. The scanner module is the intended home for that logic.

## Development notes

- Addon metadata and the Ace3 dependency load order are in
  `Bears_Boon_Finder.toc`.
- User-facing strings are in `Locales/enUS.lua` and use AceLocale.
- `scanner.lua` is the placeholder for Delve boon discovery.
- `ui.lua` owns the initial scan window and results area.
- `.pkgmeta` fetches the Ace3 libraries for release packaging.

## Installation

Install the packaged `Bears_Boon_Finder` folder into your World of Warcraft
`Interface/AddOns` directory, or use a compatible addon manager.

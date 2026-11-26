# Waybar configuration

A quiet top bar in the spirit of the macOS menu bar: one colour for every symbol, no frames, only what matters.
Left: workspace circles and the focused app. Right: tray, an orange dot while the microphone or screen sharing is in
use, a bell only while notifications wait, Bluetooth while connected, volume, brightness and battery on laptops,
network, the control centre switch and the clock.

- **Text and tint**: with `aco-theme transparency on` the bar floats over the wallpaper. The text is light or dark to
  suit the wallpaper (`aco-theme bar text auto`, or always `light` / `dark`), and an optional tint sits behind it
  (`aco-theme bar opacity 0..1`). Both are in *Einstellungen > Erscheinungsbild > Menüleiste*. With transparency off
  the bar is a solid strip in the normal colours.
- **Workspaces** are circles, one per workspace of the monitor the bar sits on; the one on screen is filled (fully on
  the focused monitor, half on the others). Click to switch, scroll to step. Grouping per monitor and the "all
  monitors" mode come from `workspaces.lua` in aco-hypr.
- **Clicks**: the switch icon opens the control centre, the clock and the bell the notification centre (aco-swaync);
  network, Bluetooth, battery and a right click on the volume open their page in the settings hub.

**[Documentation](https://aco-docs.readthedocs.io/en/latest/waybar/)** ·
[Guide](https://aco-docs.readthedocs.io/en/latest/waybar/guide/) ·
[Design & dependencies](https://aco-docs.readthedocs.io/en/latest/waybar/design/) ·
[Installation and updates](https://aco-arch-dotfiles.readthedocs.io/en/latest/arch-package/)

```bash
curl -fsSL https://raw.githubusercontent.com/Akademie-Olympia/aco-arch-dotfiles/main/install.sh | bash -s -- waybar
```

Package: `aco-arch-dotfiles-waybar`. This standalone repository holds the development sources and the package recipe in
`packaging/arch/PKGBUILD`. The documentation of this component lives in the shared
[aco-docs](https://github.com/Akademie-Olympia/aco-docs) repository (one Read the Docs project for all small components).
Push to `main`; after a successful registry build update with `sudo pacman -Syu`. Details and local builds: [PACKAGING.md](PACKAGING.md).

### Customisation

Modules live in `config.jsonc`, their look in `style.css`. Reload Waybar after changes (`Super + Shift + B`).

Your own changes in the activated user copy survive synchronisation; new differing defaults appear as `.pacnew`.
See [update and recovery](https://aco-arch-dotfiles.readthedocs.io/en/latest/verification/).

### Theme

Colours, fonts and rounding come from [aco-theme](https://github.com/Akademie-Olympia/aco-theme): the templates in `aco-theme/` are rendered to `~/.config/aco/theme/waybar/` and included from here, so this config only holds behaviour and layout. Switch with `aco-theme mode|accent|transparency`; personal overrides go into `~/.config/aco/theme.local.conf`.

[![Package safety](https://github.com/Akademie-Olympia/aco-waybar/actions/workflows/package.yml/badge.svg)](https://github.com/Akademie-Olympia/aco-waybar/actions/workflows/package.yml)

[MIT licence](LICENSE).

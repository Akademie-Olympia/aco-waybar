# Waybar configuration

A quiet top bar: workspace circles and the focused app on the left; on the right only status icons that matter
(network, sound, brightness and battery on laptops, Bluetooth while connected, an orange dot while the microphone
or screen sharing is in use), the clock and the control centre button.

- **Workspaces** are circles, one per workspace of the monitor the bar sits on; the one on screen is filled (accent
  on the focused monitor, grey elsewhere). Click to switch, scroll to step through the monitor's workspaces.
  Grouping per monitor and the "all monitors" mode come from `workspaces.lua` in aco-hypr.
- **Transparent**: with `aco-theme transparency on` the bar has no background and floats over the wallpaper; with
  `off` it is a solid strip (`bar_opacity` in aco-theme).
- **Clicks**: network, Bluetooth, battery and right click on the volume open their page in the settings hub;
  the clock and the bell open the control centre (aco-swaync), which also holds lock and power off.

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

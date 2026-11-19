# Waybar configuration

Wayland panel with workspaces, clock, volume, battery and a power menu.

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

Modules live in `config.jsonc`, their look in `style.css`; `power_menu.xml` describes the power menu. Reload Waybar after changes (`Super + Shift + B`).

Your own changes in the activated user copy survive synchronisation; new differing defaults appear as `.pacnew`.
See [update and recovery](https://aco-arch-dotfiles.readthedocs.io/en/latest/verification/).

[![Package safety](https://github.com/Akademie-Olympia/aco-waybar/actions/workflows/package.yml/badge.svg)](https://github.com/Akademie-Olympia/aco-waybar/actions/workflows/package.yml)

[MIT licence](LICENSE).

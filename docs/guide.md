# Waybar im Alltag

Waybar ist die schmale Leiste am oberen Bildschirmrand der Hyprland-Sitzung. Sie zeigt nur, was man dauernd braucht –
Workspace, Uhrzeit, Lautstärke, Akku – und bietet ein Power-Menü. Alles andere (Programme starten, Fenster wechseln,
Hintergrund wählen) liegt bewusst **nicht** in der Leiste, sondern auf Tastenkürzeln und im [Fuzzel](https://aco-fuzzel.readthedocs.io/en/latest/)-Menü.

## Aufbau

```text
┌───────────────┬──────────────────────┬─────────────────────────────┐
│ 1 2 3 4 5 …   │  14:32  ·  19.11.2026 │  󰕾 65%    󰂀 82%    󰐥      │
└───────────────┴──────────────────────┴─────────────────────────────┘
  links            Mitte                  rechts
```

| Bereich | Modul | Funktion |
| --- | --- | --- |
| Links | `hyprland/workspaces` | Workspaces des Monitors; Mausrad wechselt, aktiver Workspace blau unterstrichen, dringende rot |
| Mitte | `clock` | `HH:MM · TT.MM.JJJJ`, Kalender im Tooltip (Maus darüber halten) |
| Rechts | `wireplumber` | Lautstärke; Klick = stumm, Mausrad ±2 % (höchstens 100 %) |
| Rechts | `battery` | Ladestand mit Symbolen, Tooltip mit Restzeit und Leistung in Watt |
| Rechts | `custom/power` | Power-Menü (siehe unten) |

Höhe 26 px, oben, ohne Abstand zum Rand. Die Leiste erscheint auf **jedem** Monitor; `all-outputs` ist aus, deshalb zeigt jeder
Monitor seine eigenen Workspaces.

### Akku-Zustände

`battery` nutzt `BAT0` und `AC`. Ab **25 %** färbt sich die Anzeige orange (`warning`), ab **12 %** rot (`critical`);
beim Laden und im Netzbetrieb ist sie grün. Hat dein Gerät einen anderen Akkunamen (`ls /sys/class/power_supply`),
ändere `"bat"` in `config.jsonc`.

## Power-Menü

Das Symbol `󰐥` rechts bietet zwei Wege:

1. **Linksklick** – GTK-Menü aus `power_menu.xml` direkt unter der Leiste: Herunterfahren, Neu starten, Standby, Sperren, Abmelden.
2. **Rechtsklick** – das Fuzzel-Menü `powermenu.sh` aus dem Hyprland-Paket (auch auf {kbd}`Super + Esc`), bedienbar nur mit Tastatur.

Die Aktionen sind `systemctl poweroff|reboot|suspend`, `hyprlock` und `hyprctl dispatch 'hl.dsp.exit()'`.
Die Leiste braucht dafür also **Hyprland und Hyprlock** – siehe [Aufbau und Abhängigkeiten](design).

## Neu laden

Nach Änderungen an `config.jsonc` oder `style.css`:

- {kbd}`Super + Shift + B` – sendet Waybar das Signal `SIGUSR2` (lädt Konfiguration und Stil neu); klappt das nicht, wird Waybar neu gestartet.
- Im Terminal: `killall -SIGUSR2 waybar`

Fehler in der Konfiguration meldet `waybar` beim Start im Terminal (`waybar -l debug`).

## Aussehen (`style.css`)

Waybar nutzt GTK-CSS. Die Datei setzt Schrift (JetBrainsMono Nerd Font, 12 px), Catppuccin-Mocha-Farben und eckige Kanten
(`border-radius: 0`). Jedes Modul hat eine CSS-ID (`#clock`, `#battery`, `#wireplumber`, `#custom-power`, `#workspaces button`);
Zustände sind Klassen (`.active`, `.urgent`, `.muted`, `.charging`, `.warning`, `.critical`).

| Rolle | Farbe |
| --- | --- |
| Leistenhintergrund | `#1e1e2e` |
| Modulfläche | `#181825` mit `#313244` als Trennlinie |
| Lautstärke | `#74c7ec` (Sapphire), stumm `#6c7086` |
| Akku | `#94e2d5` (Teal), laden `#a6e3a1`, warnen `#fab387`, kritisch `#f38ba8` |
| Aktiver Workspace | `#89b4fa` |

## Eigene Module ergänzen

Die Leiste ist absichtlich klein. Ein Modul fügst du in zwei Schritten hinzu – etwa Netzwerk oder Fenstertitel:

```javascript
// ~/.config/waybar/config.jsonc
"modules-left":  [ "hyprland/workspaces", "hyprland/window" ],
"modules-right": [ "network", "wireplumber", "battery", "custom/power" ],

"hyprland/window": { "max-length": 50 },
"network": {
    "format-wifi": "󰤨 {essid}",
    "format-ethernet": "󰈀 {ipaddr}",
    "format-disconnected": "󰤭",
    "on-click": "kitty -e nmtui"
}
```

```css
/* ~/.config/waybar/style.css */
#network { padding: 0 10px; background-color: #181825; color: #94e2d5; border-left: 1px solid #313244; }
```

Für `network` ist `networkmanager` nötig (steht schon in den Abhängigkeiten des Pakets), für Bluetooth `bluez-utils`.
Alle Module erklärt `man waybar-<modul>`, z. B. `man waybar-network`.

## Fehlersuche

- **Leiste fehlt:** Wird Waybar von Hyprland gestartet? `pgrep -x waybar`; sonst {kbd}`Super + Shift + B`.
- **Symbole als Kästchen:** `ttf-jetbrains-mono-nerd` fehlt.
- **Lautstärke ohne Wirkung:** `wpctl status` muss einen Standard-Ausgang zeigen (PipeWire/WirePlumber).
- **Akku fehlt:** `bat` passt nicht zum Gerät (siehe oben); auf Desktop-Rechnern das Modul aus `modules-right` entfernen.
- **Workspace-Leiste leer:** Waybar läuft ohne Hyprland-Sitzung (`HYPRLAND_INSTANCE_SIGNATURE` fehlt).

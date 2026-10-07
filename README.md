# I3 Window Manager

[![CI Pipeline](https://github.com/laksana-kresna-dev/i3/actions/workflows/ci.yml/badge.svg?branch=main&event=push)](https://github.com/laksana-kresna-dev/i3/actions/workflows/ci.yml)
[![Release Please](https://github.com/laksana-kresna-dev/i3/actions/workflows/release.yml/badge.svg)](https://github.com/laksana-kresna-dev/i3/actions/workflows/release.yml)
[![Version](https://img.shields.io/github/v/release/laksana-kresna-dev/i3?sort=semver)](https://github.com/laksana-kresna-dev/i3/releases)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

> My personal i3 window manager rice, running on Arch Linux.

![Desktop Showcase](./screenshots/desktop.png)

## Overview

A tiling desktop setup built around [i3](https://i3wm.org/) — minimal,
keyboard-driven, and configured entirely from a plain text file. This
repository also doubles as a quick way to restore my setup on a fresh
Arch install.

## Architecture & Tech Stack

| Domain                   | Technology / Tool               |
| :----------------------- | :------------------------------ |
| **Window Manager**       | i3-wm                           |
| **Compositor**           | Picom (GLX Backend, Animations) |
| **Status Bar**           | Polybar                         |
| **Notification Daemon**  | Dunst                           |
| **Application Launcher** | Rofi / dmenu                    |

## Component Highlights

- **i3 Window Manager:** Minimalist tiling desktop setup configured with intuitive `$mod`-key navigation, automated workspace assignments, dynamic splitting, and zero window decoration bloat.
- **Picom Compositor:** Hardware-accelerated GLX backend providing screen-tearing elimination, subtle window fade effects, rounded corners, and customizable opacity rules.
- **Polybar Status Bar:** Modern, modular status bar showcasing real-time system metrics (CPU, memory, storage, network interface status), active workspace indicators, and system tray integration.
- **Dunst Notification Daemon:** Lightweight notification system customized with urgency-based color schemes, tailored display timeouts, and hotkey controls for dismissing and reviewing notification history.
- **Rofi & dmenu Launchers:** Dual-purpose workflow execution—Rofi as an interactive launcher and window switcher, with `dmenu` serving as a lightweight fallback for quick command execution.

## Quick Start & Installation

1. Backup Existing Configuration:

   ```sh
   [ -d ~/.config/i3 ] && mv ~/.config/i3 ~/.config/i3.bak-$(date +%Y%m%d%H%M%S)
   ```

2. Clone this repository directly into `~/.config/i3`:

   ```sh
   git clone [https://github.com/laksana-kresna-dev/i3.git](https://github.com/laksana-kresna-dev/i3.git) ~/.config/i3
   ```

3. Restart i3 in-place via $mod+Shift+r or terminal:

   ```sh
   i3-msg restart
   ```

## Keybindings Reference

<details>
<summary><strong>Complete Keybindings Cheat Sheet (Modifier = $mod / Super)</strong></summary>

<br>

### Applications & Launchers

| Keybinding              | Action                                         |
| :---------------------- | :--------------------------------------------- |
| `$mod + Return`         | Open terminal (`kitty`)                        |
| `$mod + Shift + Return` | Open floating terminal                         |
| `$mod + d`              | Open `dmenu` application launcher              |
| `$mod + b`              | Launch web browser                             |
| `$mod + f`              | Open terminal file manager (`ranger`)          |
| `$mod + Shift + f`      | Open GUI file manager                          |
| `$mod + v`              | Open terminal volume mixer (`pulsemixer`)      |
| `$mod + Shift + v`      | Open PulseAudio volume control (`pavucontrol`) |

### Window Management

| Keybinding                            | Action                                                  |
| :------------------------------------ | :------------------------------------------------------ |
| `$mod + x`                            | Kill focused window                                     |
| `$mod + Shift + x`                    | Select window to kill (`xkill`)                         |
| `$mod + [h/j/k/l]` / `Arrows`         | Move focus (left / down / up / right)                   |
| `$mod + Shift + [h/j/k/l]` / `Arrows` | Move focused window                                     |
| `$mod + s`                            | Toggle container split (horizontal / vertical)          |
| `$mod + Ctrl + f`                     | Toggle fullscreen                                       |
| `$mod + w`                            | Set tabbed layout                                       |
| `$mod + e`                            | Toggle split layout                                     |
| `$mod + Shift + Space`                | Toggle floating mode                                    |
| `$mod + Ctrl + Space`                 | Toggle sticky window (visible across all workspaces)    |
| `$mod + Space`                        | Toggle focus between tiling and floating windows        |
| `$mod + a`                            | Focus parent container                                  |
| `$mod + r`                            | Enter resize mode (`Return` / `Esc` / `$mod+r` to exit) |

### Workspaces & Navigation

| Keybinding                        | Action                                            |
| :-------------------------------- | :------------------------------------------------ |
| `$mod + [1..0]`                   | Switch to workspace 1–10                          |
| `$mod + Shift + [1..0]`           | Move focused window to workspace 1–10             |
| `$mod + PageUp` / `PageDown`      | Switch to previous / next workspace               |
| `$mod + Tab`                      | Toggle between current and last focused workspace |
| `$mod + Shift + Tab`              | Move window to last focused workspace             |
| `Alt + Tab` / `Alt + Shift + Tab` | Focus next / previous window in current workspace |

### Media, Audio & Brightness

| Keybinding                                    | Action                                         |
| :-------------------------------------------- | :--------------------------------------------- |
| `XF86AudioRaiseVolume` / `LowerVolume`        | Raise / lower system volume                    |
| `XF86AudioMute`                               | Toggle audio mute                              |
| `$mod + XF86AudioRaiseVolume` / `LowerVolume` | Raise / lower microphone volume                |
| `$mod + XF86AudioMute`                        | Toggle microphone mute                         |
| `XF86AudioPlay` / `Next` / `Prev`             | Media play-pause / next track / previous track |
| `XF86MonBrightnessUp` / `Down`                | Increase / decrease screen brightness          |

### Screenshots

| Keybinding      | Action                        |
| :-------------- | :---------------------------- |
| `Print`         | Capture full screen (`scrot`) |
| `Shift + Print` | Capture focused window        |
| `Ctrl + Print`  | Capture selected area         |

### Session Control

| Keybinding         | Action                                     |
| :----------------- | :----------------------------------------- |
| `$mod + Shift + c` | Reload i3 configuration                    |
| `$mod + Shift + r` | Restart i3 in-place                        |
| `$mod + Shift + e` | Exit i3 session (with confirmation prompt) |

</details>

## Contributing

Contributions are welcome! Please adhere to the following guidelines:

- **Issue Reporting:** Submit bug reports or feature requests using the structured **[Issue Forms](.github/ISSUE_TEMPLATE/)**.
- **Pull Requests:** Ensure all PRs follow the guidelines and verification checklists in the **[PR Template](.github/PULL_REQUEST_TEMPLATE.md)**.
- **Commit Standards:** Follow [Conventional Commits](https://www.conventionalcommits.org/) (`feat:`, `fix:`, `chore:`, `docs:`) to enable automated semantic releases and changelog updates.

## License

Distributed under the [MIT License](./LICENSE). See `LICENSE` for more information.

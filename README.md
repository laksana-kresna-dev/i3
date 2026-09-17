# i3wm-dotfiles

My personal [i3wm](https://i3wm.org/) configuration for Arch Linux.

This repository exists so I can quickly restore my desktop setup after a
fresh install or a new machine — clone it, copy the config into place, and
I'm back to a familiar environment in minutes.

## Requirements

- [i3](https://i3wm.org/) (window manager)
- [i3status](https://i3wm.org/docs/i3status.html) (status bar content)
- [i3lock](https://i3wm.org/docs/i3lock.html) and `xss-lock` (screen locking)
- `dex` (XDG autostart)
- `nm-applet` (NetworkManager tray icon)
- `dmenu` (application launcher)
- `pactl` / PulseAudio (volume keybindings)

## Installation

1. Clone this repository:

   ```sh
   git clone git@github.com:<your-username>/i3.git ~/.config/i3
   cd ~/.config/i3
   ```

2. Back up your existing i3 config, if any:

   ```sh
   mv ~/.config/i3/config ~/.config/i3/config.bak
   ```

3. Reload i3 (`$mod+Shift+c`) or restart it (`$mod+Shift+r`).

## Keybindings

The modifier key (`$mod`) is set to the **Windows/Super key** (`Mod4`).

| Keybinding            | Action                                    |
| ---------------------- | ------------------------------------------ |
| `$mod+Return`          | Open a terminal                            |
| `$mod+Shift+q`         | Kill focused window                        |
| `$mod+d`                | Open dmenu launcher                        |
| `$mod+j/k/l/;`          | Move focus left/down/up/right              |
| `$mod+Shift+j/k/l/;`    | Move focused window                        |
| `$mod+h` / `$mod+v`     | Split horizontal / vertical                |
| `$mod+f`                | Toggle fullscreen                          |
| `$mod+s/w/e`            | Layout: stacking / tabbed / toggle split   |
| `$mod+Shift+space`      | Toggle floating                            |
| `$mod+1`–`$mod+0`       | Switch workspace                           |
| `$mod+Shift+1`–`0`      | Move window to workspace                   |
| `$mod+r`                | Enter resize mode                          |
| `$mod+Shift+r`          | Restart i3                                 |
| `$mod+Shift+e`          | Exit i3                                    |

See the [i3 User's Guide](https://i3wm.org/docs/userguide.html) for the full
list of defaults and configuration options.

## Status

This is a work in progress — I'm gradually customizing this setup and will
keep this repository updated as it evolves.

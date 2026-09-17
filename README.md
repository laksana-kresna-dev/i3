# I3 Window Manager
> My personal i3 window manager rice, running on Arch Linux.

![preview](./screenshots/desktop.png)

## Overview

A tiling desktop setup built around [i3](https://i3wm.org/) — minimal,
keyboard-driven, and configured entirely from a plain text file. This
repository also doubles as a quick way to restore my setup on a fresh
Arch install.

## Highlights

- Fully keyboard-driven workflow, no mouse required for window management
- Clean, minimal visual style with no title bars
- Themed i3bar as the status bar
- Single, well-commented config file — easy to read top to bottom

## Tech stack

| Component      | Tool          |
| --------------- | -------------- |
| Window manager  | i3              |
| Status bar      | i3bar + i3status |
| Launcher        | dmenu           |
| Screen locking  | i3lock + xss-lock |
| OS              | Arch Linux      |

<details>
<summary><strong>Installation</strong></summary>

<br>

1. Set your GitHub username once (skip if already set):

   ```sh
   git config --global github.user "your-github-username"
   ```

2. Clone this repository directly into `~/.config/i3`:

   ```sh
   git clone git@github.com:$(git config --get github.user)/i3wm-dotfiles.git ~/.config/i3
   ```

3. Back up your existing i3 config, if any:

   ```sh
   mv ~/.config/i3/config ~/.config/i3/config.bak
   ```

4. Reload i3 (`$mod+Shift+c`) or restart it (`$mod+Shift+r`).

**Requirements:** i3, i3status, i3lock, xss-lock, dex, nm-applet, dmenu,
PulseAudio (`pactl`).

</details>

<details>
<summary><strong>Keybindings</strong></summary>

<br>

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

Full reference: [i3 User's Guide](https://i3wm.org/docs/userguide.html)

</details>

## Status

Work in progress — actively refining this setup. Check the commit history
for the latest changes.

## License

[MIT](./LICENSE)

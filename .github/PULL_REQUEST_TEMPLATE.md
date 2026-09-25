## Description

Provide a brief summary of the changes made in this Pull Request.

## Type of Change

- [ ] **Bug fix** (non-breaking change which fixes an issue)
- [ ] **New feature** (non-breaking change which adds functionality)
- [ ] **Chore / Maintenance** (tooling, dependencies, repo cleanup, workspace setup)
- [ ] **Configuration update / Refactoring** (modifying existing dotfiles, keybindings, module setups, or restructuring config files without adding new features)
- [ ] **Documentation update** (adding, updating, or correcting README, inline comments, or guide documents)

## Related Issues

<!--
Use GitHub keywords to automatically close related issues upon merging.
Professional Conventions:
- For Bug fixes: Fixes #12 or Resolves #12
- For Features / Chores / Refactoring: Closes #5
- Multiple issues: Closes #3, Fixes #12
-->

Closes #

## How Has This Been Tested?

The following general i3wm checks were performed to ensure system stability:

- [ ] **Syntax Validation**: Checked i3 configuration syntax using `i3 -C`
- [ ] **Config Reload**: Verified live config reload without errors using `$mod+Shift+r`
- [ ] **Script Execution**: Confirmed shell scripts execute cleanly with correct permissions (`chmod +x`)
- [ ] **Daemon Initialization**: Verified autostart daemons (e.g., compositor, wallpaper, lockers) spawn correctly on startup
- [ ] _(Optional)_ Insert additional custom tests here...

## Checklist

- [ ] My code follows the style guidelines of this repository.
- [ ] I have performed a self-review of my own changes.
- [ ] Executable permissions (`+x`) are set on new shell scripts via Git.
- [ ] I have updated relevant documentation if necessary.

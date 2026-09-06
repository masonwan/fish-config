# Mason's Fisher configuration for Fish Shell

## Requirements

* [fisher - Fish plugin manager](https://github.com/jorgebucaran/fisher)

## Installation

```fish
fisher install masonwan/fish-config
```

## Features

### Navigation
- `g [dir]`: Change directory and list files automatically. Use `g -` to go back.
- `gohome`: Change directory to `$HOME`.
- `s`: List files in detail (uses `eza` if available).
- `st`: List files in a tree style (depth 3).
- `sf`: List files with a filter (`rg`).
- `pageup` / `pagedown`: Undo/redo working directory switching.

### Jujutsu (jj)
- Abbreviations for standard workflows: `js` (status), `jd` (diff), `jds` (diff --stat), `jl` (log), `jla` (all revisions log), `jn` (new), `je` (edit), `jsh` (show), `jdesc` (describe), `jsq` (squash), `jundo` (undo), `jrebase` (rebase).
- Bookmark management: `jb` (bookmark), `jbl` (list), `jbc` (create), `jbs` (set).
- Git integration: `jgit` (jj git), `jgp` (push), `jgf` (fetch).

### Git
- Abbreviations for common commands: `gs` (status), `gp` (pull), `gb` (branch), `gr` (remote), `gc` (checkout), `gd` (diff), `gdd` (diff cached), `gf` (fetch), `gclean` (clean untracked and reset).
- `gl`: Pretty git log graph.
- `gll`: Detailed git log with commit bodies.

### Tmux
- `tm`: Alias for `tmux`.
- `tma <name>`: Create a new session or attach to an existing one by name.

### File & Editing
- `e [file]`: Smart editor launcher. Automatically uses `sudo -e` if the file (or target directory) is owned by root.
- `v <file>`: View files using `less` with color support and line numbers.
- `d <file>`: Move files to trash (supports `trash` / `trash-put` across platforms) or prompt for removal.
- `rmr <dir>`: Recursive remove with interactive confirmation.

### Utilities
- `find-string <pattern>`: Search for a string in all files in the current directory using `rg`.
- `list-port`: List all listening TCP ports (macOS and Linux).
- `my-ip`: Show private and public IP addresses.
- `ipinfo` / `ipinfo2`: Get detailed IP information from external APIs.
- `disk-info`: Show drive, partition, and mount information.
- `disk-benchmark <path>`: Benchmark disk read/write speed across Linux and macOS.
- `app-update`: Run update scripts from `~/repos/server-setup/updates/`.
- `color-test`: Print a 24-bit color test in the terminal.


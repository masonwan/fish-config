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
- `gh`: Change directory to `$HOME`.
- `s`: List files in detail (uses `eza` if available).
- `st`: List files in a tree style (depth 3).
- `sf`: List files with a filter (`rg`).
- `pageup` / `pagedown`: Undo/redo working directory switching.

### Git
- Aliases for common commands: `gs` (status), `gp` (pull), `gb` (branch), `gr` (remote), `gc` (checkout), `gd` (diff), `gf` (fetch).
- `gl`: Pretty git log graph.
- `gll`: Detailed git log with commit bodies.
- `gclean`: Force clean untracked files and reset changes.

### Tmux
- `tm`: Alias for `tmux`.
- `tma <name>`: Create a new session or attach to an existing one by name.

### File & Editing
- `e <file>`: Smart editor launcher. Automatically uses `sudo -e` if the file is owned by root.
- `v <file>`: View files using `less` with color support and line numbers.
- `d <file>`: Move files to trash (supports `trash-put` on Linux and `trash` on macOS) or prompt for removal.
- `rmr <dir>`: Recursive remove with interactive confirmation.

### Utilities
- `find-string <pattern>`: Search for a string in all files in the current directory.
- `list-port`: List all listening TCP ports (macOS and Linux).
- `my-ip`: Show private and public IP addresses.
- `ipinfo` / `ipinfo2`: Get detailed IP information from external APIs.
- `disk-info`: Show drive, partition, and mount information.
- `disk-benchmark <path>`: Benchmark disk read/write speed.
- `app-update`: Run update scripts from `~/repos/server-setup/updates/`.
- `color-test`: Print a 24-bit color test in the terminal.


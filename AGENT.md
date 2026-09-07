# Agent Guidelines for fish-config

Guidelines and standards for AI coding assistants working in this repository.

## 1. Indentation & Code Style
- **2 Spaces Indentation**: All Fish shell scripts (`conf.d/*.fish`, `functions/*.fish`) MUST strictly use **2 spaces** for indentation. Never use 4 spaces or tabs.
- Note that Fish's built-in `fish_indent` defaults to 4 spaces. Do not apply unadjusted `fish_indent -w` without normalizing indentation back to 2 spaces.

## 2. Fish Syntax Idioms (Fish 4.0+)
- **Conditionals & Tests**:
  - Use native Fish `test` instead of POSIX `[ ... ]` brackets.
  - Test command execution directly: `if test -x $path`, `if tmux has-session ... 2>/dev/null`, or `cd "$argv"; and list-files`.
- **Safe Printing**:
  - Always quote variable arguments and use `printf '%s\n' "$msg"` or `echo "$msg"`. Avoid passing variables as format specifiers to `printf`.
- **Abbreviations over Aliases**:
  - Prefer `abbr -a` over `alias` for interactive Git, Jujutsu, and shell shortcuts to support auto-expansion and tab completions.
- **Cross-Platform Compatibility**:
  - Support both Linux and macOS (Darwin).
  - Use `rg` instead of `grep`.
  - Handle `fdfind` (Debian/Ubuntu) vs `fd` (macOS/Arch) dynamically.

## 3. Verification Commands
Always validate changes before committing:

```fish
# 1. Syntax check all fish configuration and function files
fish -n conf.d/*.fish functions/*.fish

# 2. Verify indentation: no tabs
rg '^\t' conf.d/ functions/

# 3. Verify indentation: no odd space counts
rg '^ {1}\S|^ {3}\S|^ {5}\S|^ {7}\S' conf.d/ functions/
```

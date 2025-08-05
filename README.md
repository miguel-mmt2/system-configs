# Development Environment Setup

This repository serves as a comprehensive, version-controlled backup of my development environment. It centralizes configuration files, package lists, editor settings, terminal customization, and automation scripts, enabling quick and consistent machine setup or migration.

## Contents

This repository includes:

- **Homebrew** package list (`homebrew/Brewfile`) to manage macOS packages and tools
- **Visual Studio Code** settings and extensions (`vscode/`) for editor consistency
- **Terminal** configuration files (`.zshrc` and related scripts) for shell customization
- **Ghostty** terminal configuration (`ghostty/config.yaml`) for terminal emulator settings
- Optional **macOS system defaults** scripts for system tweaks
- Installation script (`install.sh`) to bootstrap and automate environment setup

## Getting Started

### 1. Clone the Repository

Clone this repository to your preferred location on your development machine:

    git clone https://github.com/yourusername/your-repo-name.git ~/dev-setup
    cd ~/dev-setup

### 2. Run the Setup Script

The included `install.sh` automates initial configuration, including installing packages, setting up configs, and linking dotfiles.

    chmod +x install.sh
    ./install.sh

> Review and customize `install.sh` to fit your system, preferences, or additional tools before running.

## Homebrew

Manage packages easily with Homebrew:

- **Install all packages from Brewfile:**

      brew bundle install --file=homebrew/Brewfile

- **Export your current packages to Brewfile:**

      brew bundle dump --file=homebrew/Brewfile --force

## Visual Studio Code

### Install Extensions

Batch install VS Code extensions listed in `vscode/extensions.txt`:

    xargs -n 1 code --install-extension < vscode/extensions.txt

### Export Current Extensions

Save your current VS Code extensions for future use:

    code --list-extensions > vscode/extensions.txt

### Preferences

This repository stores:

- `vscode/settings.json`
- `vscode/keybindings.json`

Manually copy or symlink these files to your VS Code user settings directory to replicate your editor setup.

## Shell Configuration

This repository backs up your shell environment configurations, including:

- `.zshrc` — main shell config with aliases, functions, and theme setup
- `.bash_profile` — optional bash profile settings
- `.aliases` & `.exports` — additional reusable shell aliases and environment variables

You can customize or symlink these files according to your shell and OS.

### Notable Shell Features

- **Oh My Zsh** with Powerlevel10k theme for a powerful prompt and enhanced usability
- Handy aliases to speed up navigation, git, Docker, Python, ROS, and system management
- Functions to manage Python virtual environments and Conda environments:

  - `env <name>`: Create and activate a Python venv
  - `act <name>`: Activate an existing Python venv
  - `envlist [dir]`: List virtual environments in a directory
  - `cenv <name>`: Create and activate a Conda environment
  - `cact <name>`: Activate a Conda environment

- Integration with `thefuck` for command correction
- Enhanced directory listing using `eza` with icons and git integration

### Example Aliases

    alias ..="cd .."
    alias ll="eza -lah --icons --git"
    alias update="brew update && brew upgrade && brew cleanup"
    alias gs="git status"
    alias dps="docker ps"
    alias deact="deactivate"

## Ghostty Terminal Configuration

The `ghostty/config.yaml` file contains settings to customize the Ghostty terminal emulator, including appearance, layout, and behavior. This supports consistent terminal aesthetics and usability across machines.

## Customization & Extensibility

This repository is designed modularly, allowing you to extend it with additional tools and configurations such as:

- `tmux` for terminal multiplexing
- `neovim` for advanced editing
- Plugins and themes for Oh My Zsh
- CLI utilities like `fzf`, `ripgrep`, or `bat`
- Docker, Kubernetes, or cloud tooling setups

You can maintain global and OS-specific configurations under separate directories or conditional logic in scripts.

## License

This repository is licensed under the MIT License. See the LICENSE file for details.

## Disclaimer

These configurations reflect my personal workflow and preferences. Use them as a starting point and adapt to fit your needs.

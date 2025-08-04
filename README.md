# Development Environment Setup

This repository serves as a version-controlled backup of my development environment. It includes configuration files, package lists, editor settings, and automation scripts to streamline machine setup.
## Contents

This repository includes:

- Homebrew package list (homebrew/Brewfile)
- Visual Studio Code settings and extensions
- Terminal configuration files (.zshrc)
- Optional macOS system defaults
- Installation script for bootstrapping a new machine

## Getting Started

1. Clone the Repository

Clone this repository to your development machine:

    git clone https://github.com/yourusername/your-repo-name.git ~/dev-setup
    cd ~/dev-setup

2. Run the Setup Script

The install.sh script automates initial setup tasks:

    chmod +x install.sh
    ./install.sh

Modify the script to match your system and preferences.

## Homebrew

To install packages listed in the Brewfile:

    brew bundle install --file=homebrew/Brewfile

To generate a new Brewfile from your current setup:

    brew bundle dump --file=homebrew/Brewfile --force

## Visual Studio Code

Install Extensions:

    xargs -n 1 code --install-extension < vscode/extensions.txt

Export Current Extensions:

    code --list-extensions > vscode/extensions.txt

VS Code Preferences:

This repository contains:
- vscode/settings.json
- vscode/keybindings.json

You can manually copy or symlink these to your VS Code user directory.

## Shell Configuration

Shell setup files include:
- .zshrc
- .bash_profile
- .aliases
- .exports

Customize or symlink them as needed for your shell and operating system.

## Git Configuration

A base .gitconfig file is included. Extend it with credentials, aliases, or project-specific overrides.

## macOS Defaults (Optional)

If you're using macOS, you can script system preferences using macos-defaults.sh or integrate them into install.sh.

## Customization

This repository is modular and can be extended with additional tools such as:
- tmux
- neovim
- oh-my-zsh
- fzf
- Docker or CLI utilities

Use a structure that supports both global and OS-specific configurations as needed.

## License

This repository is licensed under the MIT License. See the LICENSE file for more information.

## Disclaimer

These configurations reflect personal preferences and are intended as a starting point for customizing your own environment.

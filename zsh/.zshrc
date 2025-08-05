# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval $(thefuck --alias)



alias ls='eza --icons'
alias ll='eza -lah --icons --git'
alias la='eza -a --icons'
alias lt='eza --tree --icons'

alias ..='cd ..'
alias ...='cd ../..'

alias c='clear'
alias update='brew update && brew upgrade && brew cleanup'
alias reload='source ~/.zshrc'


# Create and activate a python venv by name, or just activate if exists
function env() {
  if [[ -z "$1" ]]; then
    echo "Usage: env <env_name>"
    return 1
  fi

  if [[ ! -d "$1" ]]; then
    echo "Creating virtual environment '$1'..."
    python3 -m venv "$1"
  fi

  echo "Activating virtual environment '$1'..."
  source "$1/bin/activate"
}

# Activate existing python virtual environment by name
function act() {
  if [[ -z "$1" ]]; then
    echo "Usage: act <env_name>"
    return 1
  fi

  if [[ -d "$1" ]]; then
    echo "Activating virtual environment '$1'..."
    source "$1/bin/activate"
  else
    echo "Virtual environment '$1' does not exist."
    return 1
  fi
}

function envlist() {
  local base_dir="${1:-.}"  # Usa o argumento ou diretório atual
  echo "Virtual environments in '$base_dir':"
  echo

  for d in "$base_dir"/*; do
    if [[ -d "$d" && -f "$d/bin/activate" ]]; then
      # Podes adicionar aqui mais checks, como presença de pyvenv.cfg
      echo " - $(basename "$d")"
    fi
  done
}


# Create and activate a Conda environment by name
function cenv() {
  if [[ -z "$1" ]]; then
    echo "Usage: cenv <env_name>"
    return 1
  fi
  echo "Creating Conda environment '$1' with Python 3.11..."
  conda create -n "$1" python=3.11 -y
  echo "Activating Conda environment '$1'..."
  conda activate "$1"
}

# Activate existing Conda environment by name
function cact() {
  if [[ -z "$1" ]]; then
    echo "Usage: cact <env_name>"
    return 1
  fi
  echo "Activating Conda environment '$1'..."
  conda activate "$1"
}



# System updates and management
alias update="brew update && brew upgrade"
alias ports="lsof -i -P -n | grep LISTEN"

# Python shortcuts
alias python="python3"
alias pip="pip3"
alias py="python3"
alias serve="python3 -m http.server"

# Git shortcuts
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gco="git checkout"
alias gb="git branch"
alias gd="git diff"
alias gl="git log --oneline --graph --decorate --all"
alias gp="git push"
alias gpl="git pull"
alias gcl="git clone"

# Docker shortcuts
alias d="docker"
alias dps="docker ps"
alias dpa="docker ps -a"
alias di="docker images"
alias drm="docker rm"
alias drmi="docker rmi"
alias db="docker build -t"
alias dup="docker-compose up"
alias ddown="docker-compose down"

# Python virtual environments
alias deact="deactivate"
alias req="pip freeze > requirements.txt"
alias install="pip install -r requirements.txt"

# ROS (Robot Operating System) shortcuts
alias src="source install/setup.bash"
alias srcws="cd ~/ros2_ws && source install/setup.bash"
alias build="colcon build --symlink-install"
alias cb="colcon build --symlink-install && source install/setup.bash"
alias rqt="rqt --force-discover"
alias rviz="rviz2"
alias roslist="ros2 topic list"
alias rostele="ros2 topic echo"

# Productivity
alias histg="history | grep"
alias findpy="find . -name '*.py'"
alias findcpp="find . -name '*.cpp'"

# Directory shortcuts
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias doc="cd ~/Documents"
alias proj="cd ~/Projects"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Skip verification of insecure directories (for plugins)
ZSH_DISABLE_COMPFIX=true

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Support 256 colors path
export TERM="xterm-256color"

# --------------------------- Custom paths ------------------------------------

# nvm path
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ------------------------------ Theme ----------------------------------------
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# ----------------------------- Plugins ---------------------------------------
# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  colored-man-pages
  extract
  git
  github
)

source $ZSH/oh-my-zsh.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -Uz compinit

POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# --------------------------- Custom aliases ----------------------------------
# Update Ubuntu packages
alias update="sudo apt update && sudo apt upgrade"

# List npm packages installed globally
alias npmlist="npm list -g --depth=0"

# Update npm packages globally
alias npmupdate="npm update -g"

# Undo the last commit
alias uncommit="git reset HEAD~1"

# Copy ssh
alias copyssh="clip.exe < ~/.ssh/id_rsa.pub | echo '=> Public key copied to pasteboard.'"

# Open Explorer in current folder
alias explorer="explorer.exe ."

# Open .zshrc in VSCode
alias zshconfig="code ~/.zshrc"

# Source .zshrc
alias zshup="source ~/.zshrc"

# Windows Powershell
# alias pwsh="/usr/share/PowerShell/pwsh"

# --------------------------- Custom functions --------------------------------
# ssh-agent
if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent`
    ssh-add
fi

# set DISPLAY variable to the IP automatically assigned to WSL2
# export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
# sudo /etc/init.d/dbus start &> /dev/null

# Grant passwordless access for dbus
# -------------------------------------------------------------------------------------------
# Run the following command:
# sudo visudo -f /etc/sudoers.d/dbus
#
# Replace the user name, enter the following line into the text editor, save & close the file:
# <your_username> ALL = (root) NOPASSWD: /etc/init.d/dbus
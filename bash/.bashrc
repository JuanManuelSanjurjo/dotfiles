export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$HOME/.cargo/bin:$PATH"
export LANG=en_US.UTF-8
export EDITOR=nvim
export PATH="$HOME/.local/bin:$PATH"

#
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Enable fzf tab completion and key bindings
source /usr/share/doc/fzf/examples/key-bindings.bash

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

########### BINDINGS ###########
# bind '"\C-a": "nvims\n"' # Ctrl-a is bind to go to start of line in shell

########### ALIASES ###########
alias zz='z -'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias tf='tmuxifier'
alias ls='exa -alh'
alias tree='exa --tree --icons --group-directories-first --ignore-glob="node_modules|dist"'
## Tree only directories and excluding node_modules and dist
alias treedir='exa --tree -D --ignore-glob="node_modules|dist"'
alias rg='rg -i --color=always'

# Alias for nvim distributions
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-kick="NVIM_APPNAME=kickstart nvim"
alias nvim-chad="NVIM_APPNAME=NvChad nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"
alias nvimc="nvim --clean"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# # enable programmable completion features (you don't need to enable
# # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# # sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

########### FUNCTIONS ###########
# Función para usar fzf con previsualización usando bat
f() {
	fzf --reverse --border=rounded --height=95% --preview 'batcat --color=always --style=numbers --line-range :500 {}' --preview-window right:50% "$@"
}

# Función para abrir archivos con bat utilizando fzf
batf() {
	batcat "$(f)"
}

# Alias para abrir archivos con vim/nvim usando fzf
vimf() {
	vim "$(f)"
}

nvimf() {
	nvim "$(f)"
}

# Cambiar al directorio padre del archivo seleccionado con fzf
cdf() {
	cd "$(dirname "$(f)")"
}

# Opens directory in explorer.exe with zis
open() {
	# Detectar si estamos en WSL
	if grep -qi microsoft /proc/version; then
		cd "$dir" || return 1
		explorer.exe . # Abre en el Explorador de Windows
	else
		# Detectar qué explorador está disponible
		if command -v dolphin &>/dev/null; then # nohup permite que el proceso siga ejecutandose incluso cerrando la terminal
			nohup dolphin "$dir" >/dev/null 2>&1 &
		elif command -v thunar &>/dev/null; then
			nohup thunar "$dir" >/dev/null 2>&1 &
		elif command -v nautilus &>/dev/null; then
			nohup nautilus "$dir" >/dev/null 2>&1 &
		else
			echo "No file manager found!"
			return 1
		fi
	fi
}

# Function to select nvim distribution
nvims() {
	items=("default" "LazyVim" "NvChad" "kickstart" "AstroNvim")
	config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Select Neovim config: " --reverse --border=rounded --height=20% --exit-0)
	if [[ -z "$config" ]]; then
		echo "No nvim distribution selected"
		return 0
	elif [[ $config == "default" ]]; then
		config=""
	fi
	NVIM_APPNAME=$config nvim "$@"
}

# Opens tmuxifier session with nvim/terminal/lazygit layout
editor() {
	tmuxifier s nvim2term
}

# Configurar tmuxifier
export PATH="$HOME/.tmuxifier/bin:$PATH"


# Mostrar una lista de macros disponibles
macros() {
	echo "Available macros for $USER Bash"
	echo "Command | Description"
	echo "-----------------------------"
	echo " z        - cd into directory using zoxide"
	echo " zz       - cd into last directory"
	echo " zi       - Interactive cd into directory using zoxide"
	echo " f        - Search file using fzf and bat preview"
	echo " ctrl - r - Search for command history using fzf"
	echo " ctrl - t - Search and paste selected path"
	echo " alt - c  - cd into selected directory"
	echo " cdf      - Change directory to the parent of the file using fzf"
	echo " batf     - Search with fzf and open file using bat"
	echo " nvimf    - Search and open file using nvim"
	echo " tf       - Run tmuxifier"
	echo " vimf     - Search and open file using vim"
	echo " lfcd     - Change directory on quit using LF"
	echo " rg       - Search with ripgrep case insensitive"
	echo " editor   - Opens tmuxifier session with nvim/terminal/lazygit layout "
	echo " nvims    - Opens fzf dialog to choose config "
	echo " open     - Opens selected folder in explorer.exe with zi"
}

# Configurar el tema de bat
export BAT_THEME="OneHalfDark"

# Inicializar zoxide starship tmuxifier
eval "$(tmuxifier init -)"
eval "$(zoxide init bash)"
eval "$(starship init bash)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
export PATH="$HOME/.nvm/versions/node/v20.17.0/bin:$PATH"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/devendra/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
. "$HOME/.cargo/env"
export PATH="$HOME/.local/bin:$PATH"

# opencode
export PATH=/home/devendra/.opencode/bin:$PATH

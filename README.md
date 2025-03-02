# Stow dotfiles

Clone this repo to your home directory, cd into it and run the following command:

`stow --adopt .`

This will create a symlink to the dotfiles in your home directory and will update the symlink when you make changes to the dotfiles.

the `--adopt` flag will overwrite any existing files in your home directory with the files in the dotfiles repo.

## Software to install

### Core

- neovim
- lazyvim
- lazygit
- starship/oh-my-bash
- tmux
- tmuxifier (with tpm plugin manager)
- pnpm

### Utilities

- bat
- less
- exa
- fd
- fzf
- lf
- ripgrep
- zoxide
- neofetch
- btop
- posting (terminal http client) curl
- ranger / yazi / superfile / mc / nnn (file managers)

#### Get the list of packages installed manually via apt o pacman

APT:
`comm -23 <(apt-mark showmanual | sort) <(apt-mark showauto | sort)`

PACMAN:
`pacman -Qe`

CURRENT LIST:
bash-completion bat btop cargo curl diffutils exa fdclone fd-find ffmpeg findutils fish fzf gh grep gzip luarocks mc neofetch neovim nnn ranger ripgrep stow tmux tree zoxide
zsh

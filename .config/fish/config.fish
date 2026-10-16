function fish_greeting
end

### ALIASES ###
# navigation
alias cdd="cd ~/vault"

# python
alias py="python3"
alias venv="source .venv/bin/activate.fish"

# neovim
alias vim="nvim"
alias vi="nvim"
alias v="nvim"

# eza
alias ls="eza -l"

#distrobox
alias db="distrobox"

### PATH VARIABLES ###
fish_add_path ~/go/bin
fish_add_path ~/apps

# launch starship
starship init fish | source

# launch zoxide
zoxide init fish | source

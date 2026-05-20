export ZSH="$HOME/.oh-my-zsh"

plugins=(git)

source $ZSH/oh-my-zsh.sh
unset LS_COLORS

export PATH="$HOME/.local/bin:$PATH"
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export EZA_CONFIG_DIR="$HOME/.config/eza"

alias nv='nvim .'
alias rc='nvim ~/.zshrc'
alias ls="eza --icons=always --long --git --no-filesize --color=always --no-time --no-user --no-permissions"
alias cc='claude'

eval "$(oh-my-posh init zsh --config ~/.oh-my-posh/config.json)"

eval "$(fzf --zsh)"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden --exclude .git"

fcd() { cd "$(FZF_DEFAULT_COMMAND='' fzf --walker=dir,hidden --walker-skip=.git,node_modules,__pycache__)" }
fv() { nvim "$(FZF_DEFAULT_COMMAND='' fzf --walker=file,hidden --walker-skip=.git,node_modules,__pycache__)" }

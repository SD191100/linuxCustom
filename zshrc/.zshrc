# Lines configured by zsh-newuser-install
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tanjiro/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U colors && colors
PS1="%{$fg[green]%}%n%{$reset_color%}:%{$fg[cyan]%}%m %{$fg[white]%}%~ %{$reset_color%}%% "

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.cargo/bin:$PATH"

#  Generate Colorscripts (needs shell-color-scripts from gitlab/dwt1)
my_array=("bars" "alpha" "six" "bloks" "crunchbang" "blocks1" "panes" "colorbars" "square" "ghosts" "crunch")
array_length=${#my_array}
random_number=$(( (RANDOM % $array_length) + 1 ))
colorscript -e $my_array[$random_number]

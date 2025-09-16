# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"
# Source manjaro-zsh-configuration
# if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
#   source /usr/share/zsh/manjaro-zsh-config
# fi
# # Use manjaro zsh prompt
# if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
#   source /usr/share/zsh/manjaro-zsh-prompt
# fi
#
path+=('/home/mumbly/bin')
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"

if [[ -e ~/.config/just/completions.zsh ]]; then
  source ~/.config/just/completions.zsh
fi



# theme
set -g theme_nerd_fonts yes

# view
set -g theme_display_date yes
set -g theme_date_format "+%F %H:%M"
set -g theme_display_git_default_branch yes
set -g theme_color_scheme nord

if type -q hostname && test (hostname) = "AD11340"
	set -x http_proxy http://192.168.91.4:8080
	set -x https_proxy http://192.168.91.4:8080
end

neofetch

## environment variables
# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

set --export EDITOR nvim
set --export TERM foot

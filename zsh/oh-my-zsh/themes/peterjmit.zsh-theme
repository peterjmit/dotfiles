# ------------------------------------------------------------------------------
#          FILE:  peterjmit.zsh-theme
#   DESCRIPTION:  oh-my-zsh theme file.
#        AUTHOR:  Peter Mitchell <pete@peterjmit.com>
#       VERSION:  1.0.0
#    SCREENSHOT:
# ------------------------------------------------------------------------------

solarized_base03=$FG[234]
solarized_base02=$FG[235]
solarized_base01=$FG[239]
solarized_base00=$FG[240]
solarized_base0=$FG[244]
solarized_base1=$FG[245]
solarized_base2=$FG[187]
solarized_base3=$FG[230]
solarized_yellow=$FG[136]
solarized_orange=$FG[166]
solarized_red=$FG[124]
solarized_magenta=$FG[125]
solarized_violet=$FG[061]
solarized_blue=$FG[033]
solarized_cyan=$FG[037]
solarized_green=$FG[064]

PROMPT='%{$solarized_base00%}%m%{$reset_color%} » %{$solarized_violet%}%~%{$reset_color%} $(git_prompt_info)
→ '

ZSH_THEME_GIT_PROMPT_PREFIX="[git:%{$solarized_yellow%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$solarized_red%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# display exitcode on the right when >0
return_code="%(?..%{$solarized_red%}%? ↵%{$reset_color%})"

RPROMPT='${return_code}$(git_prompt_status)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_ADDED="%{$solarized_green%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$solarized_blue%} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$solarized_red%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$solarized_magenta%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$solarized_yellow%} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$solarized_cyan%} ✭"


function last_result {
    if [ $? -eq 0 ]
    then
        echo "🐳" && return
    else
        echo "❌"
    fi
}

#function emoji_char {
#    #git branch >/dev/null 2>/dev/null && echo '?~_~X?' && return
#    echo '🐳'
#}

function date {
    echo "%B%F{208}%D{%e %b}%f%b"
}

function working_directory {
    echo "%B%F{red}%1d %#%f%b"
}

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "
ZSH_THEME_GIT_PROMPT_SEPARATOR=""
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_STAGED=" %{$fg[red]%}🚀 "
ZSH_THEME_GIT_PROMPT_CONFLICTS=" %{$fg[red]%}❌"
ZSH_THEME_GIT_PROMPT_CHANGED=" %{$fg[blue]%}%{✚%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="⬇️"
ZSH_THEME_GIT_PROMPT_AHEAD="⬆️"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$fg[brown]%}💩 "
ZSH_THEME_GIT_PROMPT_STASHED=" %{$fg_bold[blue]%}📒 "
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_bold[green]%}✅"

PROMPT='$(last_result)  $(date) $(working_directory) $(git_super_status)'
RPROMPT=""
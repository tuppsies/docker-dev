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
    echo "%F{208}%D{%e %b}%f"
}

function working_directory {
    echo "%F{red}%1d %#%f"
}

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "
ZSH_THEME_GIT_PROMPT_SEPARATOR=""
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_STAGED=" %{$fg[red]%}🚀 "
ZSH_THEME_GIT_PROMPT_CONFLICTS=" %{$fg[red]%}❌"
ZSH_THEME_GIT_PROMPT_CHANGED=" %{$fg[blue]%}%{✚%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="⬇️"
ZSH_THEME_GIT_PROMPT_AHEAD="⬆️"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$fg[brown]%}💩 "
ZSH_THEME_GIT_PROMPT_STASHED=" %{$fg[blue]%}📒 "
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✅"

PROMPT='$(last_result)  $(date) $(working_directory) $(git_super_status)'
RPROMPT=""
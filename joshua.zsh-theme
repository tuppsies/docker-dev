function last_result {
    if [ $? -eq 0 ]
    then
        echo "✅" && return
    else
        echo "❌"
    fi
}

function emoji_char {
    #git branch >/dev/null 2>/dev/null && echo '?~_~X?' && return
    echo '🐳'
}

ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{199}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f%b "
ZSH_THEME_GIT_PROMPT_DIRTY=" 💩"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✅"

PROMPT='$(emoji_char)  %B%F{208}%D{%a %e %b}%f %F{red}%d %#%f%b $(git_prompt_info)'
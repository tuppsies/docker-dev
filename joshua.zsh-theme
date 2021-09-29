function last_result {
    if [ $? -eq 0 ]
    then
        echo "✅" && return
    else
        echo "❌"
    fi
}

function emoji_char {
    git branch >/dev/null 2>/dev/null && echo '😺' && return
    echo '🔥'
}


PROMPT='$(last_result) $(emoji_char) %? %B%F{208}%D{%a %e %b}%f %F{red}%d %#%f%b '
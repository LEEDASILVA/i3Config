#!/usr/bin/env bash

# exit on error, undefined vars, and pipe failures
set -euo pipefail

# dependency check
check_dependencies() {
    local deps=("dmenu" "xclip" "notify-send")
    for dep in "${deps[@]}"; do
        if ! command -v "$dep" >/dev/null 2>&1; then
            notify-send "Error" "Required dependency '$dep' is not installed."
            exit 1
        fi
    done
}

# Function to show dmenu and handle selection
show_dmenu() {
    local prompt="$1"
    local options="$2"
    echo "$options" | dmenu -i -p "$prompt" || exit 1
}

# insert into clipboard
handle_selection() {
    local char="$1"
    printf "%s" "$char" | xclip -selection clipboard
    notify-send "Character copied" "$char"
}

declare -A accent_map=(
    [a]=$'á\nà\nâ\nä\nã\nÁ\nÀ\nÂ\nÄ\nÃ'
    [e]=$'é\nè\nê\në\nÉ\nÈ\nÊ\nË'
    [i]=$'í\nì\nî\nï\nÍ\nÌ\nÎ\nÏ'
    [o]=$'ó\nò\nô\nö\nõ\nÓ\nÒ\nÔ\nÖ\nÕ'
    [u]=$'ú\nù\nû\nü\nÚ\nÙ\nÛ\nÜ'
    [n]=$'ñ\nÑ'
    [c]=$'ç\nÇ'
    [y]=$'ý\nÿ\nÝ\nŸ'
)

main() {
    check_dependencies

    local letters
    letters=$(printf "%s\n" "${!accent_map[@]}" | sort)

    local chosen_letter
    chosen_letter=$(show_dmenu "Choose a letter:" "$letters")

    if [[ ! -v accent_map[$chosen_letter] ]]; then
        notify-send "Error" "Invalid letter chosen"
        exit 1
    fi

    local chosen_accent
    chosen_accent=$(show_dmenu "Choose an accent for '$chosen_letter':" "${accent_map[$chosen_letter]}")

    if [[ -n "$chosen_accent" ]]; then
        handle_selection "$chosen_accent"
    fi
}

main
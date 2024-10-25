#!/bin/bash

letters="a\ne\ni\no\nu\nc\nA\nE\nI\nO\nU\nC"

chosen_letter=$(echo -e "$letters" | dmenu -i -p "Choose a letter:")

case "$chosen_letter" in
  a) accents="á\nÁ\nÂ\nä\nÄ" ;;
  A) accents="À\nà\nâ\nä\nã" ;;
  e) accents="é\nè\nê\në" ;;
  E) accents="È\nÉ\nÊ\nË" ;;
  i) accents="í\nì\nî\nï" ;;
  I) accents="Ì\nÍ\nÎ\nÏ" ;;
  o) accents="ó\nò\nô\nö\nõ" ;;
  O) accents="ó\nÒ\nÔ\nÖ\nÕ" ;;
  u) accents="ú\nù\nû\nü" ;;
  U) accents="Ù\nÚ\nÛ\nÜ" ;;
  c) accents="ç" ;;
  C) accents="Ç" ;;
  *) notify-send "Error" "Invalid letter chosen"; exit 1 ;;
esac

chosen_accent=$(echo -e "$accents" | dmenu -i -p "Choose an accent for '$chosen_letter':")

if [ -n "$chosen_accent" ]; then
  echo -n "$chosen_accent" | xclip -selection clipboard
  notify-send "Copied to clipboard" "$chosen_accent"
fi

# BACK TIC
# à, è, ì, ò, ù
# À, È, Ì, Ò, Ù

# FRONT TICK
# á, é, í, ó, ú, ý
# Á, É, Í, Ó, Ú, Ý

# CIRCUMFLEX
# â, ê, î, ô, û
# Â, Ê, Î, Ô, Û

# TIL
# ã, ñ, õ
# Ã, Ñ, Õ

# CEDILLA
# ç, Ç

# TREMA
# ä, ë, ï, ö, ü, ÿ
# Ä, Ë, Ï, Ö, Ü, Ÿ


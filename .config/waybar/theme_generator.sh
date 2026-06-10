#!/usr/bin/env bash

STYLE_FILE="$HOME/.config/waybar/style.css"

if [ "$1" == "reset" ]; then
    sed -i "s/@define-color bg-main .*/@define-color bg-main #1c1c1c;/" "$STYLE_FILE"
    sed -i "s/@define-color bg-hover .*/@define-color bg-hover #333333;/" "$STYLE_FILE"
    sed -i "s/@define-color text-main .*/@define-color text-main #eeeeee;/" "$STYLE_FILE"
    sed -i "s/@define-color text-accent .*/@define-color text-accent #ffffff;/" "$STYLE_FILE"
    pkill -USR2 waybar
    exit 0
fi

CHOSEN_COLOR=$(yad --color --title="Waybar Color" --window-icon="color-picker" --width=350 --height=400)
if [ -z "$CHOSEN_COLOR" ]; then exit 1; fi

HEX_COLOR=$(echo "$CHOSEN_COLOR" | grep -oE '#[0-9a-fA-F]{6}')
if [ -z "$HEX_COLOR" ]; then exit 1; fi

R_HEX=$(echo "$HEX_COLOR" | cut -c 2-3)
G_HEX=$(echo "$HEX_COLOR" | cut -c 4-5)
B_HEX=$(echo "$HEX_COLOR" | cut -c 6-7)

R_DEC=$((16#$R_HEX))
G_DEC=$((16#$G_HEX))
B_DEC=$((16#$B_HEX))

R_BG=$(( R_DEC * 15 / 100 ))
G_BG=$(( G_DEC * 15 / 100 ))
B_BG=$(( B_DEC * 15 / 100 ))

R_HOVER=$(( R_DEC * 30 / 100 ))
G_HOVER=$(( G_DEC * 30 / 100 ))
B_HOVER=$(( B_DEC * 30 / 100 ))

R_TXT=$(( R_DEC + (255 - R_DEC) * 60 / 100 ))
G_TXT=$(( G_DEC + (255 - G_DEC) * 60 / 100 ))
B_TXT=$(( B_DEC + (255 - B_DEC) * 60 / 100 ))

BG_MAIN=$(printf "#%02x%02x%02x" $R_BG $G_BG $B_BG)
BG_HOVER=$(printf "#%02x%02x%02x" $R_HOVER $G_HOVER $B_HOVER)
TEXT_MAIN=$(printf "#%02x%02x%02x" $R_TXT $G_TXT $B_TXT)
TEXT_ACCENT=$HEX_COLOR

sed -i "s/@define-color bg-main .*/@define-color bg-main $BG_MAIN;/" "$STYLE_FILE"
sed -i "s/@define-color bg-hover .*/@define-color bg-hover $BG_HOVER;/" "$STYLE_FILE"
sed -i "s/@define-color text-main .*/@define-color text-main $TEXT_MAIN;/" "$STYLE_FILE"
sed -i "s/@define-color text-accent .*/@define-color text-accent $TEXT_ACCENT;/" "$STYLE_FILE"

pkill -USR2 waybar

#!/usr/bin/env bash
set -euo pipefail

EWW_BIN="${EWW_BIN:-eww}"
POPW=180
OFFY=28

# Cursor-Position (Hyprland)
pos="$(hyprctl cursorpos | tr -d ',')"
X="$(awk '{print $1}' <<<"$pos")"
Y="$(awk '{print $2}' <<<"$pos")"

# Popup mittig unter Cursor platzieren
XP=$(( X - POPW / 2 ))
YP=$(( Y + OFFY ))

# Clamp (nicht negativ)
if [ "$XP" -lt 0 ]; then XP=0; fi
if [ "$YP" -lt 0 ]; then YP=0; fi

$EWW_BIN update pow_x="$XP" pow_y="$YP"
$EWW_BIN open --toggle powermenu

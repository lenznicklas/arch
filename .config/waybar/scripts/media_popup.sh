#!/usr/bin/env bash
set -euo pipefail

fmt_time() {
  local s="${1:-0}"
  # sicherstellen, dass es eine Zahl ist
  s="$(printf "%.0f" "$s" 2>/dev/null || echo 0)"
  printf "%d:%02d" $((s/60)) $((s%60))
}

msg="Kein MPRIS-Player aktiv."

if playerctl status >/dev/null 2>&1; then
  player="$(playerctl -l 2>/dev/null | head -n1 || true)"
  status="$(playerctl status 2>/dev/null || true)"
  artist="$(playerctl metadata artist 2>/dev/null || true)"
  title="$(playerctl metadata title 2>/dev/null || true)"
  album="$(playerctl metadata album 2>/dev/null || true)"

  # position in Sekunden
  pos="$(playerctl position 2>/dev/null || echo 0)"

  # mpris:length ist in Mikrosekunden
  len_us="$(playerctl metadata mpris:length 2>/dev/null || echo 0)"
  len="$(awk -v u="$len_us" 'BEGIN{ if(u+0>0) printf "%.0f", u/1000000; else print 0 }')"

  line1="🎵 ${artist:-Unbekannt} – ${title:-Unbekannt}"
  line2="${album:-}"
  line3="${status:-}  $(fmt_time "$pos")/$(fmt_time "$len")"
  line4="Player: ${player:-?}"

  msg="$line1\n$line2\n$line3\n$line4"
fi

# Popup (Wayland-friendly)
rofi -e "$msg"

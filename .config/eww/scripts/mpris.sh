#!/usr/bin/env bash
set -euo pipefail

if ! command -v playerctl >/dev/null 2>&1; then
  echo "playerctl fehlt"
  exit 0
fi

if ! playerctl status >/dev/null 2>&1; then
  echo "Kein Player aktiv"
  exit 0
fi

artist="$(playerctl metadata artist 2>/dev/null || true)"
title="$(playerctl metadata title 2>/dev/null || true)"
album="$(playerctl metadata album 2>/dev/null || true)"
status="$(playerctl status 2>/dev/null || true)"

line="🎵 ${artist:-Unbekannt} – ${title:-Unbekannt}"
[ -n "${album:-}" ] && line="$line\n💿 $album"
line="$line\n▶ $status"

echo -e "$line"

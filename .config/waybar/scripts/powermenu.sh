#!/usr/bin/env bash

chosen=$(printf "  Lock\n󰒲  Suspend\n  Shutdown\n󰗼  Exit\n󰐥  Hibernate\n󰜉  Reboot" | \
rofi -dmenu \
    -i \
    -p "" \
    -theme ~/.config/rofi/powermenu.rasi)

case "$chosen" in
  *Lock) hyprlock ;;
  *Suspend) systemctl suspend ;;
  *Shutdown) systemctl poweroff ;;
  *Exit) hyprctl dispatch exit ;;
  *Hibernate) systemctl hibernate ;;
  *Reboot) systemctl reboot ;;
esac

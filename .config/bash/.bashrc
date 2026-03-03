# ~/.dotfiles/.config/bash/.bashrc

# Only run in interactive shells
[[ $- != *i* ]] && return

# ---------- Minimal Powerline Prompt: [dir] -> [~] -> [time] ----------
__pill_prompt() {
  # Colors (RGB). Adjust to taste.
  local BG_DIR="48;2;64;80;92"        # directory segment background
  local FG_DIR="38;2;230;235;240"     # directory + "~" text

  local BG_MID="48;2;76;140;150"      # middle segment background (for "~" + transition)
  local BG_TIME="48;2;54;170;160"     # time segment background
  local FG_TIME="38;2;12;18;18"       # time text (dark)

  # Nerd Font glyphs
  local SEP=$'\ue0b0'  # 
  local R=$'\ue0b4'    # 

  # Only current folder (Home => ~)
  local dir
  if [[ "$PWD" == "$HOME" ]]; then
    dir="~"
  else
    dir="${PWD##*/}"
  fi

  local t
  t="$(date +%H:%M)"

  # One blank line before prompt so pillboxes don't touch
  PS1=$'\n'

  # Stick to the left edge, NO left-cap glyph
  PS1+="\[\e[${BG_DIR};${FG_DIR}m\] ${dir} \[\e[0m\]"

  # Multi-step arrow transition + "~" segment
  PS1+="\[\e[38;2;64;80;92m\]\[\e[${BG_MID}m\]${SEP}\[\e[0m\]"
  PS1+="\[\e[${BG_MID};${FG_DIR}m\] ~ \[\e[0m\]"
  PS1+="\[\e[38;2;76;140;150m\]\[\e[${BG_TIME}m\]${SEP}\[\e[0m\]"

  # Time segment with rounded right end
  PS1+="\[\e[${BG_TIME};${FG_TIME}m\] ${t} \[\e[0m\]\[\e[38;2;54;170;160m\]${R}\[\e[0m\] "
}

PROMPT_COMMAND="__pill_prompt"


# ---------- Auto fastfetch on terminal start (once per session) ----------
if command -v fastfetch >/dev/null 2>&1; then
  if [[ -t 1 && -z "${FASTFETCH_SHOWN:-}" ]]; then
    export FASTFETCH_SHOWN=1
    fastfetch
  fi
fi

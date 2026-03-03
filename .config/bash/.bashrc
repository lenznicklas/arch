# ----- Powerline prompt ohne linke Kappe + mit Abstand -----
__pill_prompt() {

  # Farben
  local BG_DIR="48;2;64;80;92"
  local FG_DIR="38;2;230;235;240"

  local BG_MID="48;2;76;140;150"
  local BG_TIME="48;2;54;170;160"
  local FG_TIME="38;2;12;18;18"

  local SEP=$'\ue0b0'  # 
  local R=$'\ue0b4'    # 

  # Nur aktueller Ordner
  local dir
  if [[ "$PWD" == "$HOME" ]]; then
    dir="~"
  else
    dir="${PWD##*/}"
  fi

  local t
  t="$(date +%H:%M)"

  # Leerzeile für Abstand zwischen Prompts
  PS1=$'\n'

  # Linker Abstand (damit es nicht am Rand klebt)
  PS1+="  "

  # DIR Segment (ohne runde linke Kappe)
  PS1+="\[\e[${BG_DIR};${FG_DIR}m\] ${dir} \[\e[0m\]"

  # Übergang 1
  PS1+="\[\e[38;2;64;80;92m\]\[\e[${BG_MID}m\]${SEP}\[\e[0m\]"

  # "~" Segment
  PS1+="\[\e[${BG_MID};${FG_DIR}m\] ~ \[\e[0m\]"

  # Übergang 2
  PS1+="\[\e[38;2;76;140;150m\]\[\e[${BG_TIME}m\]${SEP}\[\e[0m\]"

  # TIME Segment (runde rechte Kappe bleibt)
  PS1+="\[\e[${BG_TIME};${FG_TIME}m\] ${t} \[\e[0m\]\[\e[38;2;54;170;160m\]${R}\[\e[0m\] "
}

PROMPT_COMMAND="__pill_prompt"


# ----- fastfetch -----
if command -v fastfetch >/dev/null 2>&1; then
  if [[ -t 1 && -z "${FASTFETCH_SHOWN:-}" ]]; then
    export FASTFETCH_SHOWN=1
    fastfetch
  fi
fi

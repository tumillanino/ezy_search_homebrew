fzf_brew_install() {
  local selected_formula
  selected_formula=$(brew search | fzf --height=97% --layout=reverse --preview 'brew info {}')

  if [[ -n "$selected_formula" ]]; then
    LBUFFER+=" $selected_formula"
  fi
  zle reset-prompt
}

zle -N fzf_brew_install
bindkey '^P' fzf_brew_install

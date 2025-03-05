

fzf_github_search() {
  local selected_repo
  selected_repo=$(gh search repos "" --limit 50 --json fullName,url --jq '.[] | "\(.fullName) \(.url)"' | \
    fzf --height=97% --layout=reverse --preview 'echo {} | awk "{print \$2}" | xargs curl -sL | head -n 20')

  if [[ -n "$selected_repo" ]]; then
    LBUFFER+=" $(echo "$selected_repo" | awk '{print $2}')"
  fi
  zle reset-prompt
}

zle -N fzf_github_search
bindkey '^G' fzf_github_search

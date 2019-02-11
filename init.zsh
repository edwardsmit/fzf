# Assume brew installed fzf
# -------------------------
fzf_base="$(brew --prefix fzf 2>/dev/null)"
fzf_shell="${fzf_base}/shell"

# Setup fzf
# ---------
if ! (( ${+commands[fzf]} )) && [[ ! "$PATH" == *$fzf_base/bin* ]]; then
  export PATH="$PATH:$fzf_base/bin"
fi

# Auto-completion
# ---------------
if [[ ! "$DISABLE_FZF_AUTO_COMPLETION" == "true" ]]; then
  [[ $- == *i* ]] && source "${fzf_shell}/completion.zsh" 2> /dev/null
fi

# Key bindings
# ------------
if [[ ! "$DISABLE_FZF_KEY_BINDINGS" == "true" ]]; then
  source "${fzf_shell}/key-bindings.zsh"
fi

unset fzf_base fzf_shell

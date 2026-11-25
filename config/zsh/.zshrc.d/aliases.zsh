# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."


# Editor / git / k8s

# cat → bat (syntax-highlighted) if installed. --paging=never keeps it
# drop-in compatible with the cat use case (piping, $(cat foo), etc.).
if command -v bat >/dev/null 2>&1; then
  alias cat="bat --paging=never"
fi

# Guardrails — interactive prompts on destructive ops
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

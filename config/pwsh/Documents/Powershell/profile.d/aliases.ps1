# PowerShell-flavored equivalents of the zsh aliases.

# Navigation
function . { Set-Location .. }
function .. { Set-Location ../.. }

# Editor
if (Get-Command nvim -ErrorAction SilentlyContinue) {
    Set-Alias vim nvim
}

# Misc
Set-Alias which Get-Command
function gstatus { git status -sb @args }
function gpush { git push @args }
function glog { git log --oneline --graph --decorate -20 @args }

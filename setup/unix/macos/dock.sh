#!/usr/bin/env bash

# Check for dockutil since it is not there by default
if ! command -v dockutil >/dev/null 2>&1; then
  brew install dockutil
fi

# Remove pre-existing objects from the dock
dockutil --no-restart --remove all

# Add desired objects
apps=(
  "/System/Applications/Mission Control.app"
  "/Applications/Windows App.app"
  "/System/Applications/Shortcuts.app"
  "/System/Applications/Utilities/Terminal.app"
  "/Applications/Safari.app"
  "/Applications/Visual Studio Code.app"
  "/Applications/GitHub Desktop.app"
  "/Applications/Cyberduck.app"
  "/System/Applications/Messages.app"
  "/Applications/Discord.app"
  "/Applications/YACReaderLibrary.app"
  "/System/Applications/Calendar.app"
  "/System/Applications/Reminders.app"
  "/System/Applications/Notes.app"
  "/System/Applications/Mail.app"
  "/System/Applications/Music.app"
)

for app in "${apps[@]}"; do
  if [[ -e "$app" ]]; then
    dockutil --no-restart --add "$app"
  else
    echo "Skipping missing app: $app"
  fi
done

# Ddd Downloads folder
dockutil --no-restart --add "$HOME/Downloads"

killall Dock

echo
echo "Dock configured successfully!"
echo
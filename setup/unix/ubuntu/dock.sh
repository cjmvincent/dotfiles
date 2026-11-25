#!/usr/bin/env bash

apps=(
  "org.remmina.Remmina.desktop"
  "org.gnome.Ptyxis.desktop org.gnome.Terminal.desktop"
  "firefox_firefox.desktop firefox.desktop org.mozilla.firefox.desktop"
  "code.desktop code_code.desktop com.visualstudio.code.desktop"
  "filezilla.desktop org.filezillaproject.Filezilla.desktop"
  "discord.desktop discord_discord.desktop com.discordapp.Discord.desktop"
  "YACReaderLibrary.desktop yacreaderlibrary.desktop com.yacreader.YACReader.desktop"
)

# Where apt, snap and flatpak put .desktop files
app_dirs=(
  "/usr/share/applications"
  "/usr/local/share/applications"
  "$HOME/.local/share/applications"
  "/var/lib/snapd/desktop/applications"
  "/var/lib/flatpak/exports/share/applications"
  "$HOME/.local/share/flatpak/exports/share/applications"
)

favorites=""
for entry in "${apps[@]}"; do
  found=""
  read -ra candidates <<< "$entry"
  for name in "${candidates[@]}"; do
    for dir in "${app_dirs[@]}"; do
      if [[ -f "$dir/$name" ]]; then
        found="$name"
        break 2
      fi
    done
  done

  if [[ -n "$found" ]]; then
    favorites+="${favorites:+, }'$found'"
  else
    echo "Skipping missing app: ${candidates[0]}"
  fi
done

gsettings set org.gnome.shell favorite-apps "[$favorites]"

echo
echo "Dock configured successfully!"
echo
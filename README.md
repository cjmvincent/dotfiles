## About this project

This is an amalgation of all my seperate repos for managing different flavors of OS.  Since I've invested so much time into a curation of tools, terminals, themes, and such I decided it was time to really invest in it; and that investment meant backing it all up and syncing it across all those OSes.

## Quickstart

You can get started with host set up by running one of the following scripts appropriately. The scripts are programmed to name hosts, apply OS defaults, install and update package managers, and any package dependencies as well as suites of tools I use on a regular basis. Additionally, at the end of either script will be a block that will install/symlink my .dotfiles which can be found in ./config.

**macOS / Linux / WSL2:**

```bash
git clone https://github.com/duthaho/dotfiles ~/.dotfiles && cd ~/.dotfiles && bash ./bootstrap.sh
```

**Windows:**

```powershell
git clone https://github.com/duthaho/dotfiles $HOME\.dotfiles; cd $HOME\.dotfiles; powershell -ExecutionPolicy Bypass -File .\bootstrap.ps1
```

## Disclaimer

If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk! 
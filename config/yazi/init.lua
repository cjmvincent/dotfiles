require("starship"):setup({
	config_file = "/Users/cvincent/.dotfiles/config/starship/starship.toml"
})

require("no-status"):setup()

require("no-header"):setup()

ya.err(os.getenv("PATH"))

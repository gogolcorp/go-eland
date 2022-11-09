package pkg

type Mode struct {
	Name        string
	Description string
}

var Modes = []Mode{
	{
		Name:        "[*] step-by-step",
		Description: "Let you pick and choose the actions to run",
	}, {
		Name:        "[!] automatic",
		Description: "Run all actions in a row in logical order",
	}}

var AutoModeScripts = []string{
	"apt/update",
	"apt/install",

	"zsh/framework",
	"zsh/plugins",
	// "zsh/prompt",

	"dotfiles/dotfiles",
	"dotfiles/rcfiles",

	"snap/install",
	"snap/refresh",

	"vscode/extensions",
	"vscode/settings",

	"brew/binary",
	"brew/formulaes",

	"clis/docker",
	"clis/k8s",
}

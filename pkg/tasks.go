package pkg

type Task struct {
	Name          string
	Description   string
	ActionsLabels []string
	Actions       []Action
}

type Action struct {
	Name        string
	Description string
	Exec        string
}

var Tasks = []Task{

	{
		Name:        "[1] apt packages",
		Description: "install & update Apt packages",
		ActionsLabels: []string{
			"update-packages",
			"install-packages",
		},
		Actions: []Action{
			{
				Name:        "[1.a] update-packages",
				Description: "update all Apt packages",
				Exec:        "apt/update",
			},
			{
				Name:        "[1.b] install-packages",
				Description: "install all Apt packages from config.sh",
				Exec:        "apt/install",
			},
		},
	},
	{
		Name:        "[2] zsh setup",
		Description: "install Oh-My-Zsh framework and Zsh plugins",
		ActionsLabels: []string{
			"install-framework",
			"install-plugins",
			// "prompt",
		},
		Actions: []Action{
			{
				Name:        "[2.a] install-framework",
				Description: "install Oh-My-Zsh framework",
				Exec:        "zsh/framework",
			},
			{
				Name:        "[2.b] install-plugins",
				Description: "install all Zsh plugins from config.sh",
				Exec:        "zsh/plugins",
			},
			// {
			// 	Name:        "prompt",
			// 	Description: "install custom prompt for Zsh",
			// 	Exec:        "zsh/prompt",
			// },
		},
	},

	{
		Name:        "[3] bash dotfiles",
		Description: "manage, synchronize and update Bash dotfiles and .rc files",
		ActionsLabels: []string{
			"sync-dotfiles",
			"sync-rcfiles",
		},
		Actions: []Action{
			{
				Name:        "[3.a] sync-dotfiles",
				Description: "sync all Bash dotfiles from config.sh",
				Exec:        "dotfiles/dotfiles",
			},
			{
				Name:        "[3.b] sync-rcfile",
				Description: "update the .zshrc file",
				Exec:        "dotfiles/rcfiles",
			},
		},
	},
	{
		Name:        "[4] snap packages",
		Description: "install and refresh snap packages",
		ActionsLabels: []string{
			"install-packages",
			"update-packages",
		},
		Actions: []Action{
			{
				Name:        "[4.a] install-packages",
				Description: "install all Snap packages from config.sh",
				Exec:        "snap/install",
			},
			{
				Name:        "[4.b] update-packages",
				Description: "refresh all Snap packages",
				Exec:        "snap/refresh",
			},
		},
	},
	{
		Name:        "[5] vscode",
		Description: "install VS Code extensions and sync settings",
		ActionsLabels: []string{
			"install-extensions",
			"sync-settings",
		},
		Actions: []Action{
			{
				Name:        "[5.b] install-extensions",
				Description: "install all VSCode extensions from config/config.sh",
				Exec:        "vscode/extensions",
			},
			{
				Name:        "[5.b] sync-settings",
				Description: "sync settings to VSCode from config/config.sh",
				Exec:        "vscode/settings",
			},
		},
	},
	{
		Name:        "[6] brew bin and formulaes",
		Description: "install Brew binary | install and update Brew formulaes",
		ActionsLabels: []string{
			"install-binary",
			"install-formulaes",
		},
		Actions: []Action{
			{
				Name:        "[6.a] install-binary",
				Description: "install Brew binary with .rc file configuration",
				Exec:        "brew/binary",
			},
			{
				Name:        "[6.b] install-formulaes",
				Description: "install all Brew formulaes from config.sh",
				Exec:        "brew/formulaes",
			},
		},
	},
	{
		Name:        "[7] developer CLIs",
		Description: "install Docker and Kubernetes related CLIs",
		ActionsLabels: []string{
			"docker",
			"kubernetes",
		},
		Actions: []Action{
			{
				Name:        "[7.a] docker",
				Description: "install Docker and Docker Compose",
				Exec:        "clis/docker",
			},
			{
				Name:        "[7.b] kubernetes",
				Description: "install Kubectl, Kubectx, Kubens, Kubeseal and Helm",
				Exec:        "clis/k8s",
			},
		},
	},
}

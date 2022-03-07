package core

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
		Name:        "apt packages",
		Description: "install, update and manage Apt packages",
		ActionsLabels: []string{
			"update",
			"install",
		},
		Actions: []Action{
			{
				Name:        "update",
				Description: "update all Apt packages",
				Exec:        "apt/update",
			},
			{
				Name:        "install",
				Description: "install all Apt packages from config/cfg.sh",
				Exec:        "apt/install",
			},
		},
	},
	{
		Name:        "zsh setup",
		Description: "install Oh-My-Zsh, Zsh plugins and Spaceship prompt",
		ActionsLabels: []string{
			"oh-my-zsh",
			"plugins",
			"prompt",
		},
		Actions: []Action{
			{
				Name:        "oh-my-zsh",
				Description: "install Oh-My-Zsh framework",
				Exec:        "zsh/omz",
			},
			{
				Name:        "plugins",
				Description: "install Zsh plugins from config/cfg.sh",
				Exec:        "zsh/plugins",
			},
			{
				Name:        "prompt",
				Description: "install custom prompt for Zsh",
				Exec:        "zsh/prompt",
			},
		},
	},
	{
		Name:        "brew casks + formulaes",
		Description: "install, update and manage Brew casks and formulaes",
		ActionsLabels: []string{
			"brew",
			"formulaes",
			"casks",
		},
		Actions: []Action{
			{
				Name:        "brew",
				Description: "install brew executable, with rc file configuration",
				Exec:        "brew/install",
			},
			{
				Name:        "formulaes",
				Description: "install Brew formulaes from config/cfg.sh",
				Exec:        "brew/formulaes",
			},
			{
				Name:        "casks",
				Description: "install Brew casks from config/cfg.sh",
				Exec:        "brew/casks",
			},
		},
	},
	{
		Name:        "bash dotfiles",
		Description: "manages, synchronizes and update Bash dotfiles and .rc files",
		ActionsLabels: []string{
			"sync",
			"write-rcfile",
		},
		Actions: []Action{
			{
				Name:        "sync",
				Description: "sync all Bash dotfiles from config/cfg.sh",
				Exec:        "dotfiles/sync",
			},
			{
				Name:        "write-rcfile",
				Description: "update the .bashrc or .zshrc file",
				Exec:        "dotfiles/rc",
			},
		},
	},

	{
		Name:        "developer CLIs",
		Description: "install Docker and Kubernetes related CLIs",
		ActionsLabels: []string{
			"docker",
			"kubernetes",
		},
		Actions: []Action{
			{
				Name:        "docker",
				Description: "install Docker and Docker Compose",
				Exec:        "clis/docker",
			},
			{
				Name:        "kubernetes",
				Description: "install Kubectl, Kubectx, Kubens, Kubeseal and Helm",
				Exec:        "clis/k8s",
			},
		},
	// },
	// {
	// 	Name:        "vscode",
	// 	Description: "install VSCode extensions, theme and sync settings",
	// 	ActionsLabels: []string{
	// 		"extensions",
	// 		"theme",
	// 		"settings",
	// 	},
	// 	Actions: []Action{
	// 		{
	// 			Name:        "extensions",
	// 			Description: "install all VSCode extensions from config/cfg.sh",
	// 			Exec:        "apt/update",
	// 		},
	// 		{
	// 			Name:        "theme",
	// 			Description: "install VSCode theme from config/cfg.sh",
	// 			Exec:        "apt/update",
	// 		},
	// 		{
	// 			Name:        "settings",
	// 			Description: "sync settings to VSCode from config/cfg.sh",
	// 			Exec:        "apt/update",
	// 		},
	// 	},
	},
}

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
		Description: "manages apt packages, install and update them",
		ActionsLabels: []string{
			"install",
			"update",
		},
		Actions: []Action{
			{
				Name:        "install",
				Description: "install all apt packages from config/cfg.sh",
				Exec:        "apt/install",
			},
			{
				Name:        "update",
				Description: "update all apt packages from config/cfg.sh",
				Exec:        "apt/update",
			},
		},
	},
	{
		Name:        "snap packages",
		Description: "manages snap packages, install and refresh them",
		ActionsLabels: []string{
			"install",
			"update",
		},
		Actions: []Action{
			{
				Name:        "install",
				Description: "install all snap packages from config/cfg.sh",
				Exec:        "apt/update",
			},
			{
				Name:        "refresh",
				Description: "refresh all snap packages from config/cfg.sh",
				Exec:        "apt/update",
			},
		},
	},
	{
		Name:        "zsh-related stuff",
		Description: "install Oh-My-Zsh, zsh plugins and spaceship prompt",
		ActionsLabels: []string{
			"omz",
			"plugins",
			"prompt",
		},
		Actions: []Action{
			{
				Name:        "oh-my-zsh",
				Description: "install Oh-My-Zsh famework",
				Exec:        "apt/update",
			},
			{
				Name:        "zsh-users plugins",
				Description: "install zsh plugins from config/cfg.sh",
				Exec:        "apt/update",
			},
			{
				Name:        "spaceship-prompt",
				Description: "install spaceship-prompt for Zsh",
				Exec:        "apt/update",
			},
		},
	},
	{
		Name:        "bash dotfiles",
		Description: "manages bash dotfiles, synchronizes them and update rc files",
		ActionsLabels: []string{
			"sync",
			"rc",
		},
		Actions: []Action{
			{
				Name:        "sync",
				Description: "sync all bash dotfiles from config/cfg.sh",
				Exec:        "dotfiles/sync",
			},
			{
				Name:        "rc",
				Description: "update the .bashrc or .zshrc file",
				Exec:        "apt/update",
			},
		},
	},

	{
		Name:        "developer CLIs",
		Description: "install Docker, Docker Compose, Kubectl and Helm",
		ActionsLabels: []string{
			"docker",
			"kubernetes",
		},
		Actions: []Action{
			{
				Name:        "docker",
				Description: "install Docker and Docker Compose",
				Exec:        "apt/update",
			},
			{
				Name:        "kubernetes",
				Description: "install Kubectl and Helm",
				Exec:        "apt/update",
			},
		},
	},
	{
		Name:        "vscode",
		Description: "install VSCode extensions, theme and sync settings",
		ActionsLabels: []string{
			"extensions",
			"theme",
			"settings",
		},
		Actions: []Action{
			{
				Name:        "extensions",
				Description: "install all VSCode extensions from config/cfg.sh",
				Exec:        "apt/update",
			},
			{
				Name:        "theme",
				Description: "install VSCode theme from config/cfg.sh",
				Exec:        "apt/update",
			},
			{
				Name:        "settings",
				Description: "sync settings to VSCode from config/cfg.sh",
				Exec:        "apt/update",
			},
		},
	},
}

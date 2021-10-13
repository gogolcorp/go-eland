package core

import "github.com/sirupsen/logrus"

type Task struct {
	Name         string
	Description  string
	ActionsLabels []string
	Actions      []Action
}

type Action struct {
	Name        string
	Description string
	exec        func()
}

func foo() {
	logrus.Info("test")
}

var Tasks = []Task{
	{
		Name:        "[1] apt packages",
		Description: "manages apt packages, install and update them",
		ActionsLabels: []string{
			"install",
			"update",
		},
		Actions: []Action{
			{
				Name:        "install",
				Description: "install all apt packages from configuration",
				exec:        foo,
			},
			{
				Name:        "update",
				Description: "update all apt packages",
				exec:        foo,
			},
		},
	},
	{
		Name:        "[2] snap packages",
		Description: "manages snap packages, install and refresh them",
		ActionsLabels: []string{
			"install",
			"update",
		},
		Actions: []Action{
			{
				Name:        "install",
				Description: "install all snap packages from configuration",
				exec:        foo,
			},
			{
				Name:        "refresh",
				Description: "refresh all snap packages",
				exec:        foo,
			},
		},
	},
	{
		Name:        "[3] zsh-related stuff",
		Description: "install Oh-My-Zsh, zsh plugins and spaceship prompt",
		ActionsLabels: []string{
			"omz",
			"plugins",
			"prompt",
		},
		Actions: []Action{
			{
				Name:        "oh-my-zsh",
				Description: "install Oh-My-Zsh without user prompt",
				exec:        foo,
			},
			{
				Name:        "zsh-users plugins",
				Description: "install zsh plugins from the configuration file",
				exec:        foo,
			},
			{
				Name:        "spaceship-prompt",
				Description: "install spaceship-prompt for Zsh",
				exec:        foo,
			},
		},
	},
	{
		Name:        "[4] bash dotfiles",
		Description: "manages bash dotfiles, synchronizes them and update rc files",
		ActionsLabels: []string{
			"sync",
			"rc",
		},
		Actions: []Action{
			{
				Name:        "sync",
				Description: "sync all bash dotfiles from the configuration files",
				exec:        foo,
			},
			{
				Name:        "rc",
				Description: "update the .bashrc or .zshrc file",
				exec:        foo,
			},
		},
	},

	{
		Name:        "[5] developer CLIs",
		Description: "install Docker, Docker Compose, Kubectl and Helm",
		ActionsLabels: []string{
			"docker",
			"kubernetes",
		},
		Actions: []Action{
			{
				Name:        "docker",
				Description: "install Docker and Docker Compose",
				exec:        foo,
			},
			{
				Name:        "kubernetes",
				Description: "install Kubectl and Helm",
				exec:        foo,
			},
		},
	},
	{
		Name:        "[6] vscode",
		Description: "install VSCode extensions, theme and sync settings",
		ActionsLabels: []string{
			"extensions",
			"theme",
			"settings",
		},
		Actions: []Action{
			{
				Name:        "extensions",
				Description: "install all VSCode extensions from the configuration file",
				exec:        foo,
			},
			{
				Name:        "theme",
				Description: "install VSCode theme from the configuration file",
				exec:        foo,
			},
			{
				Name:        "settings",
				Description: "sync settings to VSCode from the configuration file",
				exec:        foo,
			},
		},
	},
}

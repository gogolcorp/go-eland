package core

import "github.com/sirupsen/logrus"

type Task struct {
	Name          string
	Description   string
	ActionsLabels []string
	Actions       []Action
}

type Action struct {
	Name        string
	Description string
	Exec        func()
}

func foo() {
	logrus.Info("test")
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
				Description: "install all apt packages from cfg.sh",
				Exec:        foo,
			},
			{
				Name:        "update",
				Description: "update all apt packages from cfg.sh",
				Exec:        foo,
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
				Description: "install all snap packages from cfg.sh",
				Exec:        foo,
			},
			{
				Name:        "refresh",
				Description: "refresh all snap packages from cfg.sh",
				Exec:        foo,
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
				Exec:        foo,
			},
			{
				Name:        "zsh-users plugins",
				Description: "install zsh plugins from cfg.sh",
				Exec:        foo,
			},
			{
				Name:        "spaceship-prompt",
				Description: "install spaceship-prompt for Zsh",
				Exec:        foo,
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
				Description: "sync all bash dotfiles from cfg.sh",
				Exec:        foo,
			},
			{
				Name:        "rc",
				Description: "update the .bashrc or .zshrc file",
				Exec:        foo,
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
				Exec:        foo,
			},
			{
				Name:        "kubernetes",
				Description: "install Kubectl and Helm",
				Exec:        foo,
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
				Description: "install all VSCode extensions from cfg.sh",
				Exec:        foo,
			},
			{
				Name:        "theme",
				Description: "install VSCode theme from cfg.sh",
				Exec:        foo,
			},
			{
				Name:        "settings",
				Description: "sync settings to VSCode from cfg.sh",
				Exec:        foo,
			},
		},
	},
}

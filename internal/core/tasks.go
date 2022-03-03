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
		Name:        "test",
		Description: "test",
		ActionsLabels: []string{
			"test",
			"finish-setup",
		},
		Actions: []Action{
			{
				Name:        "test",
				Description: "test",
				Exec:        "test",
			},
			{
				Name:        "finish setup",
				Description: "Finish the installation setup",
				Exec:        "setup",
			},
		},
	},
	{
		Name:        "apt+brew packages",
		Description: "install, update and manage Apt and Brew packages",
		ActionsLabels: []string{
			"apt",
			"brew",
		},
		Actions: []Action{
			{
				Name:        "apt",
				Description: "install all apt packages from config/cfg.sh",
				Exec:        "packages/apt",
			},
			{
				Name:        "brew",
				Description: "install Brew exec, then install packages from config/cfg.sh",
				Exec:        "packages/brew",
			},
		},
	},
	{
		Name:        "zsh setup",
		Description: "install Oh-My-Zsh, Zsh plugins and spaceship prompt",
		ActionsLabels: []string{
			"omz",
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
		Name:        "bash dotfiles",
		Description: "manages, synchronizes and update Bash dotfiles and .rc files",
		ActionsLabels: []string{
			"sync",
			"rc",
		},
		Actions: []Action{
			{
				Name:        "sync",
				Description: "sync all Bash dotfiles from config/cfg.sh",
				Exec:        "dotfiles/sync",
			},
			{
				Name:        "rc",
				Description: "update the .bashrc or .zshrc file",
				Exec:        "dotfiles/rc",
			},
		},
	},

	{
		Name:        "developer CLIs",
		Description: "install docker and kubernetes related CLIs",
		ActionsLabels: []string{
			"docker",
			"k8s",
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
				Exec:        "snap/update",
			},
			{
				Name:        "refresh",
				Description: "refresh all snap packages from config/cfg.sh",
				Exec:        "snap/update",
			},
		},
	},
}

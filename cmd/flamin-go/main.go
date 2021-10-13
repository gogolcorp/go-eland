//

package main

import (
	"fmt"
	"strings"

	"github.com/manifoldco/promptui"
	"github.com/sirupsen/logrus"
)

type SubTask struct {
	Name        string
	Description string
	exec        func()
}
type ISubTask interface {
	exec()
}
type Task struct {
	Name        string
	Description string
	SubLabels   []string
	SubTasks    []SubTask
}

func foo() {
	logrus.Info("test")
}
func main() {
	tasks := []Task{
		{
			Name:        "[1] apt packages",
			Description: "manages apt packages, install and update them.",
			SubLabels: []string{
				"install",
				"update",
			},
			SubTasks: []SubTask{
				{
					Name:        "install",
					Description: "install all apt packages from configuration.",
					exec:        foo,
				},
				{
					Name:        "update",
					Description: "update all apt packages.",
					exec:        foo,
				},
			},
		},
		{
			Name:        "[2] snap packages",
			Description: "manages snap packages, install and refresh them.",
			SubLabels: []string{
				"install",
				"update",
			},
			SubTasks: []SubTask{
				{
					Name:        "install",
					Description: "install all snap packages from configuration.",
					exec:        foo,
				},
				{
					Name:        "refresh",
					Description: "refresh all snap packages.",
					exec:        foo,
				},
			},
		},
		{
			Name:        "[3] zsh-related stuff",
			Description: "install Oh-My-Zsh, zsh plugins and spaceshipt prompt.",
			SubLabels: []string{
				"oh-my-zsh",
				"zsh-users plugins",
				"spaceship-prompt",
			},
			SubTasks: []SubTask{
				{
					Name:        "oh-my-zsh",
					Description: "install Oh-My-Zsh without user prompt.",
					exec:        foo,
				},
				{
					Name:        "zsh-users plugins",
					Description: "install zsh plugins from the configuration file.",
					exec:        foo,
				},
				{
					Name:        "spacehip-prompt",
					Description: "install spaceship-prompt for Zsh.",
					exec:        foo,
				},
			},
		},
		{
			Name:        "[4] bash dotfiles",
			Description: "manages bash dotfiles, synchronizes them and update rc files.",
			SubLabels: []string{
				"sync",
				"rc",
			},
			SubTasks: []SubTask{
				{
					Name:        "sync",
					Description: "sync all bash dotfiles from the configuration files.",
					exec:        foo,
				},
				{
					Name:        "rc",
					Description: "update the .bashrc or .zshrc file.",
					exec:        foo,
				},
			},
		},

		{
			Name:        "[5] developer CLIs",
			Description: "install Docker, Docker Compose, Kubectl and Helm.",
			SubLabels: []string{
				"docker",
				"kubernetes",
			},
			SubTasks: []SubTask{
				{
					Name:        "docker",
					Description: "install Docker and Docker Compose.",
					exec:        foo,
				},
				{
					Name:        "kubernetes",
					Description: "install Kubectl and Helm.",
					exec:        foo,
				},
			},
		},
		{
			Name:        "[6] vscode",
			Description: "install VSCode extensions, theme and sync settings.",
			SubLabels: []string{
				"extensions",
				"theme",
				"settings",
			},
			SubTasks: []SubTask{
				{
					Name:        "extensions",
					Description: "install all VSCode extensions from the configuration file.",
					exec:        foo,
				},
				{
					Name:        "theme",
					Description: "install VSCode theme from the configuration file.",
					exec:        foo,
				},
				{
					Name:        "settings",
					Description: "sync settings to VSCode from the configuration file.",
					exec:        foo,
				},
			},
		},
	}

	searcher := func(input string, index int) bool {
		task := tasks[index]
		name := strings.Replace(strings.ToLower(task.Name), " ", "", -1)
		input = strings.Replace(strings.ToLower(input), " ", "", -1)

		return strings.Contains(name, input)
	}

	templates := &promptui.SelectTemplates{
		Help:     "{{ \"Toggle search: / key\" | faint }}",
		Label:    "🦩 | {{ . | magenta | bold | underline }}",
		Selected: "> {{ .Name | green | bold }}",
		Active:   "> {{ .Name | yellow | bold }} {{ .SubLabels | white }}",
		Inactive: "  {{ .Name | cyan }} {{ .SubLabels | faint }}",
		Details: `
🔥| {{ .Name | yellow | bold | underline }} {{"task" | underline | white }}:
Goal: {{ .Description | faint }}`,
	}

	subTemplates := &promptui.SelectTemplates{
		Label:    "🔥 | {{ . | blue | bold | underline }}",
		Selected: "> {{ .Name | green | bold }}",
		Active:   "> {{ .Name | yellow | bold }}",
		Inactive: "  {{ .Name | cyan }}",
		Details: `
✨ | {{ .Name | yellow | bold | underline }} {{"task" | underline | white }}:
Goal: {{ .Description | faint }}`,
	}

	prompt := promptui.Select{
		Label:     "Hi, Flamin-go speaking. Choose a task:",
		Items:     tasks,
		Templates: templates,
		Size:      10,
		Searcher:  searcher,
	}

	fmt.Print("\033[H\033[2J")
	i, _, err := prompt.Run()
	if err != nil {
		fmt.Printf("Prompt failed %v\n", err)
		return
	}

	subPrompt := promptui.Select{
		HideHelp:  true,
		Label:     "Choose an action:",
		Items:     tasks[i].SubTasks,
		Templates: subTemplates,
		Size:      5,
	}
	j, _, err := subPrompt.Run()
	if err != nil {
		fmt.Printf("Prompt failed %v\n", err)
		return
	}
	logrus.Info(j)
}

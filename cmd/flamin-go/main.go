//

package main

import (
	"fmt"
	"strings"

	"github.com/manifoldco/promptui"
)

type task struct {
	Name        string
	Description string
	UnderTasks  []string
}

func main() {
	tasks := []task{
		{
			Name:        "apt packages",
			Description: "manages apt packages, installs and updates them",
			UnderTasks: []string{
				"install",
				"update",
			},
		},
		{
			Name:        "snap packages",
			Description: "manages snap packages, installs and updates them",
			UnderTasks: []string{
				"install",
				"update",
			},
		},
		{
			Name:        "bash dotfiles",
			Description: "manages bash dotfiles, manages apt packages, synchronizes them and updates rc files",
			UnderTasks: []string{
				"aliases",
				"functions",
			},
		},
		{
			Name:        "zsh-related",
			Description: "install Oh-My-Zsh, zsh-users plugins, and spaceshipt prompt",
			UnderTasks: []string{
				"oh-my-zsh",
				"zsh-users",
				"spaceship-prompt",
			},
		},
	}

	templates := &promptui.SelectTemplates{
		Help:     "{{ \"Toggle search: / key\" | faint }}",
		Label:    "{{ . | yellow }}",
		Selected: "> {{ .Name | green | bold }}",
		Active:   "> {{ .Name | green | bold }} {{ .UnderTasks | white }}",
		Inactive: "  {{ .Name | cyan }} {{ .UnderTasks | faint }}",
		Details: `
----- {{ .Name | yellow | bold | underline }} {{"task" | underline | white }} ----
{{ .Description | faint }}`,
	}

	searcher := func(input string, index int) bool {
		task := tasks[index]
		name := strings.Replace(strings.ToLower(task.Name), " ", "", -1)
		input = strings.Replace(strings.ToLower(input), " ", "", -1)

		return strings.Contains(name, input)
	}
	fmt.Print("\033[H\033[2J")

	prompt := promptui.Select{
		Label:     "🦩| Hi, Flamin-go speaking. Choose a task:",
		Items:     tasks,
		Templates: templates,
		Size:      10,
		Searcher:  searcher,
	}

	i, _, err := prompt.Run()

	if err != nil {
		fmt.Printf("Prompt failed %v\n", err)
		return
	}

	fmt.Printf("You choose number %d: %s\n", i+1, tasks[i].Name)
}

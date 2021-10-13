//

package main

import (
	"fmt"
	"strings"

	"github.com/blyndusk/flamin-go/internal/core"
	"github.com/blyndusk/flamin-go/pkg/helpers"
	"github.com/manifoldco/promptui"
	"github.com/ttacon/chalk"
)

func main() {
	fmt.Print("\033[H\033[2J")

	searcher := func(input string, index int) bool {
		task := core.Tasks[index]
		name := strings.Replace(strings.ToLower(task.Name), " ", "", -1)
		input = strings.Replace(strings.ToLower(input), " ", "", -1)
		return strings.Contains(name, input)
	}

	taskPrompt := promptui.Select{
		Label:     "Hi, Flamin-go speaking. Choose a task:",
		Items:     core.Tasks,
		Templates: core.TaskTpl,
		Size:      10,
		Searcher:  searcher,
	}

	i, _, err := taskPrompt.Run()
	helpers.ExitOnError("taskPrompt failed:", err)
	fmt.Print("----------------------\n")

	task := core.Tasks[i]
	actionPrompt := promptui.Select{
		HideHelp:  true,
		Label:     "Now, choose an action:",
		Items:     task.Actions,
		Templates: core.ActionTpl,
		Size:      10,
	}

	j, _, err := actionPrompt.Run()
	helpers.ExitOnError("actionPrompt failed:", err)
	fmt.Print("----------------------\n")

	action := task.Actions[j]
	choice := chalk.Green.NewStyle().WithTextStyle(chalk.Bold).Style(action.Description)

	fmt.Print("Task: ", chalk.Red, task.Name, chalk.Reset, "\n")
	fmt.Print("Action: ", chalk.Yellow, chalk.Bold, action.Name, chalk.Reset, "\n")
	fmt.Print("You're about to: ", choice, "\n")

	prompt := promptui.Prompt{
		Label:     "Continue",
		Default:   "y",
		IsConfirm: true,
	}

	result, err := prompt.Run()
	if (result == "" || result == "Y" || result == "y") {
		action.Exec()
	}
}

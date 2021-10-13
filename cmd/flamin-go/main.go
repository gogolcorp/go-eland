//

package main

import (
	"fmt"
	"strings"

	"github.com/blyndusk/flamin-go/internal/core"
	"github.com/manifoldco/promptui"
	"github.com/sirupsen/logrus"
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
	if err != nil {
		logrus.Error("Prompt failed %v\n", err)
		return
	}

	actionPrompt := promptui.Select{
		HideHelp:  true,
		Label:     "Now, choose an action:",
		Items:     core.Tasks[i].Actions,
		Templates: core.ActionTpl,
		Size:      10,
	}
	fmt.Print("----------------------\n")


	j, _, err := actionPrompt.Run()
	if err != nil {
		fmt.Printf("Prompt failed %v\n", err)
		return
	}
	logrus.Info(fmt.Sprintf("Task: %s - Action: %s", core.Tasks[i].Name, core.Tasks[i].Actions[j].Name))
}

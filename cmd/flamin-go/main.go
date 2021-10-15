package main

import (
	"bytes"
	"fmt"
	"io"
	"os"
	"os/exec"
	"strings"

	"github.com/blyndusk/flamin-go/internal/core"
	"github.com/blyndusk/flamin-go/pkg/helpers"
	"github.com/manifoldco/promptui"
	"github.com/ttacon/chalk"
)

func execAction(file string) {
	pwd, _ := os.Getwd()
	actionFile := fmt.Sprintf("%s/scripts/%s.sh", pwd, file)
	cmd := exec.Command("/bin/bash", actionFile)

	var stdoutBuf, stderrBuf bytes.Buffer
	cmd.Stdout = io.MultiWriter(os.Stdout, &stdoutBuf)
	cmd.Stderr = io.MultiWriter(os.Stderr, &stderrBuf)

	err := cmd.Run()
	helpers.ExitOnError("cmd.Run() failed with", err)

}
func run() {
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
	helpers.ClosePrompt(err)

	task := core.Tasks[i]
	actionPrompt := promptui.Select{
		HideHelp:  true,
		Label:     "Now, choose an action:",
		Items:     task.Actions,
		Templates: core.ActionTpl,
		Size:      10,
	}
	j, _, err := actionPrompt.Run()
	helpers.ClosePrompt(err)

	action := task.Actions[j]
	choice := chalk.Green.NewStyle().WithBackground(chalk.ResetColor).WithTextStyle(chalk.Bold).Style(action.Description)

	fmt.Print("\033[H\033[2J")
	fmt.Print("Task: ", chalk.Red, task.Name, chalk.Reset, "\n")
	fmt.Print("Action: ", chalk.Yellow, chalk.Bold, action.Name, chalk.Reset, "\n")
	fmt.Print("You're about to: ", choice, "\n")

	confirmPrompt := promptui.Prompt{
		Label:     "Continue",
		Default:   "y",
		IsConfirm: true,
	}

	result, err := confirmPrompt.Run()
	helpers.ExitOnError("confirmPrompt failed:", err)
	if result == "" || result == "Y" || result == "y" {
		execAction(action.Exec)
		run()
	}
}
func main() {
	run()
}

package main

import (
	"bytes"
	"fmt"
	"io"
	"os"
	"os/exec"
	"strings"

	"github.com/blyndusk/go-eland/pkg"
	"github.com/manifoldco/promptui"
	"github.com/ttacon/chalk"
)

func execAction(file string) {
	pwd, _ := os.Getwd()
	actionFile := fmt.Sprintf("%s/exec/%s.sh", pwd, file)
	cmd := exec.Command("/bin/bash", actionFile)

	var stdoutBuf, stderrBuf bytes.Buffer
	cmd.Stdout = io.MultiWriter(os.Stdout, &stdoutBuf)
	cmd.Stderr = io.MultiWriter(os.Stderr, &stderrBuf)

	err := cmd.Run()
	pkg.ExitOnError("cmd.Run() failed with", err)
}

func searcher() func(input string, index int) bool {
	searcher := func(input string, index int) bool {
		task := pkg.Tasks[index]
		name := strings.Replace(strings.ToLower(task.Name), " ", "", -1)
		input = strings.Replace(strings.ToLower(input), " ", "", -1)
		return strings.Contains(name, input)
	}
	return searcher
}

func runConfirmPrompt(mode pkg.Mode, task pkg.Task, action pkg.Action) {
	choice := chalk.Cyan.NewStyle().WithBackground(chalk.ResetColor).WithTextStyle(chalk.Bold).Style(action.Description)

	pkg.ClearPrompt()
	pkg.PrintWelcomeMessage()
	fmt.Print("Mode:   ", chalk.Red, mode.Name, chalk.Reset, "\n")
	fmt.Print("Task:   ", chalk.Yellow, task.Name, chalk.Reset, "\n")
	fmt.Print("Action:", chalk.Green, chalk.Bold, action.Name, chalk.Reset, "\n")
	fmt.Print("You're about to: ", choice, "\n")

	confirmPrompt := promptui.Prompt{
		Label:     "Continue",
		Default:   "y",
		IsConfirm: true,
	}

	result, err := confirmPrompt.Run()
	pkg.ExitOnError("confirmPrompt failed:", err)
	if result == "" || result == "Y" || result == "y" {
		execAction(action.Exec)
		run()
	}
}

func runAuto(mode pkg.Mode) {
	choice := chalk.Cyan.NewStyle().WithBackground(chalk.ResetColor).WithTextStyle(chalk.Bold).Style(mode.Description)

	pkg.ClearPrompt()
	fmt.Print("Mode: ", chalk.Red, mode.Name, chalk.Reset, "\n")
	fmt.Print("You're about to: ", choice, "\n")

	confirmPrompt := promptui.Prompt{
		Label:     "Continue",
		Default:   "y",
		IsConfirm: true,
	}

	result, err := confirmPrompt.Run()
	pkg.ExitOnError("confirmPrompt failed:", err)
	if result == "" || result == "Y" || result == "y" {
		for _, script := range pkg.AutoModeScripts {
			execAction(script)
		}
	}
}

func run() {
	pkg.ClearPrompt()
	pkg.PrintWelcomeMessage()

	modesPrompt := promptui.Select{
		HideHelp:  true,
		Label:     "Select a setup mode:",
		Items:     pkg.Modes,
		Templates: pkg.ModeTemplate,
		Size:      2,
		Stdout:    &pkg.BellSkipper{},
	}

	h, _, err := modesPrompt.Run()
	pkg.ClosePrompt(err)
	mode := pkg.Modes[h]
	if h == 0 {

		taskPrompt := promptui.Select{
			HideHelp:  true,
			Label:     "Select a task category:",
			Items:     pkg.Tasks,
			Templates: pkg.TaskTemplate,
			Size:      10,
			Searcher:  searcher(),
			Stdout:    &pkg.BellSkipper{},
		}
		i, _, err := taskPrompt.Run()
		pkg.ClosePrompt(err)

		task := pkg.Tasks[i]
		actionPrompt := promptui.Select{
			HideHelp:  true,
			Label:     "Select an action to run",
			Items:     task.Actions,
			Templates: pkg.ActionTemplate,
			Size:      10,
			Stdout:    &pkg.BellSkipper{},
		}
		j, _, err := actionPrompt.Run()
		pkg.ClosePrompt(err)

		action := task.Actions[j]
		runConfirmPrompt(mode, task, action)
	} else {
		runAuto(mode)
		pkg.ClosePrompt(err)
	}
}

func auth() {
	cmd := exec.Command("sudo", "uptime")
	err := cmd.Run()
	pkg.ExitOnError("cmd.Run() failed with", err)
}

func main() {
	auth()
	run()
}

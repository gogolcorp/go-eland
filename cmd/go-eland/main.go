package main

import (
	"bytes"
	"fmt"
	"io"
	"os"
	"os/exec"
	"strings"

	"github.com/blyndusk/go-eland/internal/core"
	"github.com/blyndusk/go-eland/pkg/helpers"
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
	helpers.ExitOnError("cmd.Run() failed with", err)
}

func searcher() func(input string, index int) bool {
	searcher := func(input string, index int) bool {
		task := core.Tasks[index]
		name := strings.Replace(strings.ToLower(task.Name), " ", "", -1)
		input = strings.Replace(strings.ToLower(input), " ", "", -1)
		return strings.Contains(name, input)
	}
	return searcher
}

func runConfirmPrompt(mode core.Mode, task core.Task, action core.Action) {
	choice := chalk.Cyan.NewStyle().WithBackground(chalk.ResetColor).WithTextStyle(chalk.Bold).Style(action.Description)

	helpers.ClearPrompt()
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
	helpers.ExitOnError("confirmPrompt failed:", err)
	if result == "" || result == "Y" || result == "y" {
		execAction(action.Exec)
		run()
	}
}

func runAuto(mode core.Mode) {
	choice := chalk.Cyan.NewStyle().WithBackground(chalk.ResetColor).WithTextStyle(chalk.Bold).Style(mode.Description)

	helpers.ClearPrompt()
	fmt.Print("Mode: ", chalk.Red, mode.Name, chalk.Reset, "\n")
	fmt.Print("You're about to: ", choice, "\n")

	confirmPrompt := promptui.Prompt{
		Label:     "Continue",
		Default:   "y",
		IsConfirm: true,
	}

	result, err := confirmPrompt.Run()
	helpers.ExitOnError("confirmPrompt failed:", err)
	if result == "" || result == "Y" || result == "y" {
		execAction("apt/update")
		execAction("apt/install")

		execAction("zsh/omz")
		execAction("zsh/plugins")
		execAction("zsh/prompt")

		execAction("brew/install")
		execAction("brew/formulaes")
		execAction("brew/casks")

		execAction("dotfiles/sync")
		execAction("dotfiles/rc")

		execAction("clis/docker")
		execAction("clis/k8s")
	}
}

func run() {
	helpers.ClearPrompt()

	bd := chalk.Yellow.NewStyle().
		WithBackground(chalk.ResetColor).
		Style

	ul := chalk.ResetColor.NewStyle().
		WithBackground(chalk.ResetColor).
		WithTextStyle(chalk.Underline).
		Style

	fc := chalk.Yellow.NewStyle().
		WithBackground(chalk.ResetColor).
		Style

	rd := chalk.Red.NewStyle().
		WithBackground(chalk.ResetColor).
		WithTextStyle(chalk.Underline).
		Style
	gl := chalk.Blue.NewStyle().
		WithBackground(chalk.ResetColor).
		WithTextStyle(chalk.Bold).
		Style

	fmt.Print(`̀`,
		bd("┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"), "\n",
		bd("┃ "), "Hi! I'm ", gl("Goéland"), ", your ", ul("Ubuntu fresh setup assistant"), ".", bd(" ┃"), "\n",
		bd("┃ "), "                                                   ", bd(" ┃"), "\n",
		bd("┃ "), gl("Goéland"), " will help you to install many ", fc("applications,"), bd(" ┃"), "\n",
		bd("┃ "), fc("packages, formulaes"), " - ", ul("from Apt, Brew, Snap"), ",        ", bd(" ┃"), "\n",
		bd("┃ "), "alongside with ", fc("CLIs,"), " like ", ul("Docker, Kubernetes"), " tools.", bd(" ┃"), "\n",
		bd("┃ "), "                                                   ", bd(" ┃"), "\n",
		bd("┃ "), "But also ", ul("Zsh"), fc(" framework, plugins"), ", ", ul("VSCode"), fc(" extensions"), ",", bd(" ┃"), "\n",
		bd("┃ "), "with synchronised ", fc("settings"), " across your devices,    ", bd(" ┃"), "\n",
		bd("┃ "), "all your ", ul("Bash"), fc(" aliases, functions, exports"), ".         ", bd(" ┃"), "\n",
		bd("┃ "), "                                                   ", bd(" ┃"), "\n",
		bd("┃ "), "All you have to do is to choose a ", rd("setup mode:"), "      ", bd(" ┃"), "\n",
		bd("┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"), "\n")

	modesPrompt := promptui.Select{
		HideHelp:  true,
		Label:     "Select a setup mode:",
		Items:     core.Modes,
		Templates: core.ModeTpl,
		Size:      2,
		Stdout:    &helpers.BellSkipper{},
	}

	h, _, err := modesPrompt.Run()
	helpers.ClosePrompt(err)
	mode := core.Modes[h]
	if h == 0 {

		taskPrompt := promptui.Select{
			Label:     "Select a task category:",
			Items:     core.Tasks,
			Templates: core.TaskTpl,
			Size:      10,
			Searcher:  searcher(),
			Stdout:    &helpers.BellSkipper{},
		}
		i, _, err := taskPrompt.Run()
		helpers.ClosePrompt(err)

		task := core.Tasks[i]
		actionPrompt := promptui.Select{
			HideHelp:  true,
			Label:     "Select an action to run",
			Items:     task.Actions,
			Templates: core.ActionTpl,
			Size:      10,
			Stdout:    &helpers.BellSkipper{},
		}
		j, _, err := actionPrompt.Run()
		helpers.ClosePrompt(err)

		action := task.Actions[j]
		runConfirmPrompt(mode, task, action)
	} else {
		runAuto(mode)
		helpers.ClosePrompt(err)
	}
}

func auth() {
	cmd := exec.Command("sudo", "uptime")
	err := cmd.Run()
	helpers.ExitOnError("cmd.Run() failed with", err)
}

func main() {
	auth()
	run()
}

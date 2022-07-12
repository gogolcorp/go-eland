package main

import (
	"bytes"
	"fmt"
	"io"
	"os"
	"os/exec"
	"strings"

	"github.com/blyndusk/go-eland/internal"
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
		task := internal.Tasks[index]
		name := strings.Replace(strings.ToLower(task.Name), " ", "", -1)
		input = strings.Replace(strings.ToLower(input), " ", "", -1)
		return strings.Contains(name, input)
	}
	return searcher
}

func runConfirmPrompt(mode internal.Mode, task internal.Task, action internal.Action) {
	choice := chalk.Cyan.NewStyle().WithBackground(chalk.ResetColor).WithTextStyle(chalk.Bold).Style(action.Description)

	pkg.ClearPrompt()
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

func runAuto(mode internal.Mode) {
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
	pkg.ClearPrompt()

	

	fmt.Print(`̀`,
		pkg.Ui_bd("┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"), "\n",
		pkg.Ui_bd("┃ "), "Hi! I'm ", pkg.Ui_gl("Goéland"), ", your ", pkg.Ui_ul("Ubuntu fresh setup assistant"), ".", pkg.Ui_bd(" ┃"), "\n",
		pkg.Ui_bd("┃ "), "                                                   ", pkg.Ui_bd(" ┃"), "\n",
		pkg.Ui_bd("┃ "), pkg.Ui_gl("Goéland"), " will help you to install many ", pkg.Ui_fc("applications,"), pkg.Ui_bd(" ┃"), "\n",
		pkg.Ui_bd("┃ "), pkg.Ui_fc("packages, formulaes"), " - ", pkg.Ui_ul("from Apt, Brew, Snap"), ",        ", pkg.Ui_bd(" ┃"), "\n",
		pkg.Ui_bd("┃ "), "alongside with ", pkg.Ui_fc("CLIs,"), " like ", pkg.Ui_ul("Docker, Kubernetes"), " tools.", pkg.Ui_bd(" ┃"), "\n",
		pkg.Ui_bd("┃ "), "                                                   ", pkg.Ui_bd(" ┃"), "\n",
		pkg.Ui_bd("┃ "), "But also ", pkg.Ui_ul("Zsh"), pkg.Ui_fc(" framework, plugins"), ", ", pkg.Ui_ul("VSCode"), pkg.Ui_fc(" extensions"), ",", pkg.Ui_bd(" ┃"), "\n",
		pkg.Ui_bd("┃ "), "with synchronised ", pkg.Ui_fc("settings"), " across your devices,    ", pkg.Ui_bd(" ┃"), "\n",
		pkg.Ui_bd("┃ "), "all your ", pkg.Ui_ul("Bash"), pkg.Ui_fc(" aliases, functions, exports"), ".         ", pkg.Ui_bd(" ┃"), "\n",
		pkg.Ui_bd("┃ "), "                                                   ", pkg.Ui_bd(" ┃"), "\n",
		pkg.Ui_bd("┃ "), "All you have to do is to choose a ", pkg.Ui_rd("setup mode:"), "      ", pkg.Ui_bd(" ┃"), "\n",
		pkg.Ui_bd("┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"), "\n")

	modesPrompt := promptui.Select{
		HideHelp:  true,
		Label:     "Select a setup mode:",
		Items:     internal.Modes,
		Templates: internal.ModeTemplate,
		Size:      2,
		Stdout:    &pkg.BellSkipper{},
	}

	h, _, err := modesPrompt.Run()
	pkg.ClosePrompt(err)
	mode := internal.Modes[h]
	if h == 0 {

		taskPrompt := promptui.Select{
			Label:     "Select a task category:",
			Items:     internal.Tasks,
			Templates: internal.TaskTemplate,
			Size:      10,
			Searcher:  searcher(),
			Stdout:    &pkg.BellSkipper{},
		}
		i, _, err := taskPrompt.Run()
		pkg.ClosePrompt(err)

		task := internal.Tasks[i]
		actionPrompt := promptui.Select{
			HideHelp:  true,
			Label:     "Select an action to run",
			Items:     task.Actions,
			Templates: internal.ActionTemplate,
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

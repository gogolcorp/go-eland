package pkg

import (
	"fmt"

	"github.com/ttacon/chalk"
)

var ui_bd = chalk.Yellow.NewStyle().
	WithBackground(chalk.ResetColor).
	Style

var ui_ul = chalk.ResetColor.NewStyle().
	WithBackground(chalk.ResetColor).
	WithTextStyle(chalk.Underline).
	Style

var ui_fc = chalk.Yellow.NewStyle().
	WithBackground(chalk.ResetColor).
	Style

var ui_rd = chalk.Red.NewStyle().
	WithBackground(chalk.ResetColor).
	WithTextStyle(chalk.Underline).
	Style
var ui_gl = chalk.Blue.NewStyle().
	WithBackground(chalk.ResetColor).
	WithTextStyle(chalk.Bold).
	Style

func PrintWelcomeMessage() {

	fmt.Print(ui_bd("┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"), "\n",
		ui_bd("┃ "), "Hi! I'm ", ui_gl("Goéland"), ", your ", ui_ul("Ubuntu fresh setup assistant"), ".", ui_bd(" ┃"), "\n",
		ui_bd("┃ "), "                                                   ", ui_bd(" ┃"), "\n",
		ui_bd("┃ "), ui_gl("Goéland"), " will help you to install many ", ui_fc("applications,"), ui_bd(" ┃"), "\n",
		ui_bd("┃ "), ui_fc("packages, formulaes"), " - ", ui_ul("from Apt, Brew, Snap"), ",        ", ui_bd(" ┃"), "\n",
		ui_bd("┃ "), "alongside with ", ui_fc("CLIs,"), " like ", ui_ul("Docker, Kubernetes"), " tools.", ui_bd(" ┃"), "\n",
		ui_bd("┃ "), "                                                   ", ui_bd(" ┃"), "\n",
		ui_bd("┃ "), "But also ", ui_ul("Zsh"), ui_fc(" framework, plugins"), ", ", ui_ul("VSCode"), ui_fc(" extensions"), ",", ui_bd(" ┃"), "\n",
		ui_bd("┃ "), "with synchronised ", ui_fc("settings"), " across your devices,    ", ui_bd(" ┃"), "\n",
		ui_bd("┃ "), "all your ", ui_ul("Bash"), ui_fc(" aliases, functions, exports"), ".         ", ui_bd(" ┃"), "\n",
		ui_bd("┃ "), "                                                   ", ui_bd(" ┃"), "\n",
		ui_bd("┃ "), "All you have to do is to choose a ", ui_rd("setup mode:"), "      ", ui_bd(" ┃"), "\n",
		ui_bd("┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"), "\n")

}

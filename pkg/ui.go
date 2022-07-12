package pkg

import "github.com/ttacon/chalk"

var Ui_bd = chalk.Yellow.NewStyle().
	WithBackground(chalk.ResetColor).
	Style

var Ui_ul = chalk.ResetColor.NewStyle().
	WithBackground(chalk.ResetColor).
	WithTextStyle(chalk.Underline).
	Style

var Ui_fc = chalk.Yellow.NewStyle().
	WithBackground(chalk.ResetColor).
	Style

var Ui_rd = chalk.Red.NewStyle().
	WithBackground(chalk.ResetColor).
	WithTextStyle(chalk.Underline).
	Style
var Ui_gl = chalk.Blue.NewStyle().
	WithBackground(chalk.ResetColor).
	WithTextStyle(chalk.Bold).
	Style

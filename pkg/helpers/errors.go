package helpers

import (
	"fmt"
	"os"

	"github.com/sirupsen/logrus"
	"github.com/ttacon/chalk"
)

func ExitOnError(msg string, err error) {
	if err != nil {
		logrus.Fatal(msg, err)
	}
}

func ClosePrompt(err error) {
	if err != nil {
		fmt.Print("\033[H\033[2J")
		fmt.Print(chalk.Magenta, "🦩 | See you soon !")
		os.Exit(0)
	}
	fmt.Print("----------------------\n")
}

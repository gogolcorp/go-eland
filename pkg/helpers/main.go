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

func ClearPrompt() {
	fmt.Print("\033[H\033[2J")
}

func ClosePrompt(err error) {
	if err != nil {
		ClearPrompt()
		fmt.Print(chalk.Magenta, "🦩 | See you soon !")
		os.Exit(0)
	}
	fmt.Print("----------------------\n")
}

type BellSkipper struct{}

func (bs *BellSkipper) Write(b []byte) (int, error) {
	const charBell = 7
	if len(b) == 1 && b[0] == charBell {
		return 0, nil
	}
	return os.Stderr.Write(b)
}

func (bs *BellSkipper) Close() error {
	return os.Stderr.Close()
}

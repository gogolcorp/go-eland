package helpers

import "github.com/sirupsen/logrus"

func ExitOnError(msg string, err error) {
	if err != nil {
		logrus.Fatal(msg, err)
	}
}

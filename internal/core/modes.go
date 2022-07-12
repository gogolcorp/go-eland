package core

type Mode struct {
	Name        string
	Description string
}

var Modes = []Mode{
	{
		Name:        "[*] step-by-step",
		Description: "Let you pick and choose the actions to run",
	}, {
		Name:        "[!] automatic",
		Description: "Run all actions in a row in logical order",
	}}

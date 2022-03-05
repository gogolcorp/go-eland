package core

type Mode struct {
	Name        string
	Description string
}

var Modes = []Mode{
	{
		Name:        "step-by-step",
		Description: "Setup by category",
	
	},{
		Name:        "!automatic",
		Description: "Setup with all steps included automatically",
	}}

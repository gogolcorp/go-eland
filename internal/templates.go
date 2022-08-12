package internal

import "github.com/manifoldco/promptui"

var ModeTemplate = &promptui.SelectTemplates{
	Label: ` [!] {{ . | red | bold	| underline }}`,
	Selected: "=> {{ .Name | bgRed | black | bold }}",
	Active:   "=> {{ .Name | bgRed | black  }}",
	Inactive: "   {{ .Name | white }}",
	Details: `
 [?] {{ .Name | bgCyan | black }}
     {{ "Goal" | underline }}: {{ .Description | italic | faint }}`,
}

var TaskTemplate = &promptui.SelectTemplates{
	Label:    ` [!] {{ . | yellow | bold | underline }}`,
	Selected: "=> {{ .Name | bgYellow | black | bold }}",
	Active:   "=> {{ .Name | bgYellow | black  }} {{ .ActionsLabels | yellow }}",
	Inactive: "   {{ .Name | white }} {{ .ActionsLabels | faint }}",
	Details: `
 [?] {{ .Name | bgCyan | black }} {{"task" | white }}
     {{ "Goal" | underline }}: {{ .Description | italic | faint }}`,
}

var ActionTemplate = &promptui.SelectTemplates{
	Label:    ` [!] {{ . | green | bold | underline }}`,
	Selected: "=> {{ .Name | bgGreen | black| bold }}",
	Active:   "=> {{ .Name | bgGreen | black }} ({{ .Description | green }})",
	Inactive: "   {{ .Name | white }} ({{ .Description | faint }})",
}

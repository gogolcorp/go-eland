package core

import "github.com/manifoldco/promptui"

var TaskTpl = &promptui.SelectTemplates{
	Help:     "{{ \"Toggle search: / key\" | faint }}",
	Label:    `🦩 | {{ . | blue | bold | italic | underline }}`,
	Selected: "🔴 {{ .Name | bgRed | black | bold }}",
	Active:   "🔴 {{ .Name | bgRed | black  }} {{ .ActionsLabels | red }}",
	Inactive: "   {{ .Name | white }} {{ .ActionsLabels | faint }}",
	Details: `
💡 | {{ .Name | bgRed | black | underline }} {{"task" | white }}
    {{ "Goal" | underline }}: {{ .Description | italic | faint }}`,
}

var ActionTpl = &promptui.SelectTemplates{
	Help:     "{{ \"Toggle search: / key\" | faint }}",
	Label:    `🔥 | {{ . | blue | bold | italic | underline }}`,
	Selected: "🟡 {{ .Name | bgYellow | black| bold }}",
	Active:   "🟡 {{ .Name | bgYellow | black }} ({{ .Description | yellow }})",
	Inactive: "   {{ .Name | white }} ({{ .Description | faint }})",
}

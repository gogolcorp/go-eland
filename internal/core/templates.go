package core

import "github.com/manifoldco/promptui"

var ModeTpl = &promptui.SelectTemplates{
	Label:    `⚙️  | {{ . | red | bold	| underline }}`,
	Selected: "🔴 {{ .Name | bgRed | black | bold }}",
	Active:   "🔴 {{ .Name | bgRed | black  }}",
	Inactive: "   {{ .Name | white }}",
	Details: `
💡 | {{ .Name | bgCyan | black }}
    {{ "Goal" | underline }}: {{ .Description | italic | faint }}`,
}


var TaskTpl = &promptui.SelectTemplates{
	Help:     "{{ \"Toggle search: / key\" | faint }}",
	Label:    `🛠️  | {{ . | yellow | bold | underline }}`,
	Selected: "🟠 {{ .Name | bgYellow | black | bold }}",
	Active:   "🟠 {{ .Name | bgYellow | black  }} {{ .ActionsLabels | yellow }}",
	Inactive: "   {{ .Name | white }} {{ .ActionsLabels | faint }}",
	Details: `
💡 | {{ .Name | bgCyan | black }} {{"task" | white }}
    {{ "Goal" | underline }}: {{ .Description | italic | faint }}`,
}

var ActionTpl = &promptui.SelectTemplates{
	Help:     "{{ \"Toggle search: / key\" | faint }}",
	Label:    `⚗️  | {{ . | green | bold | underline }}`,
	Selected: "🟢 {{ .Name | bgGreen | black| bold }}",
	Active:   "🟢 {{ .Name | bgGreen | black }} ({{ .Description | green }})",
	Inactive: "   {{ .Name | white }} ({{ .Description | faint }})",
}

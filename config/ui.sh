#!/bin/bash

ui_error()   { echo -e "\e[31m[x] $1.\e[0m";      }
ui_wip()     { echo -e "\e[33m[-] $1...\e[0m";    }
ui_success() { echo -e "\e[32m[v] $1 !\e[0m";     }
ui_info()    { echo -e "\e[34m[?] $1;\e[0m";      }
ui_cmd()     { echo -e "\e[1;30;107m[$] $1\e[0m"; } 

ui_start() { ui_wip "starting the action"; sleep 1; }
ui_done()  { ui_success "action done"; sleep 10;     }

# clear ; echo "UI reference:"
# ui_error "this isn't workin" 
# ui_wip "this is in wip" 
# ui_success "this is a success"
# ui_info "some info I'm givin u"
# ui_cmd "sudo apt exec"


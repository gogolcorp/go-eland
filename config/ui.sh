#!/bin/bash

ui_error()   { echo -e "\e[31m[x] $*.\e[0m";      }
ui_wip()     { echo -e "\e[33m[-] $*...\e[0m";    }
ui_success() { echo -e "\e[32m[v] $* !\e[0m";     }
ui_info()    { echo -e "\e[34m[?] $*;\e[0m";      }
ui_cmd()     { echo -e "\e[1;30;107m[$] $*\e[0m"; } 

ui_start() { ui_wip "starting the action"; sleep 1; }
ui_done()  { ui_success "action done"; sleep 5;     }

#!/bin/bash

core__ui_error()   { echo -e "\e[31m[x] $*.\e[0m";      }
core__ui_wip()     { echo -e "\e[33m[-] $*...\e[0m";    }
core__ui_success() { echo -e "\e[32m[v] $* !\e[0m";     }
core__ui_info()    { echo -e "\e[34m[?] $*;\e[0m";      }
core__ui_cmd()     { echo -e "\e[1;30;107m[$] $*\e[0m"; } 

core__ui_start() { core__ui_wip "starting the action"; sleep 1; }
core__ui_done()  { core__ui_success "action done"; sleep 2;     }

#!/bin/bash

theme="$HOME/dotfiles/config/rofi/styles/power-menu-style1.rasi"

uptime="`uptime -p | sed -e 's/up //g'`"
host=`hostname`

shutdown=' Shutdown'
reboot=' Reboot'
lock=' Lock'
suspend=' Suspend'
logout=' Logout'
yes=' Yes'
no=' No'

confirm_exit() {
    echo -e "$yes\n$no" | rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 250px;}' \
        -theme-str 'mainbox {children: [ "message", "listview" ];}' \
        -theme-str 'listview {columns: 2; lines: 1;}' \
        -theme-str 'element-text {horizontal-align: 0.5;}' \
        -theme-str 'textbox {horizontal-align: 0.5;}' \
        -dmenu \
        -p 'Confirmation' \
        -mesg 'Are you Sure?' \
        -theme ${theme}
}

run_rofi() {
    echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi -dmenu \
        -p "$host" \
        -mesg "Uptime: $uptime" \
        -theme ${theme}
}

run_cmd() {
    selected="$(confirm_exit)"
    if [[ "$selected" == "$yes" ]]; then
        if [[ $1 == '--shutdown' ]]; then
            systemctl poweroff
        elif [[ $1 == '--reboot' ]]; then
            systemctl reboot
        elif [[ $1 == '--suspend' ]]; then
            amixer set Master mute
            systemctl suspend
        elif [[ $1 == '--logout' ]]; then
            i3-msg exit
        fi
    else
        exit 0
    fi
}

chosen="$(run_rofi)"
case ${chosen} in
    $lock)
        # screen-lock
        xset s activate
        ;;
    $suspend)
		run_cmd --suspend
        ;;
    $logout)
		run_cmd --logout
        ;;
    $reboot)
		run_cmd --reboot
        ;;
    $shutdown)
		run_cmd --shutdown
        ;;
esac


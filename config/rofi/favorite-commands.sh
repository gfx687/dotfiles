#!/bin/bash

pick_command() {
    # change to search in directory if this feature proves to be useful
    echo -e "pick-copypasta\nvolume toggle" | rofi -dmenu \
        -theme-str 'mainbox {children: [ "inputbar", "listview" ];}' \
        -p ' Favorites'
}

picked_command=$(pick_command)

if [[ -z "$picked_command" ]]; then
    exit 0
fi

sh $picked_command

#!/bin/bash
function exit() {
    echo ''
    echo '------------------------------'
    echo ''
    echo 'Press ENTER to exit'
    read -p ''
}

trap : INT      # Catches Ctrl-C and exits gracefully
/tmp/run
exit

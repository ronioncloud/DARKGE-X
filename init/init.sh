#!/bin/bash
#
# Copyright (C) 2020 by UsergeTeam@Github, < https://github.com/UsergeTeam >.
#
# This file is part of < https://github.com/UsergeTeam/Userge > project,
# and is released under the "GNU v3.0 License Agreement".
# Please see < https://github.com/uaudith/Userge/blob/master/LICENSE >
#
# All rights reserved.

. init/logbot/logbot.sh
. init/utils.sh
. init/checks.sh

initUserge() {
    printLogo
    assertPrerequisites
    sendMessage "Initializing DARKGE-X ..."
    assertEnvironment
    editLastMessage "Starting DARKGE-X ..."
    printLine
}

startUserge() {
    runPythonModule userge "$@"
}

stopUserge() {
    sendMessage "Exiting DARKGE-X ..."
    stopBGProcesses
    exit 0
}

trap quit TERM
trap stopUserge INT

runUserge() {
    initUserge
    startLogBotPolling
    startUserge "$@"
    stopUserge
}
#!/bin/bash

PSAFUX_OUTPUT=$(ps aux | grep $1 | awk '{print $2}')

PIDS_ARRAY=$(echo $PSAFUX_OUTPUT | tr " " "\n")

YN="N"

function kill_pids() {
        for pid in $PIDS_ARRAY
        do
                echo "Finalizando processo: $pid"
                kill $pid
        done
}


read -p "Deseja finalizar todos processos que iniciam com a palavra $1? (y/N): PIDs:[$(echo $PSAFUX_OUTPUT)] " YN

case $YN in
        [Yy]* ) kill_pids;;
        [Nn]* ) exit;;
        * ) echo "Por favor, responda Y ou N.";;
esac

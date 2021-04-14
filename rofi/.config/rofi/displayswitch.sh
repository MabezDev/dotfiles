#!/bin/zsh

OPTIONS=(linux windows)
SCRIPTS_DIR=/home/mabez/scripts

if [ -z $@ ]
then
# echo current;
for each in "${OPTIONS[@]}"
do
  echo "$each"
done
else
    CHOICE=$@
    if [ x"current" = x"${CHOICE}" ]
    then
        exit 0
    elif [ -n "${CHOICE}" ]
    then
        case "${CHOICE}" in
            linux)
                $SCRIPTS_DIR/util/linux-monitors.sh
            ;;
            windows)
                $SCRIPTS_DIR/vfio/libvirt/hooks/utils/monitor-disconnect.sh
            ;;
            *)
                exit 0
            ;;
        esac
    fi
fi
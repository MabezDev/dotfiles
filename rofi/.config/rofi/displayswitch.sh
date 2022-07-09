#!/bin/zsh

OPTIONS=(linux windows macos)
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
            macos)
                # seems to be an m1 issue where USB ports don't enumerate
                # waking up before switching fixes this issue
                wol a0:78:17:b1:d0:c8 --host=192.168.0.30 --wait 1000 > /dev/null
                # wol a0:a3:f0:aa:7c:05 > /dev/null # --host=192.168.0.11 # doesn't work
                m27q-kvm > /dev/null
            ;;
            *)
                exit 0
            ;;
        esac
    fi
fi
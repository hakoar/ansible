#!/bin/bash
source /etc/profile

if [ $# -lt 1 ]
then
 echo ""
 echo "usage: $0 [ SSH Account ]"
 echo ""
 exit 1
fi

export PLAY_HOME_DIR="."
export PLAY_LOG=$PLAY_HOME_DIR/play.log
export RUN_LOCK_FILE=$PLAY_HOME_DIR/.run.lock

export TIMESTAMP=`date`
aborted()
{
    echo "[ $TIMESTAMP ] Play interrupted. Cleaning up and aborting...." >> $PLAY_LOG
    exit 255
}

# trap interruptions
trap aborted SIGINT SIGHUP SIGTERM SIGABRT

echo "-------------------------------------------------------------------"
echo ""
echo "  !!!! Uninstalling Grafana... !!!!"
echo ""
echo "-------------------------------------------------------------------"
ansible-playbook $PLAY_HOME_DIR/grafana.yml -v -u $1 -k -K -b -i $PLAY_HOME_DIR/playbook-hosts --tags "grafana-uninstall" --limit "grafana"

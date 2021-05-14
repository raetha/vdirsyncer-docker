#!/bin/sh
if [ "$1" = 'cron' ]; then
	#Run Initial Sync
	/sync.sh

	#Setup CronJob
	echo "$CRONTIMETABLE /sync.sh >> /dev/stdout 2>&1" | crontab -
	crond -f
fi

exec "vdirsyncer $@"

#!/bin/sh
if [ -f "/data/deploy/logagent/bin/logagent" ] 
	then
		echo 'start logagent ...'
		nohup bin/logagent >/dev/null 2>&1 &
	else 
		echo 'can''t find logagent!'
fi
catalina.sh run

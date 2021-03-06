#!/bin/bash

if (($# == 0)); then
    echo "Please pass arguments -t <task1>"
    exit 2
fi

while getopts ":t:" opt; do
	case $opt in
		t) 
			echo "-t was triggered, Parameter: $OPTARG" >&2
			TASKS=$OPTARG
			;;
		\?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
    esac
done

if [ "$TASKS" == "stream" ]
	then
		echo "Normal Stream"
		pwd
		cd /home/pi/Apps/MetaBase
		sudo node app.js --config /home/pi/Desktop/Configs/metabase-config.json -o /home/pi/Desktop/MetaBase-CSV-Bash-Stream
		pwd

fi 

if [ "$TASKS" == "stream_no_graph" ]
	then
		echo "No Graph Stream"
		pwd
		cd /home/pi/Apps/MetaBase
		sudo node app.js --config /home/pi/Desktop/Configs/metabase-config.json --no-graph -o /home/pi/Desktop/MetaBase-CSV-Bash-Stream
		pwd

fi 


if [ "$TASKS" == "log_normal" ]
	then
		echo "Normal Log"
		pwd
		cd /home/pi/Apps/MetaBase
		sudo node app.js --config /home/pi/Desktop/Configs/metabase-config_log.json -o /home/pi/Desktop/MetaBase-CSV-Bash
		pwd

fi 

if [ "$TASKS" == "download_normal" ]
	then
		echo "Download Log"
		pwd
		cd /home/pi/Apps/MetaBase
		echo "Running Code"
		sudo node app.js --config /home/pi/Desktop/Configs/metabase-config_download.json -o /home/pi/Desktop/MetaBase-CSV-Bash
		cd /home/pi/Desktop/Synchronize_Data/
		sudo python3 synchronize_files_ucl.py
		pwd

fi 

if [ "$TASKS" == "log_quaternion" ]
	then
		echo "Log Quaternion"
		pwd
		cd /home/pi/Apps/MetaBase
		echo "Running Code"
		sudo node app.js --config /home/pi/Desktop/Configs/metabase-config_quaternion_log.json -o /home/pi/Desktop/MetaBase-CSV-Bash-Quat
		pwd
fi

if [ "$TASKS" == "download_quaternion" ]
	then
		echo "Download Quaternion"
		pwd
		cd /home/pi/Apps/MetaBase
		echo "Running Code"
		sudo node app.js --config /home/pi/Desktop/Configs/metabase-config_quaternion_download.json -o /home/pi/Desktop/MetaBase-CSV-Bash-Quat
		pwd

fi

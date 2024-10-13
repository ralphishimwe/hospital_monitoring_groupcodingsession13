#!/bin/bash

# Define the log file and get the current timestamp
log_file="heart_rate_log.txt"
timestamp=$(date '+%Y%m%d_%H%M%S')

# Create the new archived log file name
archived_log_file="${log_file}_${timestamp}"

# Rename (archive) the log file
mv $log_file $archived_log_file

# Create a new log file to continue logging
touch $log_file

# Confirm the file has been archived and logging continues
echo "Log file archived as $archived_log_file, and a new log file has been created."


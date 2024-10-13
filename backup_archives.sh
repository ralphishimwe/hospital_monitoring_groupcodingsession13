#!/bin/bash

# Defining the dir to move archived log files
archive_dir="archived_logs_group13"

# Creating the dir if it doesn't exist
mkdir -p $archive_dir

# Moving all archived log files (those with timestamps) to the directory
mv heart_rate_log.txt_* $archive_dir/

# Checking if the move operation was successful
if [ $? -eq 0 ]; then
    echo "Archived files successfully moved to $archive_dir."
else
    echo "Failed to move archived files."
    exit 1
fi

# remote server details
remote_host="8669535c4480.6b7419f6.alu-cod.online"
remote_user="8669535c4480"
remote_dir="/home/"

# Securely copying the files to the remote server using scp
scp $archive_dir/* $remote_user@$remote_host:$remote_dir

# Checking if the scp command was successful
if [ $? -eq 0 ]; then
    echo "Backup complete. Files successfully transferred to $remote_host:$remote_dir"
else
    echo "Backup failed. Please check SSH connection or credentials."
    exit 1
fi

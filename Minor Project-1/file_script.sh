#!/bin/bash

# Log file location
LOGFILE="/var/log/filesystem_management.log"

# Function to create directories
create_directory() {
    read -p "Enter the full path of the directory to create: " dirpath
    if [ -d "$dirpath" ]; then
        echo "Directory $dirpath already exists." | tee -a $LOGFILE
    else
        mkdir -p "$dirpath"
        echo "Directory $dirpath created successfully." | tee -a $LOGFILE
    fi
}

# Function to set permissions on a file or directory
set_permissions() {
    read -p "Enter the full path of the file or directory: " path
    if [ ! -e "$path" ]; then
        echo "The file or directory $path does not exist." | tee -a $LOGFILE
    else
        read -p "Enter the permissions (e.g., 755): " permissions
        chmod "$permissions" "$path"
        echo "Permissions set to $permissions for $path." | tee -a $LOGFILE
    fi
}

# Function to check disk usage
check_disk_usage() {
    echo "Disk usage:" | tee -a $LOGFILE
    df -h | tee -a $LOGFILE
}

# Display menu options to the user
while true; do
    echo "File System Management Menu:"
    echo "1. Create Directory"
    echo "2. Set Permissions"
    echo "3. Check Disk Usage"
    echo "4. Exit"
    read -p "Choose an option: " option

    case $option in
        1) create_directory ;;
        2) set_permissions ;;
        3) check_disk_usage ;;
        4) echo "Exiting..." ; exit 0 ;;
        *) echo "Invalid option, please try again." ;;
    esac
done

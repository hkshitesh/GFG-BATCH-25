#!/bin/bash

# Log file location
LOGFILE="/var/log/group_management.log"

# Function to add a group
add_group() {
    read -p "Enter group name to add: " groupname
    if getent group "$groupname" > /dev/null; then
        echo "Group $groupname already exists." | tee -a $LOGFILE
    else
        groupadd "$groupname"
        echo "Group $groupname added successfully." | tee -a $LOGFILE
    fi
}

# Function to delete a group
delete_group() {
    read -p "Enter group name to delete: " groupname
    if getent group "$groupname" > /dev/null; then
        groupdel "$groupname"
        echo "Group $groupname deleted successfully." | tee -a $LOGFILE
    else
        echo "Group $groupname does not exist." | tee -a $LOGFILE
    fi
}

# Function to list all groups
list_groups() {
    echo "List of all groups:" | tee -a $LOGFILE
    cut -d: -f1 /etc/group | tee -a $LOGFILE
}

# Display menu options to the user
while true; do
    echo "Group Management Menu:"
    echo "1. Add Group"
    echo "2. Delete Group"
    echo "3. List All Groups"
    echo "4. Exit"
    read -p "Choose an option: " option

    case $option in
        1) add_group ;;
        2) delete_group ;;
        3) list_groups ;;
        4) echo "Exiting..." ; exit 0 ;;
        *) echo "Invalid option, please try again." ;;
    esac
done

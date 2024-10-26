#!/bin/bash
LOGFILE="/var/log/user_management.log"

add_user() {
    read -p "Enter username to add: " username
    if id "$username" &>/dev/null; then
        echo "User $username already exists." | tee -a $LOGFILE
    else
        useradd "$username"
        echo "User $username added successfully." | tee -a $LOGFILE
    fi
}

delete_user() {
    read -p "Enter username to delete: " username
    if id "$username" &>/dev/null; then
        userdel "$username"
        echo "User $username deleted successfully." | tee -a $LOGFILE
    else
        echo "User $username does not exist." | tee -a $LOGFILE
    fi
}

list_users() {
    echo "List of users:" | tee -a $LOGFILE
    cut -d: -f1 /etc/passwd | tee -a $LOGFILE
}

# Menu for selecting the function
while true; do
    echo "User Management Menu:"
    echo "1. Add User"
    echo "2. Delete User"
    echo "3. List Users"
    echo "4. Exit"
    read -p "Choose an option: " option

    case $option in
        1) add_user ;;
        2) delete_user ;;
        3) list_users ;;
        4) echo "Exiting..." ; exit 0 ;;
        *) echo "Invalid option, please try again." ;;
    esac
done

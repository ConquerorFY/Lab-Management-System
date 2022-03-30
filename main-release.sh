#!/bin/bash

BOLD=$(tput bold)
NORMAL=$(tput sgr0)

function task2AQuery() {
    read -p "Student ID             : " STUDENT_ID
    read -p "Full Name (As Per NRIC): " FULLNAME
    read -p "Contact Number         : " CONTACT
    read -p "TAR UC Email Address   : " EMAIL

    NEW_STUDENT_DATA="${STUDENT_ID}:${FULLNAME}:${CONTACT}:${EMAIL}"
    echo "$NEW_STUDENT_DATA" >> student.txt

    printf "\n\n"

    read -p "Register Another Student? (y) es or (q) uit: " REGISTER_OPTION

    if [ "$REGISTER_OPTION" = "y" ]
    then
        task2AQuery
    else
        return 1
    fi
}

function task2A() {
    echo "Register New Student Form"
    printf '%.s=' $(seq 1 26)
    printf "\n"

    task2AQuery

    printf "\n\n"

    while :
    do
        echo "Press (q) to return to ${BOLD}Lab Equipment ${NORMAL}Management Menu"
        read RETURN_OPTION
        if [ "$RETURN_OPTION" = "q" ]
        then
            task1
            return 1
        fi
    done    
}

function task2BQuery() {
    unset IFS 
    SEARCH_STUDENT_NAME=""
    SEARCH_STUDENT_CONTACT=""
    SEARCH_STUDENT_MAIL=""

    read -p "Enter Student ID: " SEARCH_STUDENT_ID
    printf '%.s─' $(seq 1 $(tput cols))

    IFS=$'\n'
    for STUDENT_DATA in $(cat student.txt); do
        ID=$(echo "$STUDENT_DATA" | cut -d':' -f1)

        if [ "$ID" = "$SEARCH_STUDENT_ID" ]
        then
            SEARCH_STUDENT_NAME=$(echo "$STUDENT_DATA" | cut -d':' -f2)
            SEARCH_STUDENT_CONTACT=$(echo "$STUDENT_DATA" | cut -d':' -f3)
            SEARCH_STUDENT_MAIL=$(echo "$STUDENT_DATA" | cut -d':' -f4)

        break
        fi
    done

    printf "\n\n"

    echo "Full Name (auto display)     : $SEARCH_STUDENT_NAME"
    echo "Contact Number (auto display): $SEARCH_STUDENT_CONTACT"
    echo "Email Address (auto display) : $SEARCH_STUDENT_MAIL"

    printf "\n\n"
    
    read -p "Search Another Student? (y) es or (q) uit: " SEARCH_OPTION
    if [ "$SEARCH_OPTION" = "y" ]
    then
        task2BQuery
    else
        return 1
    fi
}


function task2B() {
    echo "Search Student Form" | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta" | tr -d '\n' | head -c $(tput cols)
    printf '%.s─' $(seq 1 22) | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta" | tr -d '\n' | head -c $(tput cols)

    printf "\n"

    task2BQuery

    while :
    do
        echo "Press (q) to return to ${BOLD}Lab Equipment ${NORMAL}Management Menu"
        read RETURN_OPTION
        if [ "$RETURN_OPTION" = "q" ]
        then
            task1
            return 1
        fi
    done  
}

function task3CQuery() {
    read -p "Stock Code                : " STOCK_CODE  
    read -p "Manufacturer              : " MANUFACTURER
    read -p "Model                     : " MODEL
    read -p "Item Description          : " ITEM_DESCRIPTION
    read -p "Serial Number             : " SERIAL_NUMBER
    read -e -p "Status (default-Available): " -i "Available" STATUS

    NEW_EQUIPMENT_DATA="${STOCK_CODE}:${MANUFACTURER}:${MODEL}:${ITEM_DESCRIPTION}:${SERIAL_NUMBER}:${STATUS}"
    echo "$NEW_EQUIPMENT_DATA" >> equipment.txt

    printf "\n\n"

    read -p "Add Another New Equipment? (y) es or (q) uit: " ADD_OPTION

    if [ "$ADD_OPTION" = "y" ]
    then
        task3CQuery
    else
        return 1
    fi
}

function task3C() {
    echo "Add New Lab Equipment Form"
    printf '%.s=' $(seq 1 27)
    printf "\n"

    task3CQuery

    printf "\n\n"

    while :
    do
        echo "Press (q) to return to ${BOLD}Lab Equipment ${NORMAL}Management Menu"
        read RETURN_OPTION
        if [ "$RETURN_OPTION" = "q" ]
        then
            task1
            return 1
        fi
    done    
}

function task3DQuery() {
    unset IFS 
    SEARCH_MANUFACTURER=""
    SEARCH_MODEL=""
    SEARCH_DESCRIPTION=""
    SEARCH_SERIAL=""
    SEARCH_STATUS=""

    read -p "Enter Stock Code: " SEARCH_STOCK
    printf '%.s─' $(seq 1 $(tput cols))

    IFS=$'\n'
    for EQUIPMENT_DATA in $(cat equipment.txt); do
        CODE=$(echo "$EQUIPMENT_DATA" | cut -d':' -f1)

        if [ "$CODE" = "$SEARCH_STOCK" ]
        then
            SEARCH_MANUFACTURER=$(echo "$EQUIPMENT_DATA" | cut -d':' -f2)
            SEARCH_MODEL=$(echo "$EQUIPMENT_DATA" | cut -d':' -f3)
            SEARCH_DESCRIPTION=$(echo "$EQUIPMENT_DATA" | cut -d':' -f4)
            SEARCH_SERIAL=$(echo "$EQUIPMENT_DATA" | cut -d':' -f5)
            SEARCH_STATUS=$(echo "$EQUIPMENT_DATA" | cut -d':' -f6)

        break
        fi
    done

    printf "\n\n"

    echo "Manufacturer (auto display)     : $SEARCH_MANUFACTURER"
    echo "Model (auto display)            : $SEARCH_MODEL"
    echo "Item Description (auto display) : $SEARCH_DESCRIPTION"
    echo "Serial Number (auto display)    : $SEARCH_SERIAL"
    echo "Status                          : $SEARCH_STATUS"

    printf "\n\n"
    
    read -p "Search Another Equipment? (y) es or (q) uit: " SEARCH_OPTION
    if [ "$SEARCH_OPTION" = "y" ]
    then
        task3DQuery
    else
        return 1
    fi
}


function task3D() {
    echo "Search Lab Equipment Form" | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta" | tr -d '\n' | head -c $(tput cols)
    printf '%.s─' $(seq 1 22) | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta" | tr -d '\n' | head -c $(tput cols)

    printf "\n"

    task3DQuery

    while :
    do
        echo "Press (q) to return to ${BOLD}Lab Equipment ${NORMAL}Management Menu"
        read RETURN_OPTION
        if [ "$RETURN_OPTION" = "q" ]
        then
            task1
            return 1
        fi
    done  
}

function task4() {
    echo "Student Details Validation Form" | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta" | tr -d '\n' | head -c $(tput cols)
    printf '%.s─' $(seq 1 $(tput cols))

    printf '\n\n'

    read -p "Please enter the Student's ID Number: " SEARCH_STUDENT_ID
    SEARCH_STUDENT_NAME=""

    unset IFS
    IFS=$'\n'
    for STUDENT_DATA in $(cat student.txt); do
        ID=$(echo "$STUDENT_DATA" | cut -d':' -f1)
        if [ "$SEARCH_STUDENT_ID" = "$ID" ]
        then
            SEARCH_STUDENT_NAME=$(echo "$STUDENT_DATA" | cut -d':' -f2)
            break
        fi
    done

    printf '\n\n'

    echo "Student Name (auto display): $SEARCH_STUDENT_NAME"

    while :
    do
        read -p "Press ${BOLD}(n) ${NORMAL}to proceed ${BOLD}Loan Equipment ${NORMAL}or ${BOLD}(q) to return to ${BOLD}Lab Equipment Management Menu: " READ_OPTION
        if [ "$READ_OPTION" = "n" ]
        then
            break
        elif [ "$READ_OPTION" = "q" ]
        then
            task1
            return 1
        else
            echo "Invalid Command! Please Try Again!"
        fi
    done

    while :
        do
        echo "Loan Lab Equipment Form" | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta" | tr -d '\n' | head -c $(tput cols)
        printf '%.s─' $(seq 1 $(tput cols))

        printf '\n\n'

        read -p "Please enter the stock code: " STOCK_CODE
        STOCK_SERIAL=""
        STOCK_MODEL=""
        STOCK_DESCRIPTION=""
        STOCK_MANUFACTURER=""
        STOCK_STATUS=""
        WHILE_BREAK="false"

        unset IFS
        IFS=$'\n'
        for EQUIPMENT_DATA in $(cat equipment.txt); do
            CODE=$(echo "$EQUIPMENT_DATA" | cut -d':' -f1)
            if [ "$STOCK_CODE" = "$CODE" ]
            then
                STOCK_SERIAL=$(echo "$EQUIPMENT_DATA" | cut -d':' -f5)
                STOCK_MODEL=$(echo "$EQUIPMENT_DATA" | cut -d':' -f3)
                STOCK_DESCRIPTION=$(echo "$EQUIPMENT_DATA" | cut -d':' -f4)
                STOCK_STATUS=$(echo "$EQUIPMENT_DATA" | cut -d':' -f6)
                STOCK_MANUFACTURER=$(echo "$EQUIPMENT_DATA" | cut -d':' -f2)
                
                if [ "$STOCK_STATUS" = "Available" ]
                then
                    WHILE_BREAK="true"
                    break
                else
                    echo "The requested equipment is currently not available!"
                    WHILE_BREAK="false"
                    break
                fi
            fi
        done

        if [ "$WHILE_BREAK" = "true" ] 
        then
            break
        fi
    done

    printf '\n\n'

    echo "Serial Number (auto display): $STOCK_SERIAL"
    echo "Model (auto display)        : $STOCK_MODEL"
    echo "Description (auto display)  : $STOCK_DESCRIPTION"
    printf '%.s─' $(seq 1 $(tput cols))

    printf '\n\n'

    echo 'Please enter the following details upon the loan of the lab equipment.'

    printf '\n\n'

    read -p "Stock Status          : " STOCK_STATUS
    read -p "Loan Date (mm/dd/yyyy): " STOCK_LOAN_DATE
    read -p "Reason to Loan        : " STOCK_LOAN_REASON

    printf '\n\n'

    while :
    do
        read -p "Press ${BOLD}(y) ${NORMAL}to continue to ${BOLD}Loan Lab Equipment ${NORMAL}or ${BOLD}(c) to generate ${BOLD}Lab Equipment Loan Receipt: " READ_OPTION
        if [ "$READ_OPTION" = "y" ]
        then
            if [ "$STOCK_STATUS" = "On Loan" ]
            then
                LOANER_FILE="${SEARCH_STUDENT_ID}.txt"
                echo "${STOCK_MODEL}:${STOCK_DESCRIPTION}:${STOCK_LOAN_REASON}" >> "$LOANER_FILE"
                task4UpdateData
            fi
            task4
            return 1
        elif [ "$READ_OPTION" = "c" ]
        then
            if [ "$STOCK_STATUS" = "On Loan" ]
            then
                LOANER_FILE="${SEARCH_STUDENT_ID}.txt"
                echo "${STOCK_MODEL}:${STOCK_DESCRIPTION}:${STOCK_LOAN_REASON}" >> "$LOANER_FILE"
                task4UpdateData
            fi
            task4Receipt
            task1
            return 1
        else
            echo "Invalid Command! Please Try Again!"
        fi
    done
}

function task4UpdateData() {
    unset IFS
    IFS=$'\n'

    for EQUIPMENT_DATA in $(cat equipment.txt); do
        CODE=$(echo "$EQUIPMENT_DATA" | cut -d':' -f1)
        if [ "$STOCK_CODE" = "$CODE" ]
        then
            echo "${STOCK_CODE}:${STOCK_MANUFACTURER}:${STOCK_MODEL}:${STOCK_DESCRIPTION}:${STOCK_SERIAL}:${STOCK_STATUS}" >> temp_equipment.txt
        else
            echo "${EQUIPMENT_DATA}" >> temp_equipment.txt
        fi
    done

    rm equipment.txt
    mv temp_equipment.txt equipment.txt
}

function task4Receipt() {
    RECEIPT_FILE="${SEARCH_STUDENT_ID}_${STOCK_LOAN_DATE////-}.txt"

    echo "Equipment Loan Receipt" | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta" | tr -d '\n' | head -c $(tput cols) >> "$RECEIPT_FILE"

    printf '\n\n' >> "$RECEIPT_FILE"

    echo "Student ID  : ${SEARCH_STUDENT_ID}" >> "$RECEIPT_FILE"
    echo "Student Name: ${SEARCH_STUDENT_NAME}" >> "$RECEIPT_FILE"
    echo "Loan Date   : ${STOCK_LOAN_DATE}" >> "$RECEIPT_FILE"

    printf '\n\n' >> "$RECEIPT_FILE"
    printf '%.s=' $(seq 1 $(tput cols)) >> "$RECEIPT_FILE"
    printf '\n\n' >> "$RECEIPT_FILE"

    TITLE_STRING=$(printf 'No.: - Model: -    Description: - Reason to Loan: ')
    printf "${TITLE_STRING//-/                         }" >> "$RECEIPT_FILE"
    printf '\n\n' >> "$RECEIPT_FILE"
    printf '%.s=' $(seq 1 $(tput cols)) >> "$RECEIPT_FILE"
    printf '\n\n' >> "$RECEIPT_FILE"

    unset IFS
    IFS=$'\n'
    NUMBER=0
    LOANER_FILE="${SEARCH_STUDENT_ID}.txt"
    for LOAN_DATA in $(cat "$LOANER_FILE"); do
        LOAN_MODEL=$(echo "$LOAN_DATA" | cut -d':' -f1)
        LOAN_DESCRIPTION=$(echo "$LOAN_DATA" | cut -d':' -f2)
        LOAN_REASON=$(echo "$LOAN_DATA" | cut -d':' -f3)

        NUMBER=$(expr $NUMBER + 1)
        
        DATA_STRING=$(printf "${NUMBER} + ${LOAN_MODEL} + ${LOAN_DESCRIPTION} + ${LOAN_REASON}")
        printf "${DATA_STRING//+/                            }" >> "$RECEIPT_FILE"
        printf '\n' >> "$RECEIPT_FILE"
    done

    printf '\n\n' >> "$RECEIPT_FILE"
    echo "Total loan items: $NUMBER" >> "$RECEIPT_FILE"

    echo "Receipt ${RECEIPT_FILE} has been generated!"
}

function task1() {
    echo "${BOLD}Lab Equipment${NORMAL} Management Menu"
    printf '%.s─' $(seq 1 30)

    printf "\n\n"

    echo "A - Register New Student"
    echo "B - Search Student Details"
    echo "C - Add New Lab Equipment"
    echo "D - Search Lab Equipment"
    echo "E - Loan Lab Equipment"
    printf "\n"
    echo "Q - Exit From Program"
    read -p "Please select a choice: " CHOICE

    if [ "$CHOICE" = "A" ]
    then
        task2A
    elif [ "$CHOICE" = "B" ]
    then
        task2B
    elif [ "$CHOICE" = "C" ]
    then
        task3C
    elif [ "$CHOICE" = "D" ]
    then
        task3D
    elif [ "$CHOICE" = "E" ]
    then
        task4
    elif [ "$CHOICE" = "Q" ]
    then
        echo "Exiting the Application!"
        exit 1
    else
        echo "Invalid Command! Please Try Again!"
        task1
    fi
}

task1

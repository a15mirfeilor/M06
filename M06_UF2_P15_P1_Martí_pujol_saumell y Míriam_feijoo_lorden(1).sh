#!/bin/bash

#https://github.com/a15mirfeilor/M06# 

#comprovar que le usuario es root

if [[ "${UID}" -eq 0 ]]; then
    echo 'ets el root.'
    #Pedir datos del usuario
    # pregunta per lusuari
    read -p 'Entra el nom del usuari: ' USER_NAME
    # pregunta sobre el nom de la persona
    read -p 'Entra el nom de la persona: ' COMMENT
    # preguntat password
    read -p 'Entra el password: ' PASSWORD
    #crear el usuario
    useradd -c "${COMMENT}" -m ${USER_NAME}
    # mirar si la comanda s'ha fet correctament
    if [[ "${?}" -ne 0 ]];    then
        echo 'La comanda no sa executat correctament.'
    else
        #mostrar usuari
        echo "el teu usuari es ${USER_NAME}"
        #mostrar password
        #echo "${USER_NAME}:${PASSWORD}" | chpasswd
    echo -e "${PASSWORD}\n${PASSWORD}" | sudo passwd ${USER_NAME} &> /dev/null
        # Test if the command succeeded.
echo "passwd: Success"
        if [[ "${?}" -ne 0 ]]; then
            echo 'la teva comanda no sha executat.'
        else
            echo "La teva contrasenya es ${PASSWORD}"
            # Cambiar el password el primer cop.
            passwd -e ${USER_NAME}
            # Display the UID.
            grep "$USER_NAME:" /etc/passwd | cut -d':' -f3
            echo "el teu usuari es". ${USER_NAME}
            echo "la teva contrasenya es". ${PASSWORD}
            echo "la teva host es". ${HOSTNAME}
        fi


    fi

else

    echo "no ets el root"

fi



#!/bin/bash

# https://github.com/IcaroM-CdC

# No masters, no gods, only man


Logo(){
    printf "\e[1;33m   ______                   __            __                            __    __  ______  _______    \e[0m \n"
    printf "\e[1;33m  /      \                 |  \          |  \                          |  \  |  \|      \|       \   \e[0m \n"
    printf "\e[1;33m |  ######\  ______    ____| ## __    __  \## _______    ______        | ##  | ## \######| #######\  \e[0m \n"
    printf "\e[1;33m | ##__| ## /      \  /      ##|  \  |  \|  \|       \  /      \       | ##__| ##  | ##  | ##  | ##  \e[0m \n"
    printf "\e[1;33m | ##    ##|  ######\|  #######| ##  | ##| ##| #######\|  ######\      | ##    ##  | ##  | ##  | ##  \e[0m \n"
    printf "\e[1;33m | ########| ##   \##| ##  | ##| ##  | ##| ##| ##  | ##| ##  | ##      | ########  | ##  | ##  | ##  \e[0m \n"
    printf "\e[1;33m | ##  | ##| ##      | ##__| ##| ##__/ ##| ##| ##  | ##| ##__/ ##      | ##  | ## _| ##_ | ##__/ ##  \e[0m \n"
    printf "\e[1;33m | ##  | ##| ##       \##    ## \##    ##| ##| ##  | ## \##    ##      | ##  | ##|   ## \| ##    ##  \e[0m \n"
    printf "\e[1;33m  \##   \## \##        \#######  \######  \## \##   \##  \######        \##   \## \###### \#######   \e[0m \n"
    printf "\n"
    printf "\n"

}

Menu(){

    printf "\e[1;92m[\e[0m\e[1;77m1\e[0m\e[1;92m]\e[0m\e[1;93m Fimware Padrão\e[0m      \e[1;92m[\e[0m\e[1;77m2\e[0m\e[1;92m]\e[0m\e[1;93m  Firmware HID\e[0m         \e[1;92m[\e[0m\e[1;77m99\e[0m\e[1;92m]\e[0m\e[1;93m Sair\e[0m\n"

    read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Choose an option: \e[0m\en' option

    if [[ $option == 1 ]]; then
        
    printf "Insira o arduino com o jumper nos dois pinos conectados e então remova o jumper. [Press ENTER]\n"
    read 

    dfu-programmer atmega16u2 erase
    dfu-programmer atmega16u2 flash --suppress-bootloader-mem firmwares/Arduino-atmega16u2-Uno-Rev3.hex
    dfu-programmer atmega16u2 reset    
        
    printf "\e[1;33mPRONTO!!\e[0m \n"
    
    elif [[ $option == 2 ]]; then

    printf "Insira o código no ARDUINO pela IDE. [Press ENTER]\n"
    read 

    printf "Conecte os dois pinos para resetar o ARDUINO e remova o jumper em seguida. [Press ENTER]\n"
    read

    printf "Escrevendo o firmware no teclado. [Press ENTER]\n"

    dfu-programmer atmega16u2 erase
    dfu-programmer atmega16u2 flash firmwares/Arduino-keyboard-0.3.hex
    dfu-programmer atmega16u2 reset

    printf "\e[1;33mPRONTO!!\e[0m \n"
    
    elif [[ $option == 99 ]]; then

    exit 1


    else

    printf "\n"
    printf "\n"
    printf "\e[1;33mCOMANDO INVÁLIDO\e[0m \n"
    printf "\n"
    printf "\n"

    Menu

    fi
}

Logo
Menu
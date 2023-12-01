
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root"
    sleep .5 
fi
echo "Running as root..."
sleep .5
clear
while true; do
    clear
        echo -e "${BLUE}${YELLOW} 1.${NC} ${CYAN}install nekoray${NC}         ${BLUE}${NC}"
        echo -e "${BLUE}${YELLOW} 2.${NC} ${CYAN}set DNS for neko(no need to do at the first time) (have to do after restart)${NC}         ${BLUE}${NC}"
        echo -e "${BLUE}${YELLOW}   ${NC} ${CYAN}coming soon!${NC}         ${BLUE}${NC}"
        echo -e "${BLUE}${YELLOW} 0.${NC} ${CYAN}exit${NC}         ${BLUE}${NC}"
        echo -e "This bash  was created by ${GREEN}ArmanATI${NC}\n"
        echo -e "Special thanks to ${GREEN}saeed${NC} for his codes.\n"


    read -p "Enter option number: " choice
    case $choice in
          #install neko
        1)
            clear
            echo -e "${GREEN}installing nekoray${NC}" 
            echo ""
            cd
            apt update && apt upgrade -y
            sudo apt install git wget curl ufw  wget -y
            sudo apt install build-essential -y
            sudo apt install unzip -y
            sudo apt install gunzip -y
            wget https://github.com/MatsuriDayo/nekoray/releases/download/3.25/nekoray-3.25-2023-11-25-debian-x64.deb
            sudo apt install ./nekoray-3.25-2023-11-25-debian-x64.deb -y
            cd
            wget https://github.com/Arman-ATI/linux-neko-dns-problem/archive/refs/heads/master.zip
            unzip master.zip
            cd linux-neko-dns-problem-master
            make
            ./dns_proxy
            echo ""
            echo -e "Press ${RED}ENTER${NC} to continue"
            read -s -n 1
            ;;
        2)
                clear
                echo -e "${BLUE}${YELLOW} 1.${NC} ${GRAY}set DNS for neko${NC}                               ${BLUE}${NC}"
                echo -e "${BLUE}${YELLOW} 2.${NC} ${GRAY}unset DNS for neko${NC}                               ${BLUE}${NC}"
                read -p "Enter option number: " choice
                case $choice in
                 1)
                    clear
                    cd
                    mv dns_proxy_no_neko.conf dns_proxy
                    make
                    ./dns_proxy
                    echo ""
                    echo -e "Press ${RED}ENTER${NC} to continue"
                    read -s -n 1
                 2)
                    clear
                    cd
                    mv dns_proxy_no_neko.conf dns_proxy
                    make
                    ./dns_proxy
                    echo ""
                    echo -e "Press ${RED}ENTER${NC} to continue"
                    read -s -n 1
        # EXIT
        0)
            echo ""
            echo -e "${GREEN}Exiting...${NC}"
            echo "Exiting program"
            exit 0
            ;;
         *)
           echo "Invalid option. Please choose a valid option."
           echo ""
           echo -e "Press ${RED}ENTER${NC} to continue"
           read -s -n 1
           ;;
      esac
done
        


RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
GRAY='\033[0;37m'
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
        echo -e "${BLUE}|${YELLOW} 1.${NC} ${CYAN}install nekoray${NC}         ${BLUE}|${NC}"
        echo -e "${BLUE}|${YELLOW} 1.${NC} ${CYAN}coming soon!${NC}         ${BLUE}|${NC}"
        echo -e "${BLUE}|${YELLOW} 1.${NC} ${CYAN}exit${NC}         ${BLUE}|${NC}"
        echo -e "This bash  was created by ${GREEN}ArmanATI1${NC}\n"
        echo -e "Special thanks to ${GREEN}saeed${NC} for his codes.\n"


    read -p "Enter option number: " choice
    case $choice in
          #install neko
        1)
            echo -e "${GREEN}installing nekoray${NC}" 
            echo ""
            cd
            apt update && apt upgrade -y
            sudo apt install git wget curl ufw  wget
            sudo apt install build-essential
            wget https://github.com/MatsuriDayo/nekoray/releases/download/3.25/nekoray-3.25-2023-11-25-debian-x64.deb
            sudo apt install ./nekoray-3.25-2023-11-25-debian-x64.deb
            cd
            wget https://github.com/Arman-ATI/linux-neko-dns-problem/archive/refs/heads/master.zip
            unzip master.zip
            cd dns-tcp-socks-proxy-master
            make
            ./dns_proxy
            echo ""
            echo -e "Press ${RED}ENTER${NC} to continue"
            read -s -n 1
            ;;
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
        

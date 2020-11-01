#!/bin/sh
# _auther_ : ggb0n
# _myblog_ : http://ggb0n.cool
# _data_   : 2020/11/01
# _version : 0.1

download_gef(){
    echo "\033[32m[+] Downloading gef...\033[0m"
    git clone https://github.com/gatieme/GdbPlugins.git 
    #echo source ~/pwnbox/GdbPlugins/gef/gef.py > ~/.gdbinit
    echo "\033[32m[+] Download finish.\033[0m"
}

download_peda(){
    echo "\033[32m[+] Downloading peda...\033[0m"
    git clone https://github.com/longld/peda 
    #echo source ~/pwnbox/GdbPlugins/peda/peda.py > ~/.gdbinit
    echo "\033[32m[+] Download finish.\033[0m"
}

download_pwndbg(){
    echo "\033[32m[+] Downloading pwndbg...\033[0m"
    git clone https://github.com/pwndbg/pwndbg
    cd pwndbg
    ./setup.sh
    cd ..
    #echo source ~/pwnbox/GdbPlugins/pwndbg/gdbinit.py > ~/.gdbinit
    echo "\033[32m[+] Download finish.\033[0m"
}

download_LibcSearcher(){
    echo "\033[32m[+] Downloading LibcSearcher...\033[0m"
    git clone https://github.com/lieanu/LibcSearcher
    cd LibcSearcher
    python setup.py develop
    cd ..
    echo "\033[32m[+] Download Finish.\033[0m"
}

download_pwntools(){
    echo "\033[32m[+] Downloading pwntools...\033[0m"
    apt-get install -y python-dev python-pip libffi-dev libssl-dev
    pip install -U setuptools
    git clone https://github.com/Gallopsled/pwntools 
    cd pwntools
    python setup.py install
    cd ..
    echo "\033[32m[+] Download finish.\033[0m"
}

download_ROPgadget(){
    echo "\033[32m[+] Downloading ROPgadget...\033[0m"
    apt-get install python-capstone
    git clone https://github.com/JonathanSalwan/ROPgadget.git 
    cd ROPgadget
    python setup.py install
    cd ..
    echo "\033[32m[+] Download finish.\033[0m"
}

download_ONEgadget(){
    echo "\033[32m[+] Downloading one_gadget...\033[0m"
    apt -y install ruby
    gem install one_gadget
    echo "\033[32m[+] Download finish.\033[0m"
}

change_gdbplugins(){
    echo "\033[31mwhich to choose? 1)pwndbg 2)peda 3) gef\033[0m"
    read choise1
    case $choise1 in
        1) echo source ~/pwnbox/pwndbg/gdbinit.py > ~/.gdbinit
        ;;
        2) echo source ~/pwnbox/peda/peda.py > ~/.gdbinit
        ;;
        3) echo source ~/pwnbox/GdbPlugins/gef/gef.py > ~/.gdbinit
        ;;
    esac
    echo "\033[32m[+] Change gdbplugin success.\033[0m"
}

# mk pwn-dir
mkdir ~/pwnbox
cd ~/pwnbox

while :
do
    # menu
    echo "\n**********menu**********"
    echo "1) Download gef"
    echo "2) Download peda"
    echo "3) Download pwndbg"
    echo "4) Download LibcSearcher"
    echo "5) Download pwntools"
    echo "6) Download ROPgadget"
    echo "7) Download one_gadget"
    echo "8) Change gdbplugin"
    echo "9) Exit"
    echo "************************"
    echo "\033[31mwhat's your choise?\033[0m"
    read choise2

    case $choise2 in
        1) download_gef
	;;
	2) download_peda
	;;
	3) download_pwndbg
	;; 
	4) download_LibcSearcher
	;;
	5) download_pwntools
	;;
        6) download_ROPgadget
        ;;
        7) download_ROPgadget
        ;;
        8) change_gdbplugins
        ;;
        9) echo "byebye~"
           break
        ;;
	esac
done

echo "Have a good pwntime~"

#!/bin/sh
# _auther_ : ggb0n
# _myblog_ : http://ggb0n.cool
# _data_   : 2020/11/01
# _version : 0.1

# change to home
pwd=`pwd`
echo "your path: $pwd"
cd ~

download_zsh(){
    echo "\033[32m[+] Downloading zsh...\033[0m"
    apt-get install zsh
    rm .zshrc
    echo "\033[32m[+] Download finish.\033[0m"
}

download_omz(){
    echo "\033[32m[+] Downloading Oh_My_Zsh...\033[0m"
    wget https://github.com/ggb0n/ohmyzsh/tree/master/tools/install.sh -O - | sh
    echo "\033[32m[+] Download Finish.\033[0m"
}

download_pline(){
    echo "\033[32m[+] Downloading powerline...\033[0m"
    git clone http://github.com/powerline/fonts
    cd fonts
    ./install.sh
    cd ..
    echo "\033[32m[+] Download finish.\033[0m"
}

download_highlight_plugin(){
    echo "\033[32m[+] Downloading zsh-syntax-highlighting...\033[0m"
    cd ~/.oh-my-zsh/plugins
    git clone https://github.com/zsh-users/zsh-syntax-highlighting
    cd ~
    echo "\033[32m[+] Download finish.\033[0m"
}

change_terminal(){
    echo "\033[32m[+] Changing terminal...\033[0m"
    chsh -s `which zsh`
    echo "\033[32m[+] Change Finish.\033[0m"
}

copy_file(){
    echo "\033[32m[+] Copying myagnoster-theme...\033[0m"
    cp $pwd/bakfile/myagnoster.zsh-theme ~/.oh-my-zsh/themes/
    echo "\033[32m[+] Copying .zshrc...\033[0m"
    cp $pwd/bakfile/.zshrc ~
    echo "\033[32m[+] Finish.\033[0m"
}

while :
do
    # menu
    echo "\n*********menu*********"
    echo "1) Download zsh"
    echo "2) Download Oh_My_Zsh"
    echo "3) Download powerline"
    echo "4) Download highlight-plugin"
    echo "5) Change terminal"
    echo "6) Change theme"
    echo "7) Exit"
    echo "**********************"
    echo "what's your choise?"
    read choise

    case $choise in
        1) download_zsh
	;;
	2) download_omz
	;;
	3) download_pline
	;;
        4) download_highlight_plugin
        ;;
	5) change_terminal
	;;
	6) copy_file
	;;
        7) echo "byebye~"
           break
        ;;
	esac
done

echo "Now, basic work is done, then you should change terminal font by your hand."

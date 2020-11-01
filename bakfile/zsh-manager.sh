#!/bin/sh

function download_zsh(){
    echo "Downloading zsh..."
    apt-get install zsh
    rm .zshrc
    echo "Download finish."
}

function download_omz(){
    echo "Downloading Oh_My_Zsh..."
    wget https://github.com/ggb0n/ohmyzsh/tree/master/tools/install.sh -O - | sh
    echo "Download Finish."
}

function download_pline(){
    echo "Downloading powerline..."
    git clone http://github.com/powerline/fonts
    ./fonts-master/install.sh
    echo "Download finish."
}

function change_terminal(){
    echo "Changing terminal..."
    chsh -s `which zsh`
    echo "Change Finish."
}

function copy_file(){
    echo "[+] Copying myagnoster-theme..."
    cp ./bakfile/myagnoster.zsh-theme .oh-my-zsh/themes/
    echo "[+] Copying .zshrc..."
    cp ./bakfile/.zshrc ./
    echo " [+] Finish."
}

while:
do
    # menu
    echo "1) Download zsh"
    echo "2) Download Oh_My_Zsh"
    echo "3) Download powerline"
    echo "4) Change terminal"
    echo "5) Change theme"
    echo "6) Exit"
    echo "what's your choise?"
    read choise

    case $choise in
        1) download_zsh
	;;
	2) download_omz
	;;
	3) download_pline
	;; 
	4) change_terminal
	;;
	5) copy_file
	;;
        6) echo "byebye~"
           break
        ;;
	esac
done

echo "Now, basic work is done, then you should change terminal font by your hand."

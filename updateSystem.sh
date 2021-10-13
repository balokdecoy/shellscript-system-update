#!/bin/bash
sudo apt-get update
echo Package list update complete!

function yes_or_no {
	read -p "$* [y/n] " yn
		case $yn in
			[Yy]*) echo 'See you in a sec...'; 
				shutdown -r 0 ;;
			[Nn]*) echo "Goodbye!" ; return 0 ;;
			* ) echo "Please answer yes or no.";
				yes_or_no "Would you like to restart now?" ;;
		esac
}

function upgrade_yn {
	read -p "$* [y/n] " yn
		case $yn in
			[Yy]*) echo 'The system will now install updates...';
				sudo apt-get upgrade ;
				yes_or_no "Would you like to restart now?" ;;
			[Nn]*) echo 'Updated package lists without installing.' ;
				return 0 ;;
			* ) echo 'Please answer yes or no.';
				upgrade_yn "Would you like to install the updates?" ;;
		esac
}

upgrade_yn "Would you like to install the updates?"

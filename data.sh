#!/bin/bash

################################################################
##                                                             #
##  management of dat version                                  #
##                                                             #
################################################################


## Variables ####################################################

DIR="${HOME}"

USER_SCRIPT=${USER}

## Functions ####################################################

help(){

echo "USAGE :

  ${0##*/} [-h] [--help]
  
  Options :

    -h, --help : aides

    -i, --init : 

    -c, --create : creation version

    -u, --use : utilisation of version
   
"
}

parser_options(){

case $@ in	
	-h|--help)
	  help
	;;
  -i|--init)
	  init
	;;
  -c|--create)
	  create
	;;    
  -u|--use)
	  use
	;;        
      
	*)
        echo "option invalide, lancez -h ou --help"
esac
}
##################################################################################################################
init(){
git init
dvc init
git commit -m "Initialize DVC"
git push

}
##################################################################################################################
use(){
git pull origin main   
dvc pull data
}
##################################################################################################################
create(){
dvc add data
git add data.dvc .gitignore
git commit -m "Add raw data ${USER_SCRIPT} "
git push
dvc push

}
## Execute #########################################################################################

parser_options $@
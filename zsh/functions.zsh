extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "я не в курсе как распаковать '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

pk () {
    if [ $1 ] ; then
        case $1 in
            tbz)   	tar cjvf $2.tar.bz2 $2   ;;
            tgz)   	tar czvf $2.tar.gz  $2   ;;
            tar)  	tar cpvf $2.tar  $2      ;;
            bz2)	bzip $2                  ;;
            gz)		gzip -c -9 -n $2 > $2.gz ;;
            zip)   	zip -r $2.zip $2         ;;
            7z)    	7z a $2.7z $2            ;;
            *)     	echo "'$1' cannot be packed via pk()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

calc() {echo "${1}"|bc -l;}

php_site_setup () {
    sudo systemctl start lighttpd
    sudo systemctl start php-fpm
    sudo systemctl start mysqld
    sudo modprobe vboxdrv
}

python_site_setup () {
    sudo systemctl start postgresql
    sudo systemctl start rabbitmq
    sudo modprobe
    cd ~/Work/chronics/
    source .env/bin/activate
    ./manage.py runserver 192.168.56.1:8000
}


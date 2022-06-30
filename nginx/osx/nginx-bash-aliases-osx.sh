
alias nginx_reload="sudo nginx -s reload"
alias nginx_restart="sudo nginx -s stop && sudo nginx"
alias nginx_servers="cd /usr/local/etc/nginx/servers"
alias nginx_list="ll /usr/local/etc/nginx/servers"

function nginx_add() {
    wget https://raw.githubusercontent.com/lukisanjaya/myconfig/master/nginx/osx/nginx-template-osx.conf -O /usr/local/etc/nginx/servers/$1.conf
    sed -i '' "s:{{host}}:$1:" /usr/local/etc/nginx/servers/$1.conf

    if [ "$2" ]; then
        sed  -i '' "s:{{root}}:$2:" /usr/local/etc/nginx/servers/$1.conf
    else
        sed  -i '' "s:{{root}}:$HOME/Sites/$1:" /usr/local/etc/nginx/servers/$1.conf
    fi

    _nginx_addssl $1

    nginx_restart

    echo "\n127.0.0.1 $1" >> /etc/hosts

code /usr/local/etc/nginx/servers/$1.conf
}

function _nginx_addssl() {
    openssl req \
    -x509 -sha256 -nodes -newkey rsa:2048 -days 3650 \
    -subj "/CN=$1" \
    -reqexts SAN \
    -extensions SAN \
    -config <(cat /System/Library/OpenSSL/openssl.cnf; printf "[SAN]\nsubjectAltName=DNS:$1") \
    -keyout /usr/local/etc/nginx/ssl/$1.key \
    -out /usr/local/etc/nginx/ssl/$1.crt

    sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain /usr/local/etc/nginx/ssl/$1.crt
}

function _nginx_edit() {
    code /usr/local/etc/nginx/servers/$1
}
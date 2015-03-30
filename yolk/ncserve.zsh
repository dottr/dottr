global_ip () {
    curl -s ip.appspot.com
}

local_ip () {
    ifconfig | grep 'inet addr' | tail -n 1 | awk '{print $2}' | awk -F: '{print $2}'
}

ncserve () {
    echo "Server running!"
    echo "Get data with:"
    bytes=`du -cb "$@" | tail -n1 | awk '{print $1}'`
    echo "[global]"
    echo -e "nc -v -q0 $(global_ip) 1337 | pv -s $bytes | tar -kxv"
    echo "[local]"
    echo -e "nc -v -q0 $(local_ip) 1337 | pv -s $bytes | tar -kxv"
    tar -cvf - "$@" | pv -s $bytes | nc -v -q0 -l 1337
}

encserve () {
    echo "Server running!"
    echo "Get data with:"
    pw=`pwgen -s 20 1`
    bytes=`du -cb "$@" | tail -n1 | awk '{print $1}'`
    echo "[global]"
    echo -e "nc -v -q0 $(global_ip) 1337 | aespipe -e AES256 -p3 -d 3< <(echo $pw) | pv -s $bytes | tar -kxv"
    echo "[local]"
    echo -e "nc -v -q0 $(local_ip) 1337 | aespipe -e AES256 -p3 -d 3< <(echo $pw) | pv -s $bytes | tar -kxv"
    tar -cvf - "$@" | aespipe -e AES256 -p3 3< <(echo $pw) | pv -s $bytes | nc -v -q0 -l 1337
}

ncsend(){
    tar -cvf - "$1" | nc -v -q0 $2 $3
}

ncrecv () {
     nc -v -q0 $1 1337 | tar -kxv
}

nclisten () {
     nc -v -q0 -l 1337 | tar -kxv
}

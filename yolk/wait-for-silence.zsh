# wait for silence (no audio playback)

wait-for-silence() {
    printf "waiting for silence..."
    count=0
    timeout=60
    while :; do
        sound=`cat /proc/asound/card*/pcm*/sub*/status | grep 'state: RUNNING'`
        if [ -z "$sound" ]; then
            if [ $count -eq 0 ]; then
                echo "done."
                echo -n "waiting for timeout...00/$timeout"
            fi

            count=$(($count + 1))
            echo -ne "\b\b\b\b\b$(echo $count | sed s/^[0-9]$/0\&/)/$timeout"
        else
            if [ $count -ne 0 ]; then
                echo -ne "\b\b\b\b\bsound detected.\n"
                echo -n "waiting for silence..."
            fi

            count=0
        fi

        if [ $count -eq $timeout ]; then
            echo -e "\b\b\b\b\bdone."
            break
        fi

        sleep 1
    done
}

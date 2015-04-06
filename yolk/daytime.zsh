# detect if its light or dark outside.
# depends on the software "sunwait".
# needs the coordinates as parameters.
# example: daytime 50.77N 6.08W

daytime(){
    sundata=$(sunwait sun $@ -p | head -13 | tail -1)
    sunrise=$(echo $sundata | sed -r 's/.*rises ([0-9]+) .*/\1/')
    sunset=$(echo $sundata | sed -r 's/.*sets ([0-9]+) .*/\1/')
    time=$(date +"%H%M")
    if [ $time -ge $sunrise ] && [ $time -le $sunset ]; then
        return 0 # day
    else
        return 1 # night
    fi
}

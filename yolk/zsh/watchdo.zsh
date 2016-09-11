# run command when files change
#
# dependencies: inotify-tools
# Usage:
#   watchdo COMMAND FILEPATTERN [FILEPATTERN]*
# Examples:
#   watchdo make *.cpp *.h
#   watchdo "make clean" *.cpp *.h

function watchdo {
    self=$0

    function usage {
        echo "Usage: `basename $self` COMMAND FILEPATTERN [FILEPATTERN] ..."
    }

    function match {
        s=$1
        shift
        matchcount=0
        for arg in $@; do
            if test $s == $arg; then
                let matchcount+=1
            fi
        done

        test $matchcount -ge 1
    }

    [[ $# -le 1 ]] && usage && return

    command="$1"
    shift
    filepattern="$@"

    eval $command

    echo "Watching for changes..."
    inotifywait -rmqe close_write . | while read dir event file; do
        filepath=$dir$file
        echo "changed: $filepath"
        if match $filepath "$@" || match $file "$@"; then
            eval $command
        fi
    done
}

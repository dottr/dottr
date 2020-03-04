
function cross-platform-readlink-f() {
	# https://stackoverflow.com/a/1116890
	TARGET_FILE=$1

	cd `dirname $TARGET_FILE`
	TARGET_FILE=`basename $TARGET_FILE`

	# Iterate down a (possible) chain of symlinks
	while [ -L "$TARGET_FILE" ]
	do
	    TARGET_FILE=`readlink $TARGET_FILE`
	    cd `dirname $TARGET_FILE`
	    TARGET_FILE=`basename $TARGET_FILE`
	done

	# Compute the canonicalized name by finding the physical path 
	# for the directory we're in and appending the target file.
	PHYS_DIR=`pwd -P`
	RESULT=$PHYS_DIR/$TARGET_FILE
	echo $RESULT
}

export DOTTRHOME=$(dirname "$(cross-platform-readlink-f "$0")")

fry () {
    yolk_file=$DOTTRHOME/yolk/zsh/"$@".zsh
    if [ -f "$yolk_file" ]; then
        source $yolk_file
    else
        echo "No yolk with name '$@' exists." >&2
        echo "Check: fry list-yolks" >&2
        return 1
    fi
}

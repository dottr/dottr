# Arch Linux
# Identify files not owned by any package
# https://wiki.archlinux.org/index.php/Pacman_tips#Identify_files_not_owned_by_any_package

pacman-disowned() {
    tmp=${TMPDIR-/tmp}/pacman-disowned-$UID-$$
    db=$tmp/db
    fs=$tmp/fs

    mkdir "$tmp"
    trap 'rm -rf "$tmp"' EXIT

    pacman -Qlq | sort -u > "$db"

    find /etc /opt /usr ! -name lost+found \( -type d -printf '%p/\n' -o -print \) | sort > "$fs"

    comm -23 "$fs" "$db"
}


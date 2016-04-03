# transcode video to Vorbis/H264

# dependency: ffmpeg with H264
# TODO: use free codec if H264 is not available

transcode-video() {
    # high audio quality: Vorbis(6)
    # default video quality: H264(23)
    ffmpeg -i "$1" -acodec libvorbis -aq 6 -vcodec libx264 -crf 23 -preset slow "$1.mkv"
}

transcode-video-gif() {
    ffmpeg -i "$1" -filter:v palettegen "${1}_palette.png"
    ffmpeg -i "$1" -i "${1}_palette.png" -filter_complex "paletteuse" "$1.gif"
    rm "${1}_palette.png"
}

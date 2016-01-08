# transcode video to Vorbis/H264

# dependency: ffmpeg with H264
# TODO: use free codec if H264 is not available

transcode-video() {
    # high audio quality: Vorbis(6)
    # default video quality: H264(23)
    ffmpeg -i "$1" -acodec libvorbis -aq 6 -vcodec libx264 -crf 23 -preset slow "$1.mkv"
}

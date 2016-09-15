# record and encode screen and microphone to Vorbis/H264

# dependency: ffmpeg with H264, alsa or pulseaudio-alsa, xdpyinfo
# TODO: use free codec if H264 is not available

screencapture() {
    # Audio: Mono, Vorbis(5)
    # Video: Display :0.0, Sreen Resolution, 25fps, H264, default quality:23
    ffmpeg -y -f alsa -ac 1 -i pulse -f x11grab -s `xdpyinfo | grep 'dimensions:'|awk '{print $2}'` -i $DISPLAY -acodec libvorbis -aq 5 -vcodec libx264 -crf 23 -preset superfast -r 25 capture-$(date +"%Y-%m-%d-%H-%M-%S").mkv
}

screencaptureHQ() {
    # Audio: Mono, Vorbis(5)
    # Video: Display :0.0, Sreen Resolution, 25fps, H264, default quality:18
    ffmpeg -y -f alsa -ac 1 -i pulse -f x11grab -s `xdpyinfo | grep 'dimensions:'|awk '{print $2}'` -i $DISPLAY -acodec libvorbis -aq 5 -vcodec libx264 -crf 18 -preset superfast -r 30 capture-$(date +"%Y-%m-%d-%H-%M-%S").mkv
}

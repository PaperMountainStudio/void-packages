hook() {
    ! [ -d "$DESTDIR"/usr/share/appdata ] && return
    cd "$DESTDIR"/usr/share/appdata
    for f in *; do
        msg_warn "moving $f to /usr/share/metainfo/\n"
    done
    mkdir -p "$DESTDIR"/usr/share/metainfo/
    mv "$DESTDIR"/usr/share/appdata/* "$DESTDIR"/usr/share/metainfo/
}

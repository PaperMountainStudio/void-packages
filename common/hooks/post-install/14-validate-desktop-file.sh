hook() {
    ! [ -d "$DESTDIR"/usr/share/applications ] && return
    was_installed=
    xbps-query desktop-file-utils > /dev/null 2>&1 && was_installed=yes
    if [ -z "$was_installed" ]; then
        xbps-install -y desktop-file-utils > /dev/null 2>&1
    fi
    errors=$(desktop-file-validate "$DESTDIR"/usr/share/applications/*.desktop)
    [ -n "$errors" ] && msg_warn "$errors\n"
    if [ -z "$was_installed" ]; then
        xbps-remove -y desktop-file-utils > /dev/null 2>&1
    fi
}

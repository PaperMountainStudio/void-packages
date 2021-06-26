hook() {
    ! [ "$DESTDIR"/usr/share/metainfo ] && return
    was_installed=
    xbps-query AppStream > /dev/null 2>&1 && was_installed=yes
    if [ -z "$was_installed" ]; then
        xbps-install -y AppStream > /dev/null 2>&1
    fi
    errors=$(appstreamcli validate "$DESTDIR"/usr/share/metainfo/* || true)
    [ -n "$errors" ] && msg_warn "$errors\n"
    if [ -z "$was_installed" ]; then
        xbps-remove -y AppStream > /dev/null 2>&1
    fi
}

#!/bin/bash

arch=`uname -m`
hname=`logname`
neko_dir="/home/${hname}/.neko"
systemd_dir="/etc/systemd/system"

core_ver="dc2108c1"
url_core="https://github.com/nosignals/neko/releases/download/core"
url_geo="https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest"

die() {
    echo "[ `date +%T` ] ${1}"
    exit 1
}

check_depedencies() {
    php_bin=`command -v php`
    log "Checking PHP Binary..."
    if [[ -n ${php_bin} ]]; then
        log "- Detected : ${php_bin}"
        log "- Skipping..."
    else
        log "- Installing PHP"
        apt -y install php php-cli
        log "Done..."
    fi
}

move_files() {
    current_dir=`pwd`
    log "Copying Neko Files..."
    if [ -d ${neko_dir} ]; then
        log "- Old Neko Files detected, removing"
        rm -rf ${neko_dir}
    else 
        log "- Creating Neko Directory"
    fi
    mkdir ${neko_dir}
    mkdir ${neko_dir}/www
    cp -rf ${current_dir}/core ${neko_dir}
    cp -rf ${current_dir}/nekoclash ${neko_dir}/www/nekoclash
    cp -rf ${current_dir}/tmp ${neko_dir}
    cp -rf ${current_dir}/ui ${neko_dir}
    cp -rf ${current_dir}/config ${neko_dir}
    cp -rf ${current_dir}/proxy_provider ${neko_dir}
    cp -rf ${current_dir}/rule_provider ${neko_dir}
    #cp -rf ${current_dir}/neko.service ${systemd_dir}
}

download_core_files() {
    log "Downloading Core Files..."
    case "$arch" in
    aarch64)
	    arch="arm64"
	    ;;
    arm)
	    arch="armv7"
	    ;;
    x86_64)
	    arch="amd64"
	    ;;
    *)
    	log "- NEKO not supported!"
	    arch="0"
	    ;;
    esac

    if [ $arch == "0" ] ; then
    	log "- ERROR!!! Arch not supported"
    else
	    log "- Downloading Mihomo Binary - $arch"
    	wget -q -O ${neko_dir}/core/mihomo.gz ${url_core}/mihomo-linux-${arch}-${core_ver}.gz
	    gzip -d ${neko_dir}/core/mihomo.gz

    	log "- Downloading GeoIP Files"
	    wget -q -O ${neko_dir}/geoip.metadb ${url_geo}/geoip.metadb

    	log "- Downloading GeoSite Files"
	    wget -q -O ${neko_dir}/geosite.db ${url_geo}/geosite.db
    fi
}

setperms() {
    #chown root:root ${systemd_dir}/neko.service
    #chmod 0644 ${systemd_dir}/neko.service
	chmod 0775 ${neko_dir}/core/*
}

install() {
    check_depedencies
    move_files
    download_core_files
    setperms
}

log() {
    echo "[ `date +%T` ] ${1}"
}

#[ `id -u` = 0 ] || die "ERR : Please run this script as root"

install
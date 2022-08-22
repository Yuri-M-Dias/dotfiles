#!/bin/bash
# Updated to work with Ubuntu 20.04

set -e
sudo -v

export DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Executing on $DOTFILES"

source "./scripts/common-script-functions.sh"

echo 'Installing dependencies'
sudo apt-get update -y
#TODO: separate the libs/tools/programming languages here

sudo apt install \
    python2.7-dev python3-dev zsh silversearcher-ag \
    libevent-dev markdown vim vim-nox \
    gcc gfortran g++ curl fish wget \
    autotools-dev automake ncurses-dev \
    clang cmake clang-format exuberant-ctags \
    python-setuptools python3-setuptools neovim \
    uncrustify expect tmux \
    scrcpy \
    iperf \
    ibus-anthy \
    ibus-mozc \
    fcitx-mozc \
    cpuid \
    screenfetch \
    libfreetype6:i386 \
    libfreetype6 \
    handbrake \
    youtube-dl \
    jq \
    google-chrome-stable \
    megatools \
    protobuf-compiler \
    colordiff \
    bless \
    ghex \
    xclip \
    libbluetooth-dev \
    solaar \
    freeglut3-dev \
    piper \
    gnome-clocks \
    wxhexeditor \
    hexedit \
    okular \
    rxp \
    dos2unix \
    ttfautohint \
    kazam \
    memtester \
    sysstat \
    pgloader \
    pgadmin3 \
    flameshot \
    libgit2-dev \
    postgresql-client-common \
    libvulkan1 \
    vulkan-utils \
    mesa-vulkan-drivers \
    mesa-vulkan-drivers:i386 \
    meson \
    libsystemd-dev \
    pkg-config \
    ninja-build \
    libdbus-1-dev \
    libinih-dev \
    expect \
    kdenlive \
    openshot \
    nmap \
    fritzing \
    fritzing-data \
    fritzing-parts \
    valgrind \
    atop \
    optipng \
    linux-cloud-tools-generic \
    linux-tools-generic \
    texlive-fonts-recommended \
    streamlink \
    fortune-mod \
    net-tools \
    inotify-tools \
    whois \
    libvulkan1 \
    libudunits2-dev \
    smartmontools \
    peek \
    socat \
    libcurl4 \
    pinta \
    tree \
    unrar \
    uim-mozc \
    latexdiff \
    openvpn \
    cmake \
    editorconfig \
    speedtest-cli \
    util-linux \
    procps \
    hostapd \
    iproute2 \
    iw \
    wireless-tools \
    haveged \
    iptables \
    dnsmasq \
    timeshift \
    libpq-dev \
    xdotool \
    gnome-screensaver \
    ntfs-3g ntfs-3g-dev \
    gparted \
    fonts-takao fonts-dejima-mincho fonts-horai-umefont \
    mpv \
    deluged \
    nethogs \
    apt-transport-https \
    ca-certificates \
    software-properties-common \
    bumblebee \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    llvm \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev \
    liblzma-dev \
    mesa-utils \
    bluez \
    python3-bluez \
    -y --verbose-versions

echo "###############################################"
echo 'Install tmux plugin manager'
gitCloneIfNecessary https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm

echo 'Installing fonts'
gitCloneIfNecessary https://github.com/powerline/fonts.git fonts
cd fonts
./install.sh
cd -

source "$DOTFILES/scripts/install-fonts.sh"

source "$DOTFILES/symlinks.sh"

echo 'Cleaning up...'
rm -Rf fonts/

echo 'Installing vim plugins'
nvim +PlugInstall +q +q

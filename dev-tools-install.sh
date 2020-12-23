#!/bin/bash

# ensure we are running as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# get latest updates
sudo apt-get -y update

# install essential build tools (default versions)
sudo apt-get -y install build-essential

# install clang compiler and tools
sudo apt-get -y install clang
sudo apt-get -y install clang-format
sudo apt-get -y install clang-tidy
sudo apt-get -y install clang-tools

# install LMOD (and its prerequisits)
# prerequisits
sudo apt-get -y install lua5.3
sudo apt-get -y install liblua5.3-dev
sudo apt-get -y install lua-posix-dev
sudo apt-get -y install lua-term-dev
sudo apt-get -y install lua-lpeg-dev
sudo apt-get -y install lua-bitop-dev
sudo apt-get -y install lua-json

sudo apt-get -y install tcl-dev

# LMOD
CURRENT_DIR=$(pwd)
mkdir $HOME/.local/lmod/
wget https://sourceforge.net/projects/lmod/files/Lmod-8.4.tar.bz2 -P $HOME/.local/lmod/
cd $HOME/.local/lmod/
tar -xf Lmod-8.4.tar.bz2
cd Lmod-8.4/
./configure --prefix=/opt/apps CFLAGS="-I /usr/include/lua5.3/"
make install
ln -s /opt/apps/lmod/lmod/init/profile /etc/profile.d/z00_lmod.sh
source /etc/profile.d/z00_lmod.sh
cd CURRENT_DIR

# install easy build
EASYBUILD_PREFIX=$HOME/.local/easybuild
wget https://raw.githubusercontent.com/easybuilders/easybuild-framework/develop/easybuild/scripts/bootstrap_eb.py -P $EASYBUILD_PREFIX
python3 $EASYBUILD_PREFIX/bootstrap_eb.py $EASYBUILD_PREFIX
module use $EASYBUILD_PREFIX/modules/all
module load EasyBuild

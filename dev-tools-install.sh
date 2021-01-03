#!/bin/bash

# exit when any command fails
set -e

# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG

# echo an error message before exiting
trap 'echo "\"${last_command}\" command did exit with code $?."' EXIT

# get latest updates
sudo apt -y update

# install essential build tools (default versions)
sudo apt -y install build-essential
sudo apt -y install libssl-dev
sudo apt -y install libibverbs-dev
sudo apt -y install cmake
sudo apt -y install python3-dev

# install development tools
sudo apt -y install tig
sudo apt -y install gcovr

# install clang compiler and tools
sudo apt -y install clang
sudo apt -y install clang-format
sudo apt -y install clang-tidy
sudo apt -y install clang-tools

# LMOD prerequisits
sudo apt -y install lua5.3
sudo apt -y install liblua5.3-dev
sudo apt -y install lua-posix-dev
sudo apt -y install lua-term-dev
sudo apt -y install lua-lpeg-dev
sudo apt -y install lua-bitop-dev
sudo apt -y install lua-json

sudo apt -y install tcl-dev

# LMOD
CURRENT_DIR=$(pwd)
mkdir -p $HOME/.local/lmod/
wget https://sourceforge.net/projects/lmod/files/Lmod-8.4.tar.bz2 -P $HOME/.local/lmod/
cd $HOME/.local/lmod/
tar -xf Lmod-8.4.tar.bz2
cd Lmod-8.4/
./configure --prefix=/opt/apps CFLAGS="-I /usr/include/lua5.3/"
sudo make install
sudo ln -s /opt/apps/lmod/lmod/init/profile /etc/profile.d/z00_lmod.sh
source /etc/profile
cd $CURRENT_DIR

# install easy build
EASYBUILD_PREFIX=$HOME/.local/easybuild
wget https://raw.githubusercontent.com/easybuilders/easybuild-framework/develop/easybuild/scripts/bootstrap_eb.py -P $EASYBUILD_PREFIX
python3 $EASYBUILD_PREFIX/bootstrap_eb.py $EASYBUILD_PREFIX
rm -rf z01_user_commands.sh
touch z01_user_commands.sh
echo "#!/bin/bash" >> z01_user_commands.sh
echo >> z01_user_commands.sh
echo "### user defined commands to execute on shell startup" >> z01_user_commands.sh
echo module use $EASYBUILD_PREFIX/modules/all >> z01_user_commands.sh
sudo mv z01_user_commands.sh /etc/profile.d/.
source /etc/profile
echo "Sanity check, the line below should print easy build's version"
module load EasyBuild
eb --version

# install GCC-based toolchains
eb --trace --robot gompi-2020b.eb
eb --trace --robot foss-2020b.eb

# build systems
eb --trace --robot Meson-0.55.3-GCCcore-10.2.0.eb

# developer libraries and tools
eb --trace --robot --try-software-version=3.3.9 Eigen-3.3.8-GCCcore-10.2.0.eb
eb --trace --robot --try-toolchain-version=2020b easyconfig/HDF5-1.12.0-gompi-2020a.eb
eb --trace easyconfig/CGNS-4.1.0-gompi-2020b.eb
eb --trace easyconfig/googletest-1.10.0-GCCcore-10.2.0.eb
eb --trace JsonCpp-1.9.4-GCCcore-10.2.0.eb

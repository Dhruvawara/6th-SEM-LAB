# 6th-SEM-LAB
LAB programs BOI f

install one by one:

sudo apt-get install gcc curl unzip tar g++ freeglut3-dev flex bison git default- jre pythonpy
sudo apt-get install libxi-dev libgl1-mesa-dev libglu1-mesa-dev mesa-common-dev libxrandr-dev libxxf86vm-dev
dpkg -L freeglut3-dev
sudo apt update
git config --global user.name "-"
git config --global user.email "-@gmail.com"
git clone https://github.com/Microsoft/vcpkg.git
cd vcpkg
export CC=/usr/bin/gcc
export CXX=/usr/bin/g++
./bootstrap-vcpkg.sh
./vcpkg integrate install
./vcpkg install freeglut

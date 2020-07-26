# 6th-SEM-LAB
LAB programs BOI f

install one by one:

sudo apt install gcc curl unzip tar g++ freeglut3-dev flex bison git
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

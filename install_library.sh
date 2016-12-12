#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Installing Casablanca"
sudo apt-get install -y libxml++2.6-dev libxml++2.6-doc uuid-dev g++ git make libboost-all-dev libssl-dev
mkdir -p src
cd ~/src
git clone https://github.com/Microsoft/cpprestsdk.git casablanca
cd casablanca/Release
mkdir build.release
cd build.release
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER=g++-4.8
make
sudo make install
sudo ldconfig

echo "Creating the CMake Find file"
cd ~/src
wget https://raw.githubusercontent.com/Azure/azure-storage-cpp/master/Microsoft.WindowsAzure.Storage/cmake/Modules/LibFindMacros.cmake
sudo mv LibFindMacros.cmake /usr/local/share/cmake-3.2/Modules
sudo wget https://raw.githubusercontent.com/Azure/azure-storage-cpp/master/Microsoft.WindowsAzure.Storage/cmake/Modules/FindCasablanca.cmake
sudo mv FindCasablanca.cmake /usr/local/share/cmake-3.2/Modules
wget https://raw.githubusercontent.com/Tokutek/mongo/master/cmake/FindSSL.cmake
sudo mv FindSSL.cmake /usr/local/share/cmake-3.2/Modules

echo "Install Azure Storage CPP"
cd ~/src
git clone https://github.com/Azure/azure-storage-cpp.git
cd azure-storage-cpp/Microsoft.WindowsAzure.Storage
mkdir build.release
cd build.release
CASABLANCA_DIR=/usr/local/ CXX=g++-4.8 cmake .. -DCMAKE_BUILD_TYPE=Release
make
#Install library
sudo cp ~/src/azure-storage-cpp/Microsoft.WindowsAzure.Storage/build.release/Binaries/* /usr/local/lib
sudo rm /usr/local/lib/libazurestorage.so 
sudo rm /usr/local/lib/libazurestorage.so.2
sudo ln -s /usr/local/lib/libazurestorage.so.2.4 /usr/local/lib/libazurestorage.so
sudo cp -r ~/src/azure-storage-cpp/Microsoft.WindowsAzure.Storage/includes/* /usr/local/include

sudo ldconfig

#Create the CMake Find File
cd ${DIR}
sudo cp FindAzureStorageCpp.cmake /usr/local/share/cmake-3.2/Modules

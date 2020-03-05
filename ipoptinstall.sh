#!/bin/bash
# Shell script for the installation of Ipopt release 3.12.12
# R. Guicherd - 25/02/2020

# This shell script requires `curl`, `tar`

# Initial display
echo "============================================================="
echo "Start of the installation of the solver Ipopt release 3.12.12"
echo "The installation is done in the home directory"
echo "============================================================="

# Change directory into home folder
cd $HOME

# Curl Ipopt-3.12.12.tgz
curl -O -L https://www.coin-or.org/download/source/Ipopt/Ipopt-3.12.12.tgz
echo "============================"
echo "Ipopt-3.12.12.tgz downloaded"
echo "============================"

# Tar the Ipopt archive
tar -xvf ~/Ipopt-3.12.12.tgz

# Make installation directory
mkdir ~/Ipopt-3.12.12/opt

# Installation of mumps and configuration
cd ~/Ipopt-3.12.12/ThirdParty/Mumps
./get.mumps
export ADD_CFLAGS="-fPIC -fno-common -mmacosx-version-min=10.9"
export ADD_CXXFLAGS="-fPIC -fno-common -mmacosx-version-min=10.9"
export ADD_FFLAGS="-fPIC -fno-common -mmacosx-version-min=10.9"
./configure --prefix=$HOME/Ipopt-3.12.12/opt --enable-static --disable-shared --without-metis
make
make install

# Installation of Ipopt and configuration
cd ~/Ipopt-3.12.12
./configure --prefix=$HOME/Ipopt-3.12.12/opt --enable-static --disable-shared --without-metis
make
make install
make test

# Store make test exit value
code=$?

# Move to trash downloaded Ipopt archive
mv -v ~/Ipopt-3.12.12.tgz ~/.Trash
echo "Ipopt archive moved to trash!"

# Test for installation success
if test "$code" -eq 0; then
	echo "========================================"
	echo "Successful installation of Ipopt-3.12.12"
	echo "========================================"
	exit 0
else
	echo "============================="
	echo "!!!! Installation issues !!!!"
	echo "============================="
	exit 1
fi

#### End of ipoptinstall shell script ###
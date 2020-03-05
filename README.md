# Ipopt Installation Shell Script

The shell script `ipoptinstall.sh` contained in this directory performs the installation of Ipopt release 3.12.12 for macOs within the home directory. The installation is performed using `Mumps` as a linear solver. The installation steps are as follows:

* Download Ipopt-3.12.12 from coin-or
* Extract files from the downloaded archive
* Create installation directory `Ipopt-3.12.12/opt`
* Download, configure and compile Mumps
* Configure, compile and test Ipopt 3.12.12
* Move the Ipopt archive to the trash

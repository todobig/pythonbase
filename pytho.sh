#!/bin/bash

# Update system
echo "Updating system..."
apt update -y

# Upgrade packages
echo "Upgrading packages..."
apt upgrade -y

# Install required packages
echo "Installing required packages..."
apt install -y wget build-essential libreadline-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev

# Download Python 3.9.6 source archive
echo "Downloading Python 3.9.6 source archive..."
wget https://www.python.org/ftp/python/3.9.6/Python-3.9.6.tgz 

# Extract downloaded file
echo "Extracting downloaded file..."
tar xzf Python-3.9.6.tgz 

# Change to the extracted directory
cd Python-3.9.6 

# Run configuration command
echo "Configuring Python installation..."
./configure --enable-optimizations 

# Compile and install Python
echo "Compiling and installing Python..."
make altinstall 

# symlink  for pip3.9 to pip
sudo update-alternatives --install /usr/bin/pip pip /usr/local/bin/pip3.9 1

# symlink  for python3 to python
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.9 1


# Check Python version
python_version=$(python3 --version 2>&1)
echo "Python version installed: $python_version"

# Check pip version
pip_version=$(pip3.9 -V 2>&1)
echo "Pip version installed: $pip_version"

echo "Python 3.9.6 installation completed."

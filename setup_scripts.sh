# setup scripts

# home Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/$USER/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

#!/bin/bash

# Update package lists
sudo apt-get update

# Install dependencies
sudo apt-get install -y libpcap-dev build-essential

# Download and install masscan
MASSCAN_VERSION="1.0.6"  # Update this to the latest version if needed
wget https://github.com/robertdavidgraham/masscan/archive/refs/tags/${MASSCAN_VERSION}.tar.gz
tar -xzf ${MASSCAN_VERSION}.tar.gz
cd masscan-${MASSCAN_VERSION}

# Compile and install masscan
make
sudo make install

# Clean up
cd ..
rm -rf masscan-${MASSCAN_VERSION} ${MASSCAN_VERSION}.tar.gz

echo "Masscan and dependencies have been installed."

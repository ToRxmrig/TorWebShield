#!/bin/bash

# 🛠️ Update package list and upgrade existing packages
echo "Updating package list and upgrading existing packages..."
sudo apt-get update
sudo apt-get upgrade -y

# 📦 Install Apache2, Tor, and development tools
echo "Installing Apache2, Tor, build-essential, gcc, cmake, python3, and python3-pip..."
sudo apt-get install -y apache2 tor build-essential gcc cmake python3 python3-pip

# 🚀 Start Apache2 and Tor services
echo "Starting Apache2 and Tor services..."
sudo service apache2 start
sudo service apache2 enable
sudo service tor start
sudo service tor enable

echo "Should Be Good."
# Print the status of the services
echo "Apache2 and Tor have been installed and started."
sudo systemctl status apache2
sudo systemctl status tor

# 🔧 Set Permissions and Ownership for Apache2

# Apache2 Configuration File
echo "Setting permissions for Apache2 configuration file..."
sudo chown root:root /etc/apache2/apache2.conf
sudo chmod 644 /etc/apache2/apache2.conf

# Apache2 Site Configuration File
echo "Setting permissions for Apache2 site configuration file..."
sudo chown root:root /etc/apache2/sites-available/hiddenservice.conf
sudo chmod 644 /etc/apache2/sites-available/hiddenservice.conf

# Apache Log Directory
echo "Setting permissions for Apache log directory..."
sudo chown -R www-data:www-data /var/log/apache2
sudo chmod -R 755 /var/log/apache2

# 🛡️ Tor Configuration Permissions

# Tor Configuration File
echo "Setting permissions for Tor configuration file..."
sudo chown root:root /etc/tor/torrc
sudo chmod 644 /etc/tor/torrc

# Permissions for Hidden Service Directory
echo "Setting permissions for Tor hidden service directory..."
sudo chown -R debian-tor:debian-tor /var/lib/tor/hidden_service/
sudo chmod 700 /var/lib/tor/hidden_service/

# Permissions for Files Inside Hidden Service Directory
echo "Setting permissions for files inside Tor hidden service directory..."
sudo chown debian-tor:debian-tor /var/lib/tor/hidden_service/hostname
sudo chown debian-tor:debian-tor /var/lib/tor/hidden_service/private_key
sudo chmod 600 /var/lib/tor/hidden_service/hostname
sudo chmod 600 /var/lib/tor/hidden_service/private_key

# 🔐 Security Recommendations

# Configuration Files
echo "Security Note: Configuration files should be readable only by necessary services and writable only by root to prevent unauthorized changes."

# Service Directories
echo "Security Note: Set restrictive permissions on service directories to prevent unauthorized access. Only allow the service user (e.g., www-data for Apache and debian-tor for Tor) to access these directories."

# Apache Configuration Files
echo "Recommendation: Set Apache configuration files to 644 permissions and owned by root."

# Tor Configuration Files
echo "Recommendation: Set Tor configuration files to 644 permissions and owned by root."

# Apache Log Directory
echo "Recommendation: Set Apache log directory permissions to 755 and owned by www-data."

# Tor Hidden Service Directory
echo "Recommendation: Set Tor hidden service directory permissions to 700 and owned by debian-tor."

echo "Configuration and permissions have been set. If you have any more questions or need further assistance, feel free to ask!"

#!/bin/bash

# Change default shell to bash
mv /bin/sh /bin/sh.orig
ln -s /bin/bash /bin/sh

# Add the noob user
useradd noob -m 
passwd -d noob

# Make the box vulnerable
chmod 777 /etc/passwd
ls -la /etc/passwd

# Switch to 'noob' user and perform operations
sudo -u noob bash << EOF

# Clone the repository
cd ~
git clone https://github.com/FloDevAT/Kaindorf-Cafeteria.git
cd Kaindorf-Cafeteria

# Create and activate a virtual environment
python3 -m venv venv
source ./venv/bin/activate

# Install required dependencies
pip install -r requirements.txt

# Run the Flask app 
python3 ./src/app.py 

EOF

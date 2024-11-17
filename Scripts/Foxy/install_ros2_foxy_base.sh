#!/bin/bash

# Script to install ROS 2 Foxy

# Configure locale
sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

# Configure ROS 2 repository
sudo apt install -y software-properties-common
yes | sudo add-apt-repository universe

# Add ROS 2 GPG key
sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

# Add ROS 2 repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

# Install development tools (optional. Comment this line to skip installation)
sudo apt update && sudo apt install -y ros-dev-tools

# Update packages and install ROS 2 Foxy
sudo apt update
sudo apt upgrade
sudo apt install -y ros-foxy-ros-base python3-argcomplete

# Configure environment
source /opt/ros/foxy/setup.bash

# Add to bashrc to load automatically
echo "source /opt/ros/foxy/setup.bash" >> ~/.bashrc

# Install colcon
sudo apt install python3-colcon-common-extensions

# Add to bashrc to load automatically
echo "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash" >> ~/.bashrc

echo "Installation completed. Open a new terminal or run 'source ~/.bashrc' to load the environment variables."
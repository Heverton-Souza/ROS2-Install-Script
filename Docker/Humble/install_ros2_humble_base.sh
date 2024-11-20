#!/bin/bash

# Script to install ROS 2 Humble

# Configure locale
apt update && apt install locales
locale-gen en_US en_US.UTF-8
update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

# Configure ROS 2 repository
apt install -y software-properties-common
yes | add-apt-repository universe

# Add ROS 2 GPG key
apt update && apt install curl -y
curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

# Add ROS 2 repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

# Install development tools (optional. Comment this line to skip installation)
apt update && apt install -y ros-dev-tools

# Update packages and install ROS 2 Humble
apt update
apt upgrade
apt install -y ros-humble-ros-base

# Configure environment
source /opt/ros/humble/setup.bash

# Add to bashrc to load automatically
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

# Install colcon
apt install -y python3-colcon-common-extensions

# Add to bashrc to load automatically
echo "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash" >> ~/.bashrc

echo "Installation completed. Open a new terminal or run 'source ~/.bashrc' to load the environment variables."
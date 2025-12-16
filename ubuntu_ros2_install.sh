#!/bin/bash
#set -e
echo "Starting ROS 2 Humble installation..."

# Update and upgrade
sudo apt update && sudo apt upgrade -y

# Setup locales
sudo apt install locales -y
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

# Setup sources
sudo apt install software-properties-common curl -y
sudo add-apt-repository universe -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key \
  -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] \
http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | \
sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

# Install ROS 2 Humble + packages
sudo apt update
sudo apt install -y \
    ros-humble-desktop \
    ros-humble-xacro \
    ros-humble-gazebo-ros-pkgs \
    ros-humble-gazebo-ros2-control \
    ros-humble-navigation2 \
    ros-humble-nav2-bringup \
    ros-humble-joy \
    ros-humble-slam-toolbox \
    ros-humble-twist-mux \
    ros-humble-ros2-control ros-humble-ros2-controllers \
    ros-humble-rviz2 \
    python3-colcon-common-extensions \
    ros-dev-tools
mkdir -p ~/dev_ws/src
cd dev_ws
cd src
git clone https://github.com/sooraj113/my_bot.git


if ! grep -q "source /opt/ros/humble/setup.bash" ~/.bashrc; then
  echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
fi

echo "ROS 2 Humble installation complete!"
echo "Run 'source ~/.bashrc' or restart the terminal to start using ROS 2."

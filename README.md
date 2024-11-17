# ROS 2 Installation Scripts  
![ROS 2 Logo](https://www.freshconsulting.com/wp-content/uploads/fly-images/33744/ROS-2_logo-1920x9999.png)

This project contains scripts to install different versions of ROS 2 (Foxy, Humble, Iron and Jazzy) with **base** or **desktop** versions. The scripts are organized into two main folders:

- **Scripts/**: Regular installation scripts for ROS 2.

- **Docker/**: Scripts and Dockerfiles to create containers that automatically install ROS 2 during the build.

## 📂 Project Structure

The project is organized as follows:

``` 
|--- Docker/
|   |--- Foxy/
|   |   |--- Dockerfile
|   |   |--- install_ros2_foxy_base  # base version script
|   |   |--- install_ros2_foxy_desktop  # desktop version script
|   |--- Humble/
|   |   |--- Dockerfile
|   |   |--- install_ros2_humble_base  # base version script
|   |   |--- install_ros2_humble_desktop  # desktop version script
|   |--- Iron/
|   |   |--- Dockerfile
|   |   |--- install_ros2_iron_base  # base version script
|   |   |--- install_ros2_iron_desktop  # desktop version script
|   |--- Jazzy/
|   |   |--- Dockerfile
|   |   |--- install_ros2_jazzy_base  # base version script
|   |   |--- install_ros2_jazzy_desktop  # desktop version script
|--- Scripts/
    |--- Foxy/    
    |   |--- install_ros2_foxy_base  # base version script
    |   |--- install_ros2_foxy_desktop  # desktop version script
    |--- Humble/   
    |   |--- install_ros2_humble_base  # base version script
    |   |--- install_ros2_humble_desktop  # desktop version script
    |--- Iron/
    |   |--- Dockerfile
    |   |--- install_ros2_iron_base  # base version script
    |   |--- install_ros2_iron_desktop  # desktop version script
    |--- Jazzy/
    |   |--- Dockerfile
    |   |--- install_ros2_jazzy_base  # base version script
    |   |--- install_ros2_jazzy_desktop  # desktop version script
```
## 🛠️ How to Use

1. **Installation with Docker** 

    The **Dockerfiles** and **installation scripts** are configured to simplify installing ROS 2 in containers. To build a Docker container, follow these steps

    1. **Choose the version and installation type** (base or desktop). Open the corresponding Dockerfile inside the desired version folder (e.g., Docker/Foxy/Dockerfile).

    2. **Modify the Dockerfile** to choose between base or desktop installation. In the Dockerfile, you will see something like:

        ``` 
        # Copy the script into the container
        COPY install_ros2_iron_desktop.sh /home/install_ros2_iron_desktop.sh 
        ```
        For the base installation, modify it to:

        ``` 
        COPY install_ros2_iron_base.sh /home/install_ros2_iron_base.sh
        ```
    3. **Build the Docker image** with the command:

        ```
        docker build -t ros2-iron .
        ```
    4. **Run the container** with the command:

        ```
        docker run -it ros2-iron
        ```
2. **Installation without Docker (using scripts)**

    Use the scripts that are located in the Scripts/ folder to manually install ROS 2:

    1. **Choose the version and installation type** (base or desktop).

    2. **Give execution permission to the script** (if necessary). You can do this by running the following command:

        ```
        chmod +x ./Scripts/[Version]/install_ros2_[version]_[type].sh
        ```


    3. **Run the desired script:**

        ```
        ./Scripts/[version]/install_ros2_[version]_[type].sh
        ```
3. **How It Works**

    The **Dockerfiles** contain instructions to:

        - Download a base Ubuntu image according to the ROS version requirements.
        - Install the necessary dependencies for ROS 2.
        - Copy the installation script into the container.
        - Make the script executable.
        - Execute the installation script during the Docker image build process.

    This allows you to run the ```docker run``` command and have ROS 2 installed based on the type of script configured in the Dockerfile (base or desktop).

## Contributing 🤝

Feel free to contribute! If you'd like to suggest a modification or add support for other ROS 2 versions, please create a **fork** of this repository, make the necessary changes, and submit a **pull request**.
# Basic image
FROM ros:galactic AS ros
LABEL Author="ycy <JG5BVICTOR@126.com>"

# Create a non-root user
RUN groupadd --gid 1000 ros \
    && useradd -s /bin/bash --uid 1000 --gid 1000 -m ros \
    && usermod -a -G video ros \
    && echo "source /opt/ros/galactic/setup.bash" >> /home/ros/.bashrc

# install Python-opencv
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    python3-pip\ 
    libboost-python\
    && rm -rf /var/lib/apt/lists/*\    
    && pip install opencv-python-headless
  

#git 
RUN cd /opt/ros/galactic/src
RUN git colne https://github.com/ros-perception/vision_opencv.git -b ros2
RUN cd ..
RUN colcon build --symlink-install


# Copy cv_bridge to docker
#COPY ./cv_bridge /opt/ros/galactic/lib/python3.8/site-packages/
#COPY ./cv_bridge /opt/ros/galacticlib/python3.8/site-packages/cv_bridge
#COPY ./cv_bridge/boost /opt/ros/galactic/lib/python3.8/site-packages/cv_bridge/boost
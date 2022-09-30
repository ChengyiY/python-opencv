# Basic image
FROM ros:galactic
LABEL Author="ycy <JG5BVICTOR@126.com>"

# install Python 3.8
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    python3.8 \
    python3-pip \
    libgl1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*\
    && pip install opencv-python

RUN echo "source /opt/ros/galactic/setup.bash" >> /root/.bashrc
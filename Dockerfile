# Basic image
ARG TAG
FROM ros:${TAG} AS ros
LABEL Author="ycy <JG5BVICTOR@126.com>"

# install Python-opencv
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*\
    && pip install opencv-python


# Create a non-root user
RUN groupadd --gid 1000 ros \
    && useradd -s /bin/bash --uid 1000 --gid 1000 -m ros \
    && usermod -a -G video ros \
    && echo "source /opt/ros/${TAG}/setup.bash" >> /home/ros/.bashrc

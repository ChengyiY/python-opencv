# Basic image
FROM ubuntu:20.04
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

# WORKDIR /mvp
# COPY data/ /mvp/data
# COPY src/0.GenerateSimulationData.py /mvp/src/0.GenerateSimulationData.py
 
# CMD ["python3","src/0.GenerateSimulationData.py"]
  
  
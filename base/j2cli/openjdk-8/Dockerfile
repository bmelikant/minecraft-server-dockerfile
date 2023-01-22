FROM openjdk:8

# install wget and python
RUN apt update && \
    DEBIAN_FRONTEND=noninteractive \
    apt -y install wget python3-pip && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install j2cli

# add the Minecraft user mcuser
RUN useradd --create-home --shell /bin/bash mcuser

# set image to use the new user account
USER mcuser

# download the server jar file
RUN mkdir -p /home/mcuser/bin/minecraft && cd /home/mcuser/bin/minecraft
# switch to the correct working directory
WORKDIR /home/mcuser/bin/minecraft

# generate the EULA file
RUN echo "eula=true" > eula.txt
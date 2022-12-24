FROM openjdk:21-bullseye

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
RUN wget -O /home/mcuser/bin/minecraft/server.jar https://piston-data.mojang.com/v1/objects/c9df48efed58511cdd0213c56b9013a7b5c9ac1f/server.jar

COPY --chown=mcuser:mcuser /templates /templates
COPY --chown=mcuser:mcuser /entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# switch to the correct working directory
WORKDIR /home/mcuser/bin/minecraft

# generate the EULA file
RUN echo "eula=true" > eula.txt

# set minecraft entrypoint
CMD exec java ${JAVA_OPTS} -jar /home/mcuser/bin/minecraft/server.jar
ENTRYPOINT [ "/entrypoint.sh" ]
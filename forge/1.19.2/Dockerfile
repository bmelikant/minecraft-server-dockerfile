FROM bmelikant/j2cli-openjdk-21:latest

# get into the minecraft directory
WORKDIR /home/mcuser/bin/minecraft

COPY --chown=mcuser:mcuser /templates /templates
COPY --chown=mcuser:mcuser /entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# get the forge installer
RUN wget -O forge-installer.jar https://maven.minecraftforge.net/net/minecraftforge/forge/1.19.2-43.2.1/forge-1.19.2-43.2.1-installer.jar

# run forge installer
RUN java -jar forge-installer.jar --installServer

# everything else should be set up. Set the startup command, then the entrypoint will take care of the j2 templates
CMD exec /home/mcuser/bin/minecraft/run.sh
ENTRYPOINT [ "/entrypoint.sh" ]
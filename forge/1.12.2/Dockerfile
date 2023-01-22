FROM bmelikant/j2cli-openjdk-8:latest

# get into the minecraft directory
WORKDIR /home/mcuser/bin/minecraft

COPY --chown=mcuser:mcuser /templates /templates
COPY --chown=mcuser:mcuser /entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# get the forge installer
RUN wget -O forge-installer.jar https://maven.minecraftforge.net/net/minecraftforge/forge/1.12.2-14.23.5.2860/forge-1.12.2-14.23.5.2860-installer.jar

# run forge installer
RUN java -jar forge-installer.jar --installServer
RUN rm ./forge-installer.jar
RUN mv forge-*.jar forge.jar

# everything else should be set up. Set the startup command, then the entrypoint will take care of the j2 templates
CMD exec java -jar forge.jar
ENTRYPOINT [ "/entrypoint.sh" ]
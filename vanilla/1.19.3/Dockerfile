FROM bmelikant/j2cli:latest

# get the correct version of minecraft
RUN wget -O /home/mcuser/bin/minecraft/server.jar https://piston-data.mojang.com/v1/objects/c9df48efed58511cdd0213c56b9013a7b5c9ac1f/server.jar

COPY --chown=mcuser:mcuser /templates /templates
COPY --chown=mcuser:mcuser /entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# set minecraft entrypoint
CMD exec java ${JAVA_OPTS} -jar /home/mcuser/bin/minecraft/server.jar
ENTRYPOINT [ "/entrypoint.sh" ]
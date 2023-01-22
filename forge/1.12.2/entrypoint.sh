#!/bin/bash -e

# copy any template files into the minecraft root directory
cp -R /templates/* /home/mcuser/bin/minecraft
for f in $(find /home/mcuser/bin/minecraft/ -type f -name "*.j2"); do
    echo -e "Evaluating template\n\tSource: $f\n\tDest: ${f%.j2}"
    j2 $f > ${f%.j2}
    rm -f $f
done

# execute any other configuration. there shouldn't be any, but just in case
for f in /docker-entrypoint-init.d/*; do
    case "$f" in
        *.sh) echo "Running script $f"; . "$f" ;;
        *) echo "Ignoring file $f" ;;
    esac
    echo
done

# run the minecraft server
cd /home/mcuser/bin/minecraft
exec "$@"
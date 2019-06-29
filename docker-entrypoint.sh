#!/bin/bash
set -e

PK_FILE_NAME="pk-*.key"

if [ ! -f /opt/exagear/lic/$PK_FILE_NAME ]; then
    echo "Mount a primary key file to the /opt/exagear/lic/ directory."
    echo "Primary key files are named ${PK_FILE_NAME/\*/NNNNNN}"
    exit 1
fi

echo "Activating the copy of ExaGear..."
/opt/exagear/bin/actool

exec /usr/bin/exagear -- "$@"

#!/bin/bash
set -e

PK_FILE_NAME="pk-*.key"

if [ ! -f /opt/exagear/lic/$PK_FILE_NAME ]; then
    echo "Mount a primary key file to the /opt/exagear/lic/ directory." >&2
    echo "Primary key files must have the name format pk-<number>.key" >&2
    exit 1
fi

/opt/exagear/bin/actool > /dev/null 

exec /usr/bin/exagear -- "$@"

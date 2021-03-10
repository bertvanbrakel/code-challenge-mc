#!/bin/bash

set -Eeuo pipefail

npm c set global-style true

sudo chown node:node ~/

export PATH="/workspace/bin:$PATH"

sudo bash -c "echo '0.0.0.0 moneycatcha.local' >> /etc/hosts"

for f in './node_modules' 'build' ; do
    sudo chown -R node:node "$f"
done

#!/bin/bash

set -e

mkdir oradata
chmod 777 oradata

mkdir checkpoint
chmod 777 checkpoint

chmod 777 scripts
chmod 644 scripts/OpenLogReplicator.json

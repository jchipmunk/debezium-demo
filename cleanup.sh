#!/bin/bash

set -e

if [[ -d oradata ]]; then
    rm -rf oradata
fi

if [[ -d checkpoint ]]; then
    rm -rf checkpoint
fi

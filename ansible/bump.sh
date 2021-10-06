#!/bin/bash
MAJOR=$(cat ./version | cut -d'.' -f1)
MINOR=$(cat ./version | cut -d'.' -f2)
FIX=$(cat ./version | cut -d'.' -f3)

NEW=${MAJOR}.${MINOR}.$(expr ${FIX} + 1)

echo "${NEW}" > version

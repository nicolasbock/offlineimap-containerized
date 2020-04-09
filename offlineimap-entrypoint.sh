#!/bin/bash

: ${TIMEOUT:=30}

timeout ${TIMEOUT} ionice --class idle offlineimap "$@"

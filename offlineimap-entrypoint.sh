#!/bin/bash

: ${TIMEOUT:=30}

timeout ${TIMEOUT} nice -n 19 ionice --class idle offlineimap "$@"

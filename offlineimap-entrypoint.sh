#!/bin/bash

: ${TIMEOUT:=30}

nice -n 19 \
  ionice --class idle \
  timeout ${TIMEOUT} \
  offlineimap "$@"

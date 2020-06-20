# Use `offlineimap` inside a container

The awesome `offlineimap` tool unfortunately does not support Python 3
as of the time of this writing. As distros are slowly phasing out
Python 2 support, using `offlineimap` is becoming increasingly
challenging. This repository contains a few scripts that use a Docker
container to run `offlineimap`. The container is purposely built based
on an ancient Ubuntu release to make Python 2 support as
straightforward as possible inside the container.

## `Dockerfile`

The `Dockerfile` is pretty simple and uses `pip` to set up the
environment for `offlineimap` to run in.

Currently this is still possible for Python 2 but eventually we might
have to fix certain versions of the Python eggs when `PyPI` stops
supporting Python 2.

## `offlineimap-entrypoint.sh`

The `entrypoint` script simply calls `offlineimap` with reduced IO
priority and a timeout. The timeout can be used if `offlineimap` hangs
regularly or the user wants to preempt its execution, e.g. if a very
large mailbox is synced.

## `offlineimap` script

The script starts the docker container and mounts the `.offlineimaprc`
configuration file, the `.offlineimap` directory, and a
`.offlineimap.py` helper script. The mail archive is mounted as well.

## Running the containerized `offlineimap` tool

Running is as simple as

    $ ./offlineimap [options]

Just as one would run the command if installed locally.

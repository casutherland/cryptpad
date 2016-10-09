#!/bin/bash
set -euo pipefail
# This script is run every time an instance of our app - aka grain - starts up.
# This is the entry point for your application both when a grain is first launched
# and when a grain resumes after being previously shut down.
#
# This script is responsible for launching everything your app needs to run.  The
# thing it should do *last* is:
#
#   * Start a process in the foreground listening on port 8000 for HTTP requests.
#
# This is how you indicate to the platform that your application is up and
# ready to receive requests.  Often, this will be something like nginx serving
# static files and reverse proxying for some other dynamic backend service.
#
# Other things you probably want to do in this script include:
#
#   * Building folder structures in /var.  /var is the only non-tmpfs folder
#     mounted read-write in the sandbox, and when a grain is first launched, it
#     will start out empty.  It will persist between runs of the same grain, but
#     be unique per app instance.  That is, two instances of the same app have
#     separate instances of /var.
#   * Preparing a database and running migrations.  As your package changes
#     over time and you release updates, you will need to deal with migrating
#     data from previous schema versions to new ones, since users should not have
#     to think about such things.
#   * Launching other daemons your app needs (e.g. mysqld, redis-server, etc.)

# Create CryptPad storage path
# TODO: test if this is even necessary, or does CryptPad prefer to use the default './datastore' (which would not preserved with the grain as it isn't beneath the only non-tmpfs /var).
mkdir -p /var/lib/datastore

# TODO: remove as mongodb is no longer used
# Create mongodb wiredTiger storage dbPath
# TODO: Confirm this is the most correct location for this action. Or, does this belongs in a run-once if [ -d ... ] test?
# mkdir -p /var/lib/mongodb.wiredTiger

# TODO: remove as mongodb is no longer used
# Start mongodb
# WIRED_TIGER_CONFIG="log=(prealloc=false,file_max=200KB)"
# mongod -f /etc/mongod.wiredTiger.conf --fork --wiredTigerEngineConfigString $WIRED_TIGER_CONFIG

# Start the server
cd /opt/app
node ./server.js

exit 0

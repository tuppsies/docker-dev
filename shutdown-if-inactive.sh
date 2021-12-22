#!/bin/bash
#
# Source:
# https://github.com/fernandoacorreia/dotfiles/blob/4d0d8cc4df33504352c032978759a6bd730eb957/bin/shutdown-if-inactive
#
# Shuts down the host on inactivity.
#
# Designed to be executed as root from a cron job.
# It will power off on the 2nd consecutive run without an active ssh session.
# That prevents an undesirable shutdown when the machine was just started, or on a brief disconnect.
#
# To enable, add this entry to /etc/crontab:
# */5 *   * * *   root    /home/ubuntu/dotfiles/bin/shutdown-if-inactive
#
set -o nounset -o errexit -o pipefail

MARKER_FILE="/tmp/ssh-inactivity-flag"

STATUS=$(netstat | grep ssh | grep ESTABLISHED &>/dev/null && echo active || echo inactive)

if [ "$STATUS" == "inactive" ]; then
  if [ -f "$MARKER_FILE" ]; then
    echo "Powering off due to ssh inactivity."
    shutdown now
  else
    # Create a marker file so that it will shut down if still inactive on the next time this script runs.
    echo "Creating marker file"
    touch "$MARKER_FILE"
  fi
else
  # Delete marker file if it exists
  echo "Deleting marker file"
  rm --force "$MARKER_FILE"
fi
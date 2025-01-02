#!/usr/bin/env bash

# Function to check if Neovim is still running
is_nvim_running() {
  pgrep -x nvim &> /dev/null
}

# Function to stop daemons
stop_daemons() {
  pkill -f eslint_d
  pkill -f prettierd
}

# Exit if Neovim is still running after waiting for one second
sleep 1
if is_nvim_running; then
  exit 0
fi

# Kill any previous ongoing checks
current_pids=$(pgrep -f "$(basename "$0")")
echo "${current_pids}" | while read -r pid; do
  if [[ ${pid} -ne $$ ]]; then
    kill -TERM "${pid}"
    wait "${pid}"
  fi
done

# Wait for 5 minutes before stopping daemons
sleep 5m
if ! is_nvim_running; then
  stop_daemons
fi

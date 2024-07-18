#!/bin/bash

# Set up logging
LOG_FILE="/var/log/watch_dropbox.log"

# Function to log messages
log_message() {
    echo "$(date): $1" >> "$LOG_FILE"
}

# Ensure the script runs with the correct PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

# Check if fswatch is available
if ! command -v /usr/local/bin/fswatch &> /dev/null; then
    log_message "/usr/local/bin/fswatch could not be found. Please install it."
    exit 1
fi

log_message "Starting watch_dropbox script"

# Main loop
while true; do
    /usr/local/bin/fswatch --event Created /Users/Shared/ScannedDocuments | while read file; do
        if [ -f "$file" ]; then
            chown jonathan:staff "$file"
            log_message "Changed ownership of $file to jonathan:staff"
        else
            log_message "File $file no longer exists, skipping"
        fi
    done
    
    # If fswatch exits, log it and restart the loop
    log_message "fswatch exited, restarting in 5 seconds"
    sleep 5
done

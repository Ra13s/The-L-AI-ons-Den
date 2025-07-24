#!/bin/bash

# Document Review Session Setup Script
# Creates session folders for document review process

# --- Configuration ---

# The directory where the session results will be stored
SESSIONS_DIR="sessions"

# --- Helper Functions ---

# Get the next session number
get_next_session_number() {
  local last_session_num=0
  if [ -d "$SESSIONS_DIR" ]; then
    last_session_num=$(ls -1q "$SESSIONS_DIR" | grep -E '^[0-9]+$' | sort -n | tail -n 1)
    if [ -z "$last_session_num" ]; then
      last_session_num=0
    fi
  fi
  echo $((last_session_num + 1))
}

# --- Main Script ---

# Get the next session number
SESSION_NUM=$(get_next_session_number)

# Create the session directories
SESSION_DIR="$SESSIONS_DIR/$SESSION_NUM"
AGENT_RESULTS_DIR="$SESSION_DIR/agent_results"

mkdir -p "$AGENT_RESULTS_DIR"

echo "Created session directory: $SESSION_DIR"
echo "Agent results will be saved to: $AGENT_RESULTS_DIR"
echo "Session number: $SESSION_NUM"

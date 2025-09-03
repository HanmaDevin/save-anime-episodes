#!/usr/bin/bash

WATCHLIST="$HOME/anime-watchlist.txt"
LOGFILE="$HOME/.anime-watchlog.txt"

while true; do
  if ! pgrep -x "ani-cli" > /dev/null; then
    break
  fi
  watching=$(playerctl metadata xesam:title 2>/dev/null) # Get current title
  if [[ -n "$watching" ]]; then
    if ! grep -Fxq "$watching" "$WATCHLIST"; then # Check if not already in the list
      echo "Safed: $watching"
      echo "Safed: $watching" >> "$LOGFILE"
      echo "$watching" >> "$WATCHLIST"
    else
      echo "Already in watchlist: $watching"
      echo "Already in watchlist: $watching" >> "$LOGFILE"
    fi
  fi
  sleep 300 # Check every 5 minutes
done

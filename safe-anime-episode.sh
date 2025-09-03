#!/usr/bin/bash

WATCHLIST="$HOME/anime-watchlist.txt"

while true; do
  if ! pgrep -x "ani-cli" > /dev/null; then
    break
  fi
  watching=$(playerctl metadata xesam:title 2>/dev/null) # Get current title
  if [[ -n "$watching" ]]; then
    if ! grep -Fxq "$watching" "$WATCHLIST"; then # Check if not already in the list
      echo "$watching" >> "$WATCHLIST"
      notify-send "Anime" "Saved watch history"
    else
      notify-send "Anime" "Already in watch history"
    fi
  fi
  sleep 900 # Check every 15 minutes
done

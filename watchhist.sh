#!/usr/bin/bash

REPO="$HOME/safe-anime-episodes"
WATCHLIST="$REPO/anime-watchlist.txt"

git -C "$REPO" pull 

while true; do
  if ! pgrep -x "ani-cli" > /dev/null; then
    break
  fi
  watching=$(playerctl metadata xesam:title 2>/dev/null) # Get current title
  if [[ -n "$watching" ]]; then
    if ! grep -Fxq "$watching" "$WATCHLIST"; then # Check if not already in the list
      echo "Safed: $watching"
      echo "$watching" >> "$WATCHLIST"
    else
      echo "Already in watchlist: $watching"
    fi
  fi

  git add "$WATCHLIST"
  git commit -m "Update anime watchlist"
  git push 

  sleep 300 # Check every 5 minutes
done


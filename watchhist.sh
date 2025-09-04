#!/usr/bin/bash

REPO="$HOME/safe-anime-episodes"
WATCHLIST="$REPO/anime-watchlist.txt"

cd "$REPO"
git -C "$REPO" pull > /dev/null
echo "Last Episode: $(tail -n 1 $WATCHLIST)"

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

  git add "$WATCHLIST" > /dev/null
  git commit -m "added $watching to watchlist" > /dev/null
  git push > /dev/null

  sleep 300 # Check every 5 minutes
done


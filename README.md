# Bash script

This script is used to safe the watch history of anime episodes watched from ani-cli. <br>
It appends the episode to a text file named `watched_episodes.txt` in the `REPO` directory. <br>
The script should pull the latest `WATCHLIST` file from the specified `REPO` on startup and push the updated `WATCHLIST` file to the `REPO` on exit.

> [!NOTE]
> Modify the `REPO` and `WATCHLIST` variables to your needs.

Feel free to modify it to your needs.

# Usage

1. Make the script executable:

```bash
chmod +x safe-anime-episode.sh
```

2. Just after starting ani-cli run the script in antoher terminal.:

```bash
./safe-anime-episode.sh
```

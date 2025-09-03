# Bash script

This script is used to safe the watch history of anime episodes watched from ani-cli. <br>
It appends the episode to a text file named `watched_episodes.txt` in the `$HOME` directory. <br>
Feel free to modify it to your needs.

> [!NOTE]
> There is also a log file created at `$HOME/.anime-watchlog.txt`

# Usage

1. Make the script executable:

```bash
chmod +x safe-anime-episode.sh
```

2. Just after starting ani-cli run the script in antoher terminal.:

```bash
./safe-anime-episode.sh
```

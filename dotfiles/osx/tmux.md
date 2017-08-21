# Running tmux on osx

- In Terminal -> Preferences -> Profiles -> Shell
- set `usr/local/bin/tmux` under `Run Command`
- deselect `Run inside shell`

Combined with the .tmux.conf in this folder, this should run the default shell inside of tmux.

To change the default shell, run `chsh` and modify the path to point to the appropriate shell binary.

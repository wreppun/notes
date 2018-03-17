# Running tmux on osx

- `brew install tmux`
- `brew install reattach-to-user-namespace` for using the clipboard + tmux + vim
- add the `.tmux.config` file to the root directory


### IF you want to run tmux at startup (not always desireable because attach/detach)
- In Terminal -> Preferences -> Profiles -> Shell
- set `usr/local/bin/tmux` under `Run Command`
- deselect `Run inside shell`

Combined with the .tmux.conf in this folder, this should run the default shell inside of tmux.

To change the default shell, run `chsh` and modify the path to point to the appropriate shell binary.

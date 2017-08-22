set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_char_upstream_equal ''
set __fish_git_prompt_color yellow
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_ahead red
set __fish_git_prompt_color_merging red
set __fish_git_prompt_color_flags blue
set __fish_git_prompt_color_dirtystate red

function fish_prompt
  # Line 1
  set_color cyan
  printf '%s' (whoami)
  printf '@'
  printf '%s' (parsehost|cut -d . -f 1)
  set_color normal
  set_color --bold yellow
  printf ' %s' (prompt_pwd)
  set_color normal
  printf '%s' (__fish_git_prompt)
  set_color normal
  # Line 2
  echo 
  set_color normal
  printf 'λ '
end

function fish_right_prompt
  #display the timestamp on the right side
  echo -n -s $normal ' [' (date +%H:%M:%S) ']'
end

function parsehost
  echo (hostname)
end

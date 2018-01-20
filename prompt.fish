function fish_prompt
  set -lx error $status
  echo ""
  if test $error -ne 0
    set_color red
    history delete -C --exact (history | head -1) # remove last command if was an error
  else
    set_color magenta
  end
  echo -n "→ "
  set_color brblack
  echo -n (prompt_pwd)
  echo -n " · "
  set_color normal
end

function fish_right_prompt
  if test -d .git
    set_color yellow
    echo (git_current_branch)
    set_color normal

    if test (git_parse_dirty)
      set_color brblack
      echo " · "
      set_color green
      echo (git_lines_added)
      set_color red
      echo (git_lines_removed)
      set_color normal
    else
      set_color green
      echo " ⚑"
      set_color normal
    end
  end
end
function fish_prompt
  set -lx error $status
  echo ""
  if test $error -ne 0
    set_color red
  else
    set_color blue
  end
  echo -n "→ "
  set_color brblack
  echo -n (prompt_pwd)
  echo -n " · "
  set_color normal
end

function fish_right_prompt
  if test -d .git
    if test (git_parse_dirty)
      set_color brblack
    else
      set_color green
    end
    echo " "
    set_color bryellow
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
    end
  end
end

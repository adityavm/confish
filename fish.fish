# functions for fish

function fish_greeting
  echo -n ""
end

function __dedup_history -e fish_preexec -d "disallow duplicates in history"
  history delete -C --exact (history | head -1)
end

function __delete_error_command -e fish_postexec -d "delete command from history on error"
  set -lx error $status
  if test $error -ne 0
    history delete -C --exact (history | head -1)
  end
end
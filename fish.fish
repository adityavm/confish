# functions for fish

function fish_greeting
  echo -n ""
end

function __dedup_history -e fish_preexec -d "disallow duplicates in history"
  set -lx cmd (commandline)
  history delete -C --exact $cmd
end

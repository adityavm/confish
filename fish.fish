# functions for fish

function fish_greeting
  echo -n ""
end

# function __dedup_history -e fish_preexec -d "disallow duplicates"
#   set -l cmd $argv[1]
#   history delete -C --exact $cmd
# end

function __process_last_cmd -e fish_postexec -d "replay command on error"
  set -l error $status
  set -l cmd $argv[1]
  if test $error -ne 0
    commandline $cmd
    history delete -C --exact $cmd
  end
end

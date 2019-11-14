function git_current_branch
  set -lx out (git branch | grep -e "*")
  if test -z $out
    echo "☀ ︎"
  else
    echo $out | cut -d " " -f2
  end
end

# Get lines added
function git_lines_added
  set -l g (git rev-parse)
  if test -z "$g"
    echo (git diff --numstat | awk 'NF==3 {plus+=$1; minus+=$2} END {printf("+%d", plus)}')
  end
end

# Get lines removed
function git_lines_removed
  set -l g (git rev-parse)
  if test -z "$g"
    echo (git diff --numstat | awk 'NF==3 {plus+=$1; minus+=$2} END {printf("-%d", minus)}')
  end
end

# Get if dirty
function git_parse_dirty
  git status --porcelain 2> /dev/null | tail -n1
end

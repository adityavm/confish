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

# Get given branch description
function get_branch_description
  set -l description (git config "branch.$argv.description")
  echo $description
end

# Get list of recent branches with descriptions
function get_branches_with_descriptions
  while read -l i
    set -l trimmed (echo $i | sed -e 's/[^a-zA-Z0-9\/_-]//g') # https://trigonakis.com/blog/2011/07/28/pattern-matching-hyphen-minus-sign-in-bash/
    printf "%-20s %s %s %s\n" $i (set_color yellow) (get_branch_description $trimmed) (set_color normal)
  end
end

# Open a branch for editing
function git_edit_branch
  set -l editor "code"
  git fetch origin; and git checkout $argv; and $editor .
end

# Copy the current branch name
function gcpy
  set -l branchname (git branch | grep \* | cut -d ' ' -f2)
  echo $branchname | pbcopy
  if test -n "$branchname"
    echo "Copied `$branchname`"
  end
end
if test "$FISH_CONFIG" = ""
  set -x FISH_CONFIG ~/dev/confish
end

# recursively load configurations

function load_config
  # single arg
  if test (count $argv) -eq 1
    if test -z (echo $argv | grep -e "\/\_\_") # doesn't start with dunders
      if test -f $argv # is file
        set -lx is_fish (echo $argv | grep -e "\.fish\$")
        if [ $is_fish ] # is .fish file
          source $argv
        end
      else if test -d $argv
        load_config $argv/*
      end
    end
  # globbed paths
  else
    for config in $argv
      load_config $config
    end
  end
end

load_config $FISH_CONFIG/*

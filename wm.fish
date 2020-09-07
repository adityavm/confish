set basedir (dirname (status -f))

if test -e ~/.yabairc;
else
  ln -s $basedir/.yabairc ~/.yabairc
end

if test -e ~/.skhdrc;
else
  ln -s $basedir/.skhdrc ~/.skhdrc
end
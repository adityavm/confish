if test -e ~/.yabairc;
else
  ln -s $confish_dir/.yabairc ~/.yabairc
end

if test -e ~/.skhdrc;
else
  ln -s $confish_dir/.skhdrc ~/.skhdrc
end
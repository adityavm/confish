if [ -f ~/.config/fish/config.fish ]; then
  echo "source $PWD/__init.fish" >> ~/.config/fish/config.fish
else
  ln -s $PWD/__init.fish ~/.config/fish/config.fish
fi
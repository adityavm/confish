alias reload "source ~/.config/fish/config.fish"
alias app "yarn --silent"
alias serve "python -m SimpleHTTPServer 8000"

# add ssh keys
ssh-add >/dev/null 2>&1

function notify
  printf $argv[1] > /Users/aditya/Library/Application\ Support/Übersicht/widgets/lib/message
  osascript -e 'tell application "Übersicht" to refresh widget id "message-jsx"'
end

function bg --description "Run a fish command in the background using a bash subshell"
    bash -c "fish -c '""$argv""' &"
end
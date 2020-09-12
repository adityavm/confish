#!/usr/local/bin/fish

function get_space_for_win
  set -l jqstring "[.[] | {app: .app, space: .space} | select(.app == $argv)] | if .[0].space == null then .[0].space else .[0].space + 1 end"
  set -l query (yabai -m query --windows | jq $jqstring)
  echo $query
end

function move_space_to_after_window
  set -l dest_space (get_space_for_win $argv)
  if test $dest_space != "null"
    yabai -m space --move $dest_space
  end
end

move_space_to_after_window \"Firefox Developer Edition\" 
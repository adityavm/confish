function is_dnd_enabled
  set -l dndstatus (defaults -currentHost read ~/Library/Preferences/ByHost/com.apple.notificationcenterui doNotDisturb -boolean)
  if [ $dndstatus = '1' ]
    echo "true"
  else
    echo "false"
  end
end

function enable_dnd
  defaults -currentHost write ~/Library/Preferences/ByHost/com.apple.notificationcenterui doNotDisturb -boolean true
end

function disable_dnd
  defaults -currentHost write ~/Library/Preferences/ByHost/com.apple.notificationcenterui doNotDisturb -boolean false
end

function toggle_dnd
  set -l isdnd (is_dnd_enabled)
  if [ $isdnd = 'true' ]
    disable_dnd
  else
    enable_dnd
  end
end
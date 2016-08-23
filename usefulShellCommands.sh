
# http://askubuntu.com/questions/102046/is-it-okay-to-delete-cache
# This will delete everything in your .cache that was last accessed more than a year ago
find ~/.cache/ -type f -atime +365 -exec rm \;


import os
import subprocess

from os.path import expanduser
home = expanduser("~")
dotfiles = home + "/Git/dotfiles"

print("Linking files from " + dotfiles + " to " + home)

files = [
    '.config/i3/config',
    '.config/i3/polybar',
    '.config/i3/picom.conf',
    '.config/i3/topbar.py',
    '.config/i3/wallpaper.png',
    '.config/i3/dropbox.sh',
    '.vimrc',
    '.zshrc',
    '.bashrc',
    '.Xmodmap',
]

for f in files:
    path = home + "/" + f
    dpath = dotfiles + "/" + f
    print("Linking " + dpath + " to " + path)
    subprocess.run(['ln', '-sf', dpath, path])

pass


# aliases
alias lslibs='ls ~/Tools/libc-database/libs/'
alias tt='xdg-open ~/Pictures/Timetable.png'
alias fzf="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias fzfs=$'rg . | fzf --print0 -e | awk -F: \'{print $1}\''
alias bashrc="source ~/.bashrc"
alias vim="nvim"
alias colorpanes="/home/caprinux/Extra/color-scripts/color-scripts/panes"
alias play="cd ~/Playground"
alias ctf="cd ~/Desktop/CTF/"
alias dev="cd ~/Code"
alias bat='bat --paging=never'
alias man="MANPAGER=\"sh -c 'col -bx | bat -l man -p'\" man"
alias speedtest="python3 /home/caprinux/Extra/speedtest.py"

# tools - pwn
alias ida64='wine "/home/caprinux/Tools/IDA Pro 7.6/ida64.exe"'
alias ida32='wine "/home/caprinux/Tools/IDA Pro 7.6/ida.exe"'
alias objd='objdump -M intel -d'
alias ghidra='~/Tools/ghidra_10.0_PUBLIC/ghidraRun'
alias patch='bash ~/Desktop/CTF/Extra/patch.sh'
alias gdbxpl='bash ~/Desktop/CTF/Extra/gdb.sh'
alias libcid='~/Tools/libc-database/identify'
alias libcfind='~/Tools/libc-database/find'
alias john='/home/caprinux/Tools/JohnTheRipper/run/john'
alias gdb='gef'
alias run='~/Desktop/CTF/Extra/qemu.py'
# tools - reversing
alias jadx='/home/caprinux/Tools/jadx/jadx-gui/build/install/jadx-gui/bin/jadx-gui'

# tools - web
alias sublist='python3 ~/Tools/Web/Sublist3r/sublist3r.py'
alias dnsrecon='python3 ~/Tools/Web/dnsrecon/dnsrecon.py'

# tools - forensics
alias vol3='python3 /home/caprinux/Tools/volatility3/vol.py'
alias vol2='python2 /home/caprinux/Tools/volatility/vol.py'

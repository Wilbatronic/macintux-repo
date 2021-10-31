#
# ~/.bashrc
#

#Ibus settings if you need them
#type ibus-setup in terminal to change settings and start the daemon
#delete the hashtags of the next lines and restart
#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=dbus
#export QT_IM_MODULE=ibus



# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups

PS1='[\u@\h \W]\$ '

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

#iso and version used to install XeroLinux
alias iso="cat /etc/dev-rel | awk -F '=' '/ISO/ {print $2}'"

## Delete Symlinks for Repos
alias delsl='find . -xtype l -delete'

#switch between lightdm and sddm
alias nldm="sudo nano /etc/lightdm/lightdm.conf"
alias tolightdm="sudo pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings --noconfirm --needed ; sudo systemctl enable lightdm.service -f ; echo 'Lightm is active - reboot now'"
alias tosddm="sudo pacman -S sddm --noconfirm --needed ; sudo systemctl enable sddm.service -f ; echo 'Sddm is active - reboot now'"

## Modify Grub-BTRFS
alias ngbt='sudo nano /etc/default/grub-btrfs/config'

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

#systeminfo
alias probe="sudo -E hw-probe -all -upload"

#list with exa
alias ls='exa -al --color=always --group-directories-first --icons' # preferred listing
alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons'  # long format
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
alias l='exa -lah --color=always --group-directories-first --icons' # tree listing

#pacman unlock
alias unlock="sudo rm /var/lib/pacman/db.lck"

#available free memory
alias free="free -mt"

#continue download
alias wget="wget -c"

#readable output
alias df='df -h'

#userlist
alias userlist="cut -d: -f1 /etc/passwd"

#Pacman for software managment
alias search='sudo pacman -Qs'
alias remove='sudo pacman -R'
alias install='sudo pacman -S'
alias linstall='sudo pacman -U '
alias update='sudo pacman -Syyu'
alias clrcache='sudo pacman -Scc'
alias upall='paru && sudo pacman -Syyu'
alias psr="sudo pacman -Ss --color auto"
alias unlock='sudo rm /var/lib/pacman/db.lck'
alias orphans='sudo pacman -Rns $(pacman -Qtdq)'
alias clc='sudo pacman -Scc --color auto'


#Paru as aur helper - updates everything
alias pget='paru -S '
alias prm='paru -Rs '
alias psr='paru -Ss '
alias upall='paru -Syyu --noconfirm'

#Flatpak Update
alias fpup='flatpak update'

#grub update
alias grubup='sudo grub-mkconfig -o /boot/grub/grub.cfg'

#add new fonts
alias fc="sudo fc-cache -fv"

#get fastest mirrors in your neighborhood
alias ram="rate-mirrors arch | sudo tee /etc/pacman.d/mirrorlist"
alias reft='sudo systemctl enable reflector.service reflector.timer && sudo systemctl start reflector.service reflector.timer'

#quickly kill stuff
alias kc='killall conky'

#mounting the folder Public for exchange between host and guest on virtualbox
alias vbm="sudo mount -t vboxsf -o rw,uid=1000,gid=1000 Public /home/$USER/Public"

#enable vmware networks
alias vmnet='sudo systemctl enable vmware-networks && sudo systemctl start --now vmware-networks'

#Bash aliases
alias mkfile='touch'
alias thor='sudo thunar'
alias jctl='journalctl -p 3 -xb'
alias ssaver='xscreensaver-demo'
alias ~='cd ~ && source ~/.bashrc'
alias pingme='ping -c64 techxero.com'
alias cls='clear && neofetch'
alias traceme='traceroute techxero.com'
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

#hardware info --short
alias hw="hwinfo --short"

#youtube-dl
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "

alias yt='youtube-dl --recode-video mp4'
alias ytv-best="youtube-dl -f bestvideo+bestaudio "

#GiT  command
alias gc='git clone '

#Copy/Remove files/dirs
alias rmd='rm -r'
alias srm='sudo rm'
alias srmd='sudo rm -r'
alias cpd='cp -R'
alias scp='sudo cp'
alias scpd='sudo cp -R'

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -100"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

#Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

#nano
alias bashrc='sudo vim ~/.bashrc'
alias nsddm='sudo vim /etc/sddm.conf'
alias pconf='sudo vim /etc/pacman.conf'
alias mkpkg='sudo vim /etc/makepkg.conf'
alias ngrub='sudo vim /etc/default/grub'
alias smbconf='sudo vim /etc/samba/smb.conf'
alias baloorc='sudo vim ~/.config/baloofilerc'
alias nhefflogout='sudo vim /etc/oblogout.conf'
alias nmkinitcpio='sudo vim /etc/mkinitcpio.conf'
alias nmirrorlist='sudo vim /etc/pacman.d/mirrorlist'

#cd/ aliases
alias home='cd ~'
alias etc='cd /etc/'
alias music='cd ~/Music'
alias vids='cd ~/Videos'
alias conf='cd ~/.config'
alias desk='cd ~/Desktop'
alias pics='cd ~/Pictures'
alias dldz='cd ~/Downloads'
alias docs='cd ~/Documents'
alias linux='cd /mnt/Linux'
alias sapps='cd /usr/share/applications'
alias lapps='cd ~/.local/share/applications'

#verify signature for isos
alias gpgchk='gpg2 --keyserver-options auto-key-retrieve --verify'
alias gpgfx='gpg2 --keyserver-options auto-key-retrieve --verify'

#receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

#get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#shutdown or reboot
alias sr="sudo reboot"
alias ssn="sudo shutdown now"
alias lgn='qdbus org.kde.ksmserver /KSMServer logout 0 3 3'

#Load changes to ./bashrc
alias reload='source ~/.bashrc && neofetch'

#Fix KVM Resolition
alias vset='kcmshell5 kcm_kscreen'

#clear command
alias clear="clear && neofetch | lolcat"
# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Colors for custom colorblocks
magenta="\033[1;35m"
green="\033[1;32m"
white="\033[1;37m"
blue="\033[1;34m"
red="\033[1;31m"
black="\033[1;40;30m"
yellow="\033[1;33m"
cyan="\033[1;36m"
reset="\033[0m"
bgyellow="\033[1;43;33m"
bgwhite="\033[1;47;37m"
cl0="${reset}"
cl1="${magenta}"
cl2="${green}"
cl3="${white}"
cl4="${blue}"
cl5="${red}"
cl6="${yellow}"
cl7="${cyan}"
cl8="${black}"
cl9="${bgyellow}"
cl10="${bgwhite}"

block_width=4
block_height=1

bar_char_elapsed="-"
bar_char_total="="
bar_border="on"
bar_length=15
bar_color_elapsed="distro"
bar_color_total="distro"

PS1="Macintux (\u) \w ⌘ "
neofetch | lolcat

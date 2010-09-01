# .bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

shopt -s histappend
shopt -s checkwinsize

alias c="clear"
alias s="clear;ls"

# User specific aliases and functions
#export HTTP_PROXY=http://192.168.36.204:8080
#export http_proxy=http://192.168.36.204:8080
if [[ -s /home/girish/.rvm/scripts/rvm ]] ; then source /home/girish/.rvm/scripts/rvm ; fi

LS_COLORS='no=00:fi=00:di=00;34:ln=00;36:pi=33:so=00;35:do=00;35:bd=33;01:cd=33;01:or=31;01:mi=01;05;37:su=37:sg=30:ca=30:tw=30:ow=34:st=37:ex=00;32:*.tar=00;31:*.tgz=00;31:*.svgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.dz=00;31:*.gz=00;31:*.bz2=00;31:*.tbz2=00;31:*.bz=00;31:*.tz=00;31:*.deb=00;31:*.rpm=00;31:*.jar=00;31:*.rar=00;31:*.ace=00;31:*.zoo=00;31:*.cpio=00;31:*.7z=00;31:*.rz=00;31:*.jpg=00;35:*.jpeg=00;35:*.gif=00;35:*.bmp=00;35:*.pbm=00;35:*.pgm=00;35:*.ppm=00;35:*.tga=00;35:*.xbm=00;35:*.xpm=00;35:*.tif=00;35:*.tiff=00;35:*.png=00;35:*.mng=00;35:*.pcx=00;35:*.mov=00;35:*.mpg=00;35:*.mpeg=00;35:*.m2v=00;35:*.mkv=00;35:*.ogm=00;35:*.mp4=00;35:*.m4v=00;35:*.mp4v=00;35:*.vob=00;35:*.qt=00;35:*.nuv=00;35:*.wmv=00;35:*.asf=00;35:*.rm=00;35:*.rmvb=00;35:*.flc=00;35:*.avi=00;35:*.fli=00;35:*.gl=00;35:*.dl=00;35:*.xcf=00;35:*.xwd=00;35:*.yuv=00;35:*.svg=00;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:'

define(){
	dig +short txt $1.wp.dg.cx
}
alias gemi='gem install --no-rdoc --no-ri' 
alias lss="ls -srSh"
alias grep="grep --color=auto"
unset JAVA_HOME
export EDITOR=vim
alias fvim='vim -n -u NONE'
function fcache(){
lss /home/girish/.mozilla/firefox/kaudfw8p.default/Cache/*
}
function cpcache(){
cp /home/girish/.mozilla/firefox/kaudfw8p.default/Cache/$1 /media/FreeAgent\ Drive/screencasts/math/$2
}

NVM_DIR=$HOME/.nvm
. $NVM_DIR/nvm.sh
nvm use


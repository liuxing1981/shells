sudo echo "[China]" >> /etc/pacman.d/mirrors/China
sudo echo "Server = http://mirrors.ustc.edu.cn/manjaro/$branch/$repo/$arch" >> /etc/pacman.d/mirrors/China

sudo echo "OnlyCountry=China" >> /etc/pacman-mirrors.conf
sudo pacman-mirrors -g

sudo cat >> /etc/pacman.conf <<!
[archlinuxcn]
SigLevel = Optional TrustedOnly
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
!

sudo pacman -Syy && sudo pacman -S --noconfirm archlinuxcn-keyring

sudo pacman -S --noconfirm \ 
        fcitx \
	fcitx-libpinyin \
	kcm-fcitx \
	fcitx-sogoupinyin \
	fcitx-configtool \
	screenfetch \
	vi \
	vim

cat >> ~/.xprofile <<!
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export LC_CTYPE=zh_CN.UTF-8
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
xset -b
!
source ~/.xprofile

read -p "System will restart,Y/n?" confirm
if [ "$confirm" = "Y" ];then
	sudo reboot
fi

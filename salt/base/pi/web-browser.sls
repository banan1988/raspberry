chromium-browser:
  pkg.installed

web-browser.necessary.packages:
  pkg.installed:
    - pkgs:
      - xserver-xorg
      - x11-xserver-utils
      - xinit
      - openbox
      - unclutter
      - matchbox-window-manager
      - upower
      - webaccounts-chromium-extension
      - unity-chromium-extension

/opt/chromium-browser/start-chromium.sh:
  file.managed:
    - contents: |
        #!/bin/sh
        matchbox-window-manager -use_cursor no&
        chromium-browser https://www.netflix.com/browse/my-list
    - mode: 755
    - makedirs: True

/opt/chromium-browser/chromium.sh:
  file.managed:
    - contents: |
        #!/bin/sh
        xinit /opt/chromium-browser/start-chromium.sh
    - mode: 755
    - makedirs: True

/usr/bin/chromium:
  file.symlink:
    - target: /opt/chromium-browser/chromium.sh

/home/pi/.xinitrc:
  file.managed:
    - contents: |
        #!/bin/sh
        matchbox-window-manager
    - mode: 755

#Backup .config/lxsession/LXDE-pi/autostart:
#  file.copy:
#    - name: .config/lxsession/LXDE-pi/autostart.BCK
#    - source: .config/lxsession/LXDE-pi/autostart
#
#.config/lxsession/LXDE-pi/autostart:
#  file.managed:
#    - contents:
#      - "@chromium-browser — kiosk — incognito http://google.com"
#      - "@xset s noblank"
#      - "@xset s off"
#      - "@xset -dpms"
#      - "@unclutter -idle 0.1 -root"
#
#Backup /etc/lightdm/lightdm.conf:
#  file.copy:
#    - name: /etc/lightdm/lightdm.conf.BCK
#    - source: /etc/lightdm/lightdm.conf
#
#/etc/lightdm/lightdm.conf:
#  file.managed:
#    - contents:
#      - xserver-command= X -s 0 -dpms

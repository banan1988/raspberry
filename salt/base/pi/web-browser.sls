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

xserver-xorg-legacy:
  pkg.installed

Backup /etc/X11/Xwrapper.config:
  file.copy:
    - name: /etc/X11/Xwrapper.config.BCK
    - source: /etc/X11/Xwrapper.config

/etc/X11/Xwrapper.config:
  file.managed:
    - contents:
      - allowed_users=anybody
      - needs_root_rights=yes
    - require:
      - pkg: xserver-xorg-legacy

/opt/chromium-browser/start-chromium.sh:
  file.managed:
    - contents: |
        #!/bin/sh
        matchbox-window-manager -use_cursor no&
        chromium-browser --user-agent="Mozilla/5.0 (X11; CrOS armv7l 6946.86.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36" https://www.netflix.com/browse/my-list
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

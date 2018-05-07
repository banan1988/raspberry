# sudo apt-get install --no-install-recommends xserver-xorg x11-xserver-utils xinit openbox

web-browser.package:
  pkg.installed:
    - chromium-browser

web-browser.necessary.packages:
  pkg.installed:
    - pkgs:
      - x11-xserver-utils
      - unclutter

Backup .config/lxsession/LXDE-pi/autostart:
  file.copy:
    - name: .config/lxsession/LXDE-pi/autostart.BCK
    - source: .config/lxsession/LXDE-pi/autostart

.config/lxsession/LXDE-pi/autostart:
  file.managed:
    - contents:
      - @chromium-browser — kiosk — incognito http://google.com
      - @xset s noblank
      - @xset s off
      - @xset -dpms
      - @unclutter -idle 0.1 -root

Backup /etc/lightdm/lightdm.conf:
  file.copy:
    - name: /etc/lightdm/lightdm.conf.BCK
    - source: /etc/lightdm/lightdm.conf

/etc/lightdm/lightdm.conf:
  file.managed:
    - contents:
      - xserver-command= X -s 0 -dpms

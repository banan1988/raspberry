Backup /etc/dphys-swapfile:
  file.copy:
    - name: /etc/dphys-swapfile.BCK
    - source: /etc/dphys-swapfile
    - onlyif: 'test ! -e /etc/dphys-swapfile.BCK'

/etc/dphys-swapfile:
  file.managed:
    - contents:
      - CONF_SWAPFILE=/var/swap
      - CONF_SWAPSIZE=2048
      - CONF_SWAPFACTOR=2
      - CONF_MAXSWAP=4096

dphys-swapfile:
  service.running:
    - enable: True
    - reload: True
    - watch:
      - file: /etc/dphys-swapfile

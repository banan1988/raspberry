/tmp/pi-hole-install.sh:
  file.managed:
    - name: /tmp/pi-hole-install.sh
    - source: https://install.pi-hole.net
    - source_hash: b4d613805989bb7efcdb2b3d9d11bde2
    - onlyif: 'test ! -e /tmp/pi-hole-install.sh'

Backup /etc/apt/sources.list:
  file.copy:
    - name: /etc/apt/sources.list.BCK
    - source: /etc/apt/sources.list
    - onlyif: 'test ! -e /etc/apt/sources.list.BCK'

/etc/apt/sources.list:
  file.managed:
    - contents:
      - "# Raspbian"
      - deb http://raspbian.raspberrypi.org/raspbian/ stretch main contrib non-free rpi
      - deb-src http://raspbian.raspberrypi.org/raspbian/ stretch main contrib non-free rpi
      - "# Debian"
      - "# contrib and non-free components, add contrib non-free"
      - deb http://deb.debian.org/debian stretch main contrib non-free
      - deb-src http://deb.debian.org/debian stretch main contrib non-free
      - "#"
      - deb http://deb.debian.org/debian stretch-updates main contrib non-free
      - deb-src http://deb.debian.org/debian stretch-updates main contrib non-free
      - "#"
      - deb http://security.debian.org/debian-security/ stretch/updates main contrib non-free
      - deb-src http://security.debian.org/debian-security/ stretch/updates main contrib non-free

apt-get update:
  cmd.run:
    - onchanges:
      - file: /etc/apt/sources.list

chromium-browser:
  pkg.installed:
    - sources:
      - netflix: https://github.com/kusti8/chromium-build/releases/download/netflix-1.0.0/chromium-browser_56.0.2924.84-0ubuntu0.14.04.1.1011.deb
    - onlyif: 'test ! "dpkg -l | grep chromium-browser | grep 56.0.2924.84-0ubuntu0"'

raspicast.necessary.packages:
  pkg.installed:
    - pkgs:
      - libjpeg8-dev
      - libpng12-dev

raspicast.packages:
  pkg.installed:
    - sources:
      - omxiv: http://omxiv.bplaced.com/omxiv_0.1.5~git20170828~f67c422412.deb
    - require:
      - pkg: raspicast.necessary.packages

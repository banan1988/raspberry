Backup /boot/config.txt:
  file.copy:
    - name: /boot/config.txt.BCK
    - source: /boot/config.txt
    - onlyif: 'test ! -e /boot/config.txt.BCK'

/boot/config.txt:
  file.managed:
    - contents:
      - "# For more options and information see http://rpf.io/configtxt"
      - "# uncomment this if your display has a black border of unused pixels visible and your display can output without overscan"
      - disable_overscan=1
      - "# Enable audio (loads snd_bcm2835)"
      - dtparam=audio=on
      - "# Set memory for GPU"
      - gpu_mem=256
      - "# HDMI 720p 60Hz"
      - hdmi_group=1
      - hdmi_mode=4

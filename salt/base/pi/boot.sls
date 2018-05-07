Backup /boot/config.txt:
  file.copy:
    - name: /boot/config.txt.BCK
    - source: /boot/config.txt

/boot/config.txt:
  file.managed:
    - contents:
      - disable_overscan=1
      - gpu_mem=256

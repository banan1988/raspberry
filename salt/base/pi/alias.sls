/home/pi/.bash_aliases:
  file.managed:
    - contents:
      - "export LS_OPTIONS='--color=auto'"
      - "alias ll='ls $LS_OPTIONS -la'"

/root/.bash_aliases:
  file.managed:
    - contents:
      - "export LS_OPTIONS='--color=auto'"
      - "alias ll='ls $LS_OPTIONS -la'"

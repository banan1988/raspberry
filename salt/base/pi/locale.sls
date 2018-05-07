us_locale:
  locale.present:
    - name: en_US.UTF-8

default_locale:
  locale.system:
    - name: en_US.UTF-8
    - require:
      - locale: us_locale

setenv LANG:
   environ.setenv:
     - name: LANG
     - value: en_US.UTF-8
     - update_minion: True

kodi17:
  pkg.installed:
    - name: kodi
    - version: 2:17.6-2~stretch

kodi17-repo netflix:
  file.managed:
    - name: /tmp/kodi17-repo-netflix.zip
    - source: https://www.alelec.net/kodi/repository.alelec.zip
    - source_hash: 01b16d99eed4fc7efece94f5f9c91512
    - require:
      - pkg: kodi17
    - onlyif: 'test ! -e /tmp/kodi17-repo-netflix.zip'

kodi17-repo phantom-cda:
  file.managed:
    - name: /tmp/kodi17-repo-phantom-cda.zip
    - source: http://phantomrepo.5v.pl/repository.phantom-2016.02.18.zip
    - source_hash: cd08eed1c6ba829c5f76124f79f48fcd
    - require:
      - pkg: kodi17
    - onlyif: 'test ! -e /tmp/kodi17-repo-phantom-cda.zip'

kodi17-repo alltube:
  file.managed:
    - name: /tmp/kodi17-repo-alltube.zip
    - source: https://github.com/podpis/kodi/blob/master/zips/repository.podpis/repository.podpis-1.4.2.zip
    - source_hash: f7007b30fa92c4e5bf7ffd1daa03b1d6
    - require:
      - pkg: kodi17
    - onlyif: 'test ! -e /tmp/kodi17-repo-alltube.zip'

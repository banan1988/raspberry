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
    - source: https://github.com/podpis/kodi/raw/master/zips/repository.podpis-1.4.1.zip
    - source_hash: a43e569136535fb3892b83f5f29c5e94
    - require:
      - pkg: kodi17
    - onlyif: 'test ! -e /tmp/kodi17-repo-alltube.zip'

kodi18-repo netflix:
  file.managed:
    - name: /tmp/kodi18-repo-netflix.zip
    - source: https://github.com/asciidisco/plugin.video.netflix/archive/master.zip
    - source_hash: 76a985ac1ca9165877f2490ba4d25163
    - onlyif: 'test ! -e /tmp/kodi18-repo-netflix.zip'

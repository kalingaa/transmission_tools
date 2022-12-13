# This is a collection of tools made for transmission automations

tdone.sh

This send out an email when a torrent download is compleeted, written using bash and it use curl for the api request.
email send using sendgrid api v3

file permission need to be set so it cane be executed by the transmission user. 

making a file executeble

  sudo chmod +x /usr/local/sbin/tdone.sh

edit the settings.json on transmission demon, eg 

  /etc/transmission-daemon/settings.json

find and add/edit following

  "script-torrent-done-enabled": true,
  "script-torrent-done-filename": "/usr/local/sbin/tdone.sh",


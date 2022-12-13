#!/bin/sh

#################################################################################
# These are inherited from Transmission.                                        #
# Do not declare these. Just use as needed.                                     #
#                                                                               #
# TR_APP_VERSION                                                                #
# TR_TIME_LOCALTIME                                                             #
# TR_TORRENT_DIR                                                                #
# TR_TORRENT_HASH                                                               #
# TR_TORRENT_ID                                                                 #
# TR_TORRENT_NAME                                                               #
#                                                                               #
#################################################################################

SENDGRID_API_KEY="YOUR_SENDGRID_API_KEY"
EMAIL_TO="TO_EMAIL"
EMAIL_CC="CC_EMAIL"
FROM_EMAIL="FROM_EMAIL"
FROM_NAME="SNDER_NAME"
SUBJECT="EMAIL_SUBJECT"

# Email body sample
# bodyHTML="Hello, <br>Torrent '$TR_TORRENT_NAME' finished downloading at '$TR_TIME_LOCALTIME'"

bodyHTML="EMAIL BODY"

maildata='{"personalizations": [{"to": [{"email": "'${EMAIL_TO}'"}],"cc": [{"email":"'${EMAIL_CC}'"}]}],"from": {"email": "'${FROM_EMAIL}'",
  "name": "'${FROM_NAME}'"},"subject": "'${SUBJECT}'","content": [{"type": "text/html", "value": "'${bodyHTML}'"}]}'

curl --request POST \
  --url https://api.sendgrid.com/v3/mail/send \
  --header 'Authorization: Bearer '$SENDGRID_API_KEY \
  --header 'Content-Type: application/json' \
  --data "$maildata"

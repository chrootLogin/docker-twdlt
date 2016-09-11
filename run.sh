#!/bin/sh

cat <<EOF > /opt/twdlt/config.json
{
    "age": ${AGE},
    "atAge": ${AT_AGE},
    "perPage": ${PER_PAGE},
    "maxPage": ${MAX_PAGE},
    "useLimit": ${USE_LIMIT},
    "every": ${EVERY},
    "exclude": ${EXCLUDE},
    "consumerKey": "${CONSUMER_KEY}",
    "consumerSecret": "${CONSUMER_SECRET}",
    "accessToken": "${ACCESS_TOKEN}",
    "accessSecret": "${ACCESS_SECRET}"
}
EOF

exec twdlt -v -c /opt/twdlt/config.json

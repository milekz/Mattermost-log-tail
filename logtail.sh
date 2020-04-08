#!/bin/bash
tail -n0 -F "${1}" | while read LINE; do
  (echo "$LINE" ) && curl -X POST --silent --data-urlencode \
    "payload={\"username\": \"${3}\" , \"text\": \"$(echo $LINE | sed "s/\"/'/g")\"}" "${2}";
done


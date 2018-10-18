#!/bin/bash
limit=1000   # Set your limit in milliseconds here
docker_cmd=$(docker ps |grep *healthy |awk '{print $13}'| cut -d ')' -f 1 - | cut -d '(' -f 2 -
offsets=$(ntpq -nc peers | tail -n +3 | cut -c 62-66 | tr -d '-')

for offset in ${offsets}; do
if [ ${offset:-0} -ge ${limit:-1000} ]
  then
    echo "An NTPD offset is excessive"
    exit 1
fi
done

if [ $docker_cmd == unhealthy ]
  then
     echo "Container is unhealthy"
  else
     echo "Container is healthy"
fi

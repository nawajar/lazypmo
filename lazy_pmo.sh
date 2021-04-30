#!/bin/sh
year_month='2021-04'
token=`cat token`
items=( "$@" )
for i in "${items[@]}"
do
 day=$(printf '%02d' $i)
 json_payload=$(printf '{"contactId":'{you contact id}',"date":"'${year_month}'-%02dT00:00:00.000+07:00","description":"technical coach","hour":8,"isUsedProjectSelector":0,"milestone":null,"milestoneKey":null,"projectId":null,"projectText":"Agile Coaching: OTC \/ FTD","projectTitle":null,"remark":"","taskId":0,"type":94}' $i)
 curl -i -H "Authorization: Bearer ${token}" \
         -H "Content-Type: application/json; charset=utf-8" \
        --request POST \
        -d "${json_payload}" \
        'http://pmo.thaibev.com/api/user/{you contact id}/task'
 echo ${json_payload}
 sleep 1
done




#!/bin/bash
if [[ -f /etc/opt/microsoft/mdatp/managed/mdatp_managed.json ]]; then
    file_changed_date=`ls -l /etc/opt/microsoft/mdatp/managed/mdatp_managed.json | awk '{print $6,$7,$8}'`
    echo "True|$file_changed_date"
else
    echo "False"
fi

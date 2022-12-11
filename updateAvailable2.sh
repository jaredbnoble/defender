#!/bin/bash
#####################################################################################
#This performs a network call!
#####################################################################################
if [[ -f /etc/redhat-release || -f /etc/oracle-release ]] ; then
    yum check-update | grep mdatp > /dev/null 2>&1
    if [[ $? -ne 1 ]]; then
        echo "Update available"
    else
        echo "No Update available"
    fi
elif [ -f /etc/lsb-release ] ; then
    apt-get update > /dev/null 2>&1
    apt list --upgradable 2>/dev/null | grep mdatp > /dev/null 2>&1
    if [[ $? -ne 1 ]]; then
        echo "Update available"
    else
        echo "No Update available"
    fi
fi
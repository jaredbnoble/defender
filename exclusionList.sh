OS=`uname`
if [ "$OS" = "Darwin" ]; then
    export PATH=$PATH:"/Library/Application Support/Microsoft/Defender:/Applications/Microsoft Defender ATP.app/Contents/Resources/Tools:/usr/local/bin"
elif [ "$OS" = "Linux" ] ; then
if [ ! -L /usr/bin/mdatp ] ; then
    ln -sf /opt/microsoft/mdatp/sbin/wdavdaemonclient /usr/bin/mdatp
        if [ $? -ne 0 ] ; then
        echo "ERROR: Unable to link daemon client.."
            fi
    fi
if [ -f /etc/lsb-release ] ; then
	export PATH=$PATH:"/opt/microsoft/mdatp/conf/mdatp.service:/usr/lib/systemd/system"
	export PATH=$PATH:"/opt/microsoft/mdatp/conf/mdatp.service:/lib/systemd/system"
	export PATH=$PATH:"/opt/microsoft/mdatp/conf/mdatp.service:/etc/systemd/system"
	else
		export PATH=$PATH:"/opt/microsoft/mdatp/conf/mdatp.service:/usr/lib/systemd/system"
		export PATH=$PATH:"/opt/microsoft/mdatp/conf/mdatp.service:/lib/systemd/system"
		export PATH=$PATH:"/opt/microsoft/mdatp/conf/mdatp.service:/etc/systemd/system"
		fi
    fi
which mdatp > /dev/null 2>&1
    if [ $? -ne 0 ] ; then
        echo "mdatp command not found"
    else
        mdatpPath=$(which mdatp)
        "$mdatpPath" exclusion list
        if [ $? -ne 0 ] ; then
            echo "Client appears to be unhealthy. Generate a diagnostic log!"
            fi
        fi

OS=`uname`
if [[ "$i" = $cleanString ]] ; then
    if [ "$OS" = "Darwin" ]; then
        export PATH=$PATH:"/Library/Application Support/Microsoft/Defender:/Applications/Microsoft Defender ATP.app/Contents/Resources/Tools:/usr/local/bin"
    elif [ "$OS" = "Linux" ] ; then
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
            echo "MDATP Not Installed or binary not found."
        else
            mdatp connectivity test
            fi
    fi

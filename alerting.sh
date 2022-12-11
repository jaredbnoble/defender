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
            echo "Defender ATP not installed or binary not found."
        else
            mdatpPath=$(which mdatp)
            list=$(mdatp --threat --list --pretty);
            if [ $? -ne 0 ] ; then
                echo "Client appears to be unhealthy. Generate a diagnostic log from the Lowe's - Defender ATP Controls package!"
            else
                [[ -n $list ]] && echo "Alert Found" || echo "No Results"
                fi
            fi
    fi

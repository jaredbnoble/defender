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
            list=$(mdatp threat list pretty);
            if [ $? -ne 0 ] ; then
                echo "Client appears to be unhealthy. Generate a diagnostic log!"
                fi
            id=$(mdatp --threat --list --pretty | grep Id | awk '{print $2}');
            if [ $? -ne 0 ] ; then
                echo "Client appears to be unhealthy. Generate a diagnostic log!"
                fi
            name=$(mdatp --threat --list --pretty | grep Name | awk '{print $2}');
            if [ $? -ne 0 ] ; then
                echo "Client appears to be unhealthy. Generate a diagnostic log!"
                fi
            type=$(mdatp --threat --list --pretty | grep Type | awk '{print $2}');
            if [ $? -ne 0 ] ; then
                echo "Client appears to be unhealthy. Generate a diagnostic log!"
                fi
            detection=$(mdatp --threat --list --pretty | grep Detection | awk '{print $3,$4,$5,$6,$7}');
            if [ $? -ne 0 ] ; then
                echo "Client appears to be unhealthy. Generate a diagnostic log!"
                fi
            status=$(mdatp --threat --list --pretty | grep Status | awk '{print $2}');
            if [ $? -ne 0 ] ; then
                echo "Client appears to be unhealthy. Generate a diagnostic log!"
                fi
            countstatus=$(mdatp --threat --list --pretty | grep Status | awk '{print $2}' | wc -w);
            if [ $? -ne 0 ] ; then
                echo "Client appears to be unhealthy. Generate a diagnostic log!"
                fi
            
            echo ${list}"@"${id}"@"${name}"@"${type}"@"${detection}"@"${status}"@"${countstatus}
            fi
    fi

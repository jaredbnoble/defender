OS=`uname`
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
            health_status=`echo "MDATP Not Installed"`
            rtp_enabled=`echo "MDATP Not Installed or binary not found."`
            echo ${health_status}"|"${rtp_enabled}
        else
            mdatpPath=$(which mdatp)
            healthy=$(mdatp health | grep healthy | awk '{print $3}');
            if [ $? -ne 0 ] ; then
                health_status=$(echo "MDATP Not Installed")
            else
            	health_status=$(echo "Installed")
                fi
            licensed=$(mdatp health | grep licensed | awk '{print $3}');
            if [ $? -ne 0 ] ; then
                echo "Client appears to be unhealthy.Generate a diagnostic log!"
                fi
            engine_version=$(mdatp health | grep engine_version | awk '{print $3}');
            if [ $? -ne 0 ] ; then
                echo "Client appears to be unhealthy.Generate a diagnostic log!"
                fi
            app_version=$(mdatp health | grep app_version | awk '{print $3}');
            if [ $? -ne 0 ] ; then
                echo "Client appears to be unhealthy.Generate a diagnostic log!"
                fi
            org_id=$(mdatp health | grep org_id | awk '{print $3}');
            if [ $? -ne 0 ] ; then
                echo "Client appears to be unhealthy.Generate a diagnostic log!"
                fi
            log_level=$(mdatp health | grep log_level | awk '{print $3}');
            if [ $? -ne 0 ] ; then
                echo "Client appears to be unhealthy.Generate a diagnostic log!"
                fi
            machine_guid=$(mdatp health | grep machine_guid | awk '{print $3}');
            if [ $? -ne 0 ] ; then
                echo "Client appears to be unhealthy.Generate a diagnostic log!"
                fi
            release_ring=$(mdatp health | grep release_ring | awk '{print $3}');
            if [ $? -ne 0 ] ; then
                echo "Client appears to be unhealthy.Generate a diagnostic log!"
                fi
            product_expiration=$(mdatp health | grep product_expiration | awk '{print $3,$4,$5,$6,$7,$8}');
            if [ $? -ne 0 ] ; then
                echo "Client appears to be unhealthy.Generate a diagnostic log!"
                fi
            cloud_enabled=$(mdatp health | grep cloud_enabled | awk '{print $3}');
            if [ $? -ne 0 ] ; then
                echo "Client appears to be unhealthy.Generate a diagnostic log!"
                fi
            cloud_automatic_sample_submission_consent=$(mdatp health | grep cloud_automatic_sample_submission_consent | awk '{print $3}');
            if [ $? -ne 0 ] ; then
                echo "Client appears to be unhealthy.Generate a diagnostic log!"
                fi
            cloud_diagnostic_enabled=$(mdatp health | grep cloud_diagnostic_enabled | awk '{print $3}');
            if [ $? -ne 0 ] ; then
                echo "Client appears to be unhealthy.Generate a diagnostic log!"
                fi
            real_time_protection_enabled=$(mdatp health | grep real_time_protection_enabled | awk '{print $3}');
            if [ $? -ne 0 ] ; then
                rtp_enabled=$(echo "Stopped")
            else
                rtp_enabled=$(echo "Running")
                fi
            real_time_protection_available=$(mdatp health | grep real_time_protection_available | awk '{print $3}');
            if [ $? -ne 0 ] ; then
                echo "Client appears to be unhealthy.Generate a diagnostic log!"
                fi
            real_time_protection_subsystem=$(mdatp health | grep real_time_protection_subsystem | awk '{print $3}');
            if [ $? -ne 0 ] ; then
                echo "Client appears to be unhealthy.Generate a diagnostic log!"
                fi
            definitions_updated=$(mdatp health | grep definitions_updated | awk '{print $3,$4,$5,$6,$7,$8}');
            if [ $? -ne 0 ] ; then
                echo "Client appears to be unhealthy.Generate a diagnostic log!"
                fi
            definitions_updated_minutes_ago=$(mdatp health | grep definitions_updated_minutes_ago | awk '{print $3}');
            if [ $? -ne 0 ] ; then
                echo "Client appears to be unhealthy.Generate a diagnostic log!"
                fi
            definitions_version=$(mdatp health | grep definitions_version | awk '{print $3}');
            if [ $? -ne 0 ] ; then
                echo "Client appears to be unhealthy.Generate a diagnostic log!"
                fi
            definitions_status=$(mdatp health | grep definitions_status | awk '{print $3}');
            if [ $? -ne 0 ] ; then
                echo "Client appears to be unhealthy.Generate a diagnostic log!"
                fi
            edr_early_preview_enabled=$(mdatp health | grep edr_early_preview_enabled | awk '{print $3}');
            if [ $? -ne 0 ] ; then
                echo "Client appears to be unhealthy.Generate a diagnostic log!"
                fi
            edr_device_tags=$(mdatp health | grep edr_device_tags | awk '{print $3}');
            if [ $? -ne 0 ] ; then
                echo "Client appears to be unhealthy.Generate a diagnostic log!"
                fi
            edr_machine_id=$(mdatp health | grep edr_machine_id | awk '{print $3}');
            if [ $? -ne 0 ] ; then
                echo "Client appears to be unhealthy.Generate a diagnostic log!"
                fi
            
            echo ${health_status}"|"${rtp_enabled}
            fi
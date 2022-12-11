#!/bin/sh
#####################################################################################
#This performs a network call!
#####################################################################################

#@INCLUDE=i18n/UTF8Decode.sh
#@INCLUDE=utils/settings/get_client_dir.sh
#@INCLUDE=EnhancedTags/get_awk.sh
#@START_INCLUDES_HERE
#------------ INCLUDES START - Do not edit between this line and INCLUDE ENDS -----
#- Begin file: EnhancedTags/get_awk.sh
get_awk() {
  OS=`uname`
  if [ $OS = "SunOS" ]; then
    AWKCMD=/usr/xpg4/bin/awk
  else
    AWKCMD=`command -v awk`
  fi
  echo "$AWKCMD"
}
#- End file: EnhancedTags/get_awk.sh
#- Begin file: utils/settings/get_client_dir.sh
# To include this file, copy/paste: INCLUDE=utils/settings/get_client_dir.sh
get_client_dir() {
        if [ ! -z  "$TANIUM_CLIENT_ROOT" ]; then
                echo "$TANIUM_CLIENT_ROOT/"
        elif [ -f "./TaniumClient" ] && [ -x "./TaniumClient" ]; then
                        echo "./"
        elif [ -f "../../TaniumClient" ] && [ -x "../../TaniumClient" ]; then
                echo "../../"
        else
                OS=`uname`

                if [ "$OS" = "Darwin" ]; then
                        BASE=/Library
                else
                        BASE=/opt
                fi

                if [ -f "$BASE/Tanium/TaniumClient/TaniumClient" ] && [ -x "$BASE/Tanium/TaniumClient/TaniumClient" ]; then
                        echo "$BASE/Tanium/TaniumClient/"
                else
                        echo "Can not find Tanium Client directory"
                        exit 1
                fi
        fi
}
#- End file: utils/settings/get_client_dir.sh
#- Begin file: i18n/UTF8Decode.sh
# To include this file, copy/paste: INCLUDE=i18n/UTF8Decode.sh
awk_script='
function hex_to_octal(hex) {
        decimal=hex_to_decimal(hex)
        return sprintf("\\0%03o", decimal)
}
function hex_to_decimal(value, result) {
        for(j=1; j<=length(value); j++) {
                result=(result*16) + HEX[substr(value, j, 1)]
        }
        return(result)
}
function convert(s) {
        while(match(s, /%../)) {
                encoded=substr(s, RSTART, RLENGTH)
                sub(encoded, hex_to_octal(encoded), s)
        }
        return s
}
BEGIN {
        HEX["0"] = 0
        HEX["1"] = 1
        HEX["2"] = 2
        HEX["3"] = 3
        HEX["4"] = 4
        HEX["5"] = 5
        HEX["6"] = 6
        HEX["7"] = 7
        HEX["8"] = 8
        HEX["9"] = 9
        HEX["a"] = 10
        HEX["b"] = 11
        HEX["c"] = 12
        HEX["d"] = 13
        HEX["e"] = 14
        HEX["f"] = 15
        HEX["A"] = 10
        HEX["B"] = 11
        HEX["C"] = 12
        HEX["D"] = 13
        HEX["E"] = 14
        HEX["F"] = 15
}
{
        printf("%s\n", convert($0))
}
'
usable_awk() {
        if found=`command -v nawk`; then
                echo "$found"
                return
        fi
        if [ -x /usr/xpg4/bin/awk ]; then
                echo /usr/xpg4/bin/awk
                return
        fi
        command -v awk
}
utf8decode() {
        awk_bin=`usable_awk`
        printf "%b\n" "`echo "$1" | $awk_bin "$awk_script"`"
}
#- End file: i18n/UTF8Decode.sh
#------------ INCLUDES END - Do not edit above this line and INCLUDE STARTS -----
AGENTVERSION=`utf8decode "||version||"`
pattern=$AGENTVERSION

if [[  $(mdatp version) =~ $pattern ]]; then
    echo "No Update available"
else
    echo "Update available"
fi
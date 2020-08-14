#!/bin/bash
#
#
# Developed By : Yogendra Kumar
# Description  : Process monitoring for high CPU and Memory utilization
#
#
##########################################

#Variable declration
HOME="."
logs="$HOME/log.`date +"%Y%m"`"
Report_Folder="$HOME/Process_Report""
REPORTFILE="$Report_Folder/report-`date +'%d%b%Y'`"

#Functions Definiation

main(){

log_write(){

        msg=$1
        echo "`date +%Y/%m/%d" "%T` ::$msg" >> $logs
}

process_check (){

        # Top 5 Running Processes,basis Highest Memory and cpu
        echo -e "-----------------------------------------" >>$REPORTFILE
        echo "Top Five Process: `date +%Y/%m/%d" "%T`" >>$REPORTFILE
        echo -e "-------------------------------------------" >>$REPORTFILE
        ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -5 >>$REPORTFILE
        echo -e "-------------------------------------------\n" >>$REPORTFILE
        ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -5 >>$REPORTFILE
        echo -e "+++++++++++++++++++++++++++++++++++++++++++\n" >>$REPORTFILE

}
}

#################Main Function########################
main

if [ ! -d "$Report_Folder" ]
then
        log_write "FUNCTION ${FUNCNAME[0]} :WARNING:Folder /var/log/utilization is missing. Going to create folder"
        mkdir $Report_Folder 2>/tmp/temp_msg.$$
        if [ "$?" -eq 0 ]
        then
                log_write "FUNCTION ${FUNCNAME[0]} :INFO:Folder /var/log/utilization has been created"
        else
                log_write "FUNCTION ${FUNCNAME[0]} :ERROR:Folder /var/log/utilization creation failed :`cat /tmp/temp_msg.$$`"
                exit -1
        fi
fi

log_write "FUNCTION ${FUNCNAME[0]} :INFO:Calling process_check"
process_check

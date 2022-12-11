#requires audit diagnostic
/bin/cat /tmp/MDE_Diagnostic/auditd_log_analysis.txt/* | awk '/syscalls by initiator:/{flag=1; next} /paths:/{flag=0}flag' 
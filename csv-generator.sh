#! /bin/bash
#umask 022

##################################################################################
####### set ORACLE environment variable baseed on your server installation #######
##################################################################################
ORACLE_HOME=/home/oracle/product/11.2.0/client_1
export ORACLE_HOME
LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib:/usr/lib:/usr/openwin/lib
PATH=/bin:/usr/bin:/usr/local/bin:/usr/ccs/bin:/usr/ucb:/etc:/usr/sbin:/usr/local:/usr/lib:/usr/openwin/bin:/lib:/home/oracle/product/11.2.0/client_1/bin:/usr
export PATH LD_LIBRARY_PATH PATH

export ORACLE_BASE  ORACLE_HOME
export LD_LIBRARY_PATH PATH CLASSPATH

NLS_LANG=american_america.AR8MSWIN1256
export NLS_LANG


mails=yourmail@domain.com
##################################################################################
########################### set ORACLE DB variables ##############################
##################################################################################

userName=username
passWord=password
db_name=ORACLE_SID
header="your csv file header"
query="your query;"
path=/path/to/file/


sqlplus -s ${userName}/${passWord}@${db_name} >> ${path}YOURFILENAME.csv << Prak

set pagesize 0
set linesize 1000
set echo off
set heading off
set timing off
set feedback off
set serveroutput on


${header} union all ${query}

exit;

Prak

echo 'Please find attachement.' | mailx -s 'Mail title' -a ${path}YOURFILENAME.csv ${mails}

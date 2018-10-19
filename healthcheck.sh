#!/bin/bash


# NTP is the server used to syncronize the time in AWS is 169.254.169.123
# MAXDELAY is the maximum time offset chosen, it is in seconds
# RECIPIENT is the email address to send notifications
# HOST is the server hostname
# SUBJECT is the subject when the notification arrive
#DOCKER_CMD we use this command because in the Docker file we have configured this command " HEALTHCHECK CMD curl --fail http://localhost:80 || exit 1"
#when we run docker ps we can check if the webserver is healthy or not

# Here we can configure variables
NTP=169.254.169.123
MAXDELAY=1
RECIPIENT="gianluca.villani@gmail.com"
DOCKER_CMD=$(docker ps |grep "(healthy)" |awk '{print $11}'| cut -d ')' -f 1 - | cut -d '(' -f 2 -)

# Leave them as they are
HOST=$(hostname)
SUBJECT="$HOST - problems with NTP"

# We initialize variables
runlvl=1
runlvlv=""
run=1
offline=0
roffset=0
offset=0
DATE=$(date)


# we move in the path of execution
cd /var/log

echo "From: gianluca.villani@gmail.com" > /var/log/ntp.log
echo "To: $RECIPIENT" >> /var/log/ntp.log
echo "Subject: $SUBJECT" >> /var/log/ntp.log
echo "" >> /var/log/ntp.log
echo "Server: $HOST" >> /var/log/ntp.log
echo "ntp Report $DATE " >> /var/log/ntp.log
echo "" >> /var/log/ntp.log
echo "" >> /var/log/ntp.log


#check if the container is healthy or not

if [ $DOCKER_CMD == "healthy" ]
  then
  echo "Container is healthy"
  else
  echo "Container is unhealthy"

fi

# check if the ntpd is running, if it is not correct I increase the counter and I log the error
ERRCNT=0
run=`ps -ef |grep -v grep |grep -c ntpd`
if [ $run -eq 0 ] || [ $run -gt 1 ]
        then
        echo "NTP is down or there are 2 instances" >> /var/log/ntp.log
        echo "NTP is down or there are 2 instances" 
        ERRCNT=$(expr $ERRCNT + 1)
fi

# check if the runlevel is ok , if it is not correct I increase the counter and I log the error

runlvl=$(/sbin/chkconfig --list ntpd | grep '3:on' | grep -c '5:on')
runlvlv=$(/sbin/chkconfig --list ntpd)
if [ $runlvl -eq 0 ]
        then
        echo "RUNLEVEL NTPD are off" >> /var/log/ntp.log
        echo "RUNLEVEL NTPD are off"
        echo "$runlvlv" >> /var/log/ntp.log
        echo "" >> /var/log/ntp.log
        ERRCNT=$(expr $ERRCNT + 1)
fi

# check if the NTP server is available, if it is not correct I increase the counter and I log the error

/usr/sbin/ntpdate -q $NTP > /var/log/ntpdate.log
offline=$?
if [ $offline -eq 1 ]
        then
        echo "No NTP Server found!" >> /var/log/ntp.log
        echo "No NTP Server found!"
        cat ntpdate.log >> /var/log/ntp.log
        echo "" >> /var/log/ntp.log
        ERRCNT=$(expr $ERRCNT + 1)
fi


# check that the offset is not greater than the chosen value ,if it is not correct I increase the counter and I log the error

i=1
roffset=$(cat /var/log/ntpdate.log |awk '{print $6}'|awk '{if ( FNR=='$i' ) {print $0}}')
offset=$(echo $roffset |cut -d. -f1 |cut -d- -f2)

if [ $offset -gt 0 ]
        then
        if [ $offset -gt $MAXDELAY ]
                then
                ERRCNT=$(expr $ERRCNT + 1)
                echo "The offset is not correct this is the value : $offset seconds" >> /var/log/ntp.log
                echo "The offset is not correct this is the value : $offset seconds"
        fi
fi

# If the counter is greater than 0 the script sends an email with the errors

if [ $ERRCNT -gt 0 ]
        then
        cat /var/log/ntp.log | /usr/sbin/sendmail -t;
        echo "" > /var/log/ntp.log
fi


# clean up of the logs
echo "" > /var/log/ntp.log
echo "" > /var/log/ntpdate.log

# I reset variables
runlvl=1
runlvlv=""
run=1
offline=0
roffset=0
offset=0

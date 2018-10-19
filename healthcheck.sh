./healthcheck.sh: line 47: [: ==: unary operator expected
+ echo 'Container is unhealthy'
Container is unhealthy
+ ERRCNT=0
++ grep -c ntpd
++ grep -v grep
++ ps -ef
+ run=1
+ '[' 1 -eq 0 ']'
+ '[' 1 -gt 1 ']'
./healthcheck.sh: line 100: unexpected EOF while looking for matching ``'
./healthcheck.sh: line 125: syntax error: unexpected end of file
[root@ip-172-31-27-87 ~]#
[root@ip-172-31-27-87 ~]#
[root@ip-172-31-27-87 ~]# vim healthcheck.sh
-bash: vim: command not found
[root@ip-172-31-27-87 ~]# vi healthcheck.sh
[root@ip-172-31-27-87 ~]#
[root@ip-172-31-27-87 ~]# ./healthcheck.sh
+ NTP=169.254.169.123
+ MAXDELAY=1
#!/bin/bash
set -x

# NTP is the server used to syncronize the time in AWS is 169.254.169.123
# MAXDELAY is the maximum time offset chosen, it is in seconds
# RECIPIENT is the email address to send notifications
# HOST is the server hostname
# SUBJECT is the subject when the notification arrive
# DOCKER_CMD we use this command because in the Docker file we have configured this command " HEALTHCHECK CMD curl --fail http://localhost:80 || exit 1"
# when we run docker ps we can check if the webserver is healthy or not

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


# We move to the path of execution
cd /var/script

echo "From: gianluca.villani@gmail.com" > /var/log/ntp.log
echo "To: $RECIPIENT" >> /var/log/ntp.log
echo "Subject: $SUBJECT" >> /var/log/ntp.log
echo "" >> /var/log/ntp.log
echo "Server: $HOST" >> /var/log/ntp.log
echo "ntp Report $DATE " >> /var/log/ntp.log
echo "" >> /var/log/ntp.log
echo "" >> /var/log/ntp.log
:100
        echo "No NTP Server found!" >> /var/log/ntp.log
+ RECIPIENT=gianluca.villani@gmail.com
++ cut -d '(' -f 2 -
++ cut -d ')' -f 1 -
++ awk '{print $11}'
++ grep '(healthy)'
++ docker ps
+ DOCKER_CMD=healthy
++ hostname
+ HOST=ip-172-31-27-87
+ SUBJECT='ip-172-31-27-87 - problems with NTP'
+ runlvl=1
+ runlvlv=
+ run=1
+ offline=0
+ roffset=0
+ offset=0
++ date
+ DATE='Fri Oct 19 09:44:38 UTC 2018'
+ cd /var/script
./healthcheck.sh: line 33: cd: /var/script: No such file or directory
+ echo 'From: gianluca.villani@gmail.com'
+ echo 'To: gianluca.villani@gmail.com'
+ echo 'Subject: ip-172-31-27-87 - problems with NTP'
+ echo ''
+ echo 'Server: ip-172-31-27-87'
+ echo 'ntp Report Fri Oct 19 09:44:38 UTC 2018 '
+ echo ''
+ echo ''
+ '[' == healthy ']'
./healthcheck.sh: line 47: [: ==: unary operator expected
+ echo 'Container is unhealthy'
Container is unhealthy
+ ERRCNT=0
++ grep -c ntpd
++ grep -v grep
++ ps -ef
+ run=1
+ '[' 1 -eq 0 ']'
+ '[' 1 -gt 1 ']'
./healthcheck.sh: line 100: unexpected EOF while looking for matching ``'
./healthcheck.sh: line 125: syntax error: unexpected end of file
[root@ip-172-31-27-87 ~]# vi healthcheck.sh
[root@ip-172-31-27-87 ~]#
[root@ip-172-31-27-87 ~]#
[root@ip-172-31-27-87 ~]# ./healthcheck.sh
+ NTP=169.254.169.123
+ MAXDELAY=1
#!/bin/bash
set -x

# NTP is the server used to syncronize the time in AWS is 169.254.169.123
# MAXDELAY is the maximum time offset chosen, it is in seconds
# RECIPIENT is the email address to send notifications
# HOST is the server hostname
# SUBJECT is the subject when the notification arrive
# DOCKER_CMD we use this command because in the Docker file we have configured this command " HEALTHCHECK CMD curl --fail http://localhost:80 || exit 1"
# when we run docker ps we can check if the webserver is healthy or not

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


# We move to the path of execution
cd /var/script

echo "From: gianluca.villani@gmail.com" > /var/log/ntp.log
echo "To: $RECIPIENT" >> /var/log/ntp.log
echo "Subject: $SUBJECT" >> /var/log/ntp.log
echo "" >> /var/log/ntp.log
echo "Server: $HOST" >> /var/log/ntp.log
echo "ntp Report $DATE " >> /var/log/ntp.log
echo "" >> /var/log/ntp.log
echo "" >> /var/log/ntp.log
"healthcheck.sh" 124L, 3447C
        cat ntpdate.log >> /var/log/ntp.log
+ RECIPIENT=gianluca.villani@gmail.com
++ cut -d '(' -f 2 -
++ cut -d ')' -f 1 -
++ awk '{print $11}'
++ grep '(healthy)'
++ docker ps
+ DOCKER_CMD=healthy
++ hostname
+ HOST=ip-172-31-27-87
+ SUBJECT='ip-172-31-27-87 - problems with NTP'
+ runlvl=1
+ runlvlv=
+ run=1
+ offline=0
+ roffset=0
+ offset=0
++ date
+ DATE='Fri Oct 19 09:45:39 UTC 2018'
+ cd /var/script
./healthcheck.sh: line 33: cd: /var/script: No such file or directory
+ echo 'From: gianluca.villani@gmail.com'
+ echo 'To: gianluca.villani@gmail.com'
+ echo 'Subject: ip-172-31-27-87 - problems with NTP'
+ echo ''
+ echo 'Server: ip-172-31-27-87'
+ echo 'ntp Report Fri Oct 19 09:45:39 UTC 2018 '
+ echo ''
+ echo ''
+ '[' == healthy ']'
./healthcheck.sh: line 47: [: ==: unary operator expected
+ echo 'Container is unhealthy'
Container is unhealthy
+ ERRCNT=0
++ grep -c ntpd
++ grep -v grep
++ ps -ef
+ run=1
+ '[' 1 -eq 0 ']'
+ '[' 1 -gt 1 ']'
./healthcheck.sh: line 86: unexpected EOF while looking for matching ``'
./healthcheck.sh: line 125: syntax error: unexpected end of file
[root@ip-172-31-27-87 ~]# vi healthcheck.sh
[root@ip-172-31-27-87 ~]#
[root@ip-172-31-27-87 ~]#
[root@ip-172-31-27-87 ~]# ./healthcheck.sh
+ NTP=169.254.169.123
+ MAXDELAY=1
#!/bin/bash
set -x

# NTP is the server used to syncronize the time in AWS is 169.254.169.123
# MAXDELAY is the maximum time offset chosen, it is in seconds
# RECIPIENT is the email address to send notifications
# HOST is the server hostname
# SUBJECT is the subject when the notification arrive
# DOCKER_CMD we use this command because in the Docker file we have configured this command " HEALTHCHECK CMD curl --fail http://localhost:80 || exit 1"
# when we run docker ps we can check if the webserver is healthy or not

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


# We move to the path of execution
cd /var/script

echo "From: gianluca.villani@gmail.com" > /var/log/ntp.log
echo "To: $RECIPIENT" >> /var/log/ntp.log
echo "Subject: $SUBJECT" >> /var/log/ntp.log
echo "" >> /var/log/ntp.log
echo "Server: $HOST" >> /var/log/ntp.log
echo "ntp Report $DATE " >> /var/log/ntp.log
echo "" >> /var/log/ntp.log
echo "" >> /var/log/ntp.log
:86
runlvl=$(/sbin/chkconfig --list ntpd | grep '3:on' | grep -c '5:on'`)
+ RECIPIENT=gianluca.villani@gmail.com
++ cut -d '(' -f 2 -
++ cut -d ')' -f 1 -
++ awk '{print $11}'
++ grep '(healthy)'
++ docker ps
+ DOCKER_CMD=healthy
++ hostname
+ HOST=ip-172-31-27-87
+ SUBJECT='ip-172-31-27-87 - problems with NTP'
+ runlvl=1
+ runlvlv=
+ run=1
+ offline=0
+ roffset=0
+ offset=0
++ date
+ DATE='Fri Oct 19 09:46:20 UTC 2018'
+ cd /var/script
./healthcheck.sh: line 33: cd: /var/script: No such file or directory
+ echo 'From: gianluca.villani@gmail.com'
+ echo 'To: gianluca.villani@gmail.com'
+ echo 'Subject: ip-172-31-27-87 - problems with NTP'
+ echo ''
+ echo 'Server: ip-172-31-27-87'
+ echo 'ntp Report Fri Oct 19 09:46:20 UTC 2018 '
+ echo ''
+ echo ''
+ '[' == healthy ']'
./healthcheck.sh: line 47: [: ==: unary operator expected
+ echo 'Container is unhealthy'
Container is unhealthy
+ ERRCNT=0
++ grep -c ntpd
++ grep -v grep
++ ps -ef
+ run=1
+ '[' 1 -eq 0 ']'
+ '[' 1 -gt 1 ']'
./healthcheck.sh: line 86: unexpected EOF while looking for matching ``'
./healthcheck.sh: line 125: syntax error: unexpected end of file
[root@ip-172-31-27-87 ~]# vi healthcheck.sh
[root@ip-172-31-27-87 ~]#
[root@ip-172-31-27-87 ~]#
[root@ip-172-31-27-87 ~]# ./healthcheck.sh
+ NTP=169.254.169.123
+ MAXDELAY=1
#!/bin/bash
set -x

# NTP is the server used to syncronize the time in AWS is 169.254.169.123
# MAXDELAY is the maximum time offset chosen, it is in seconds
# RECIPIENT is the email address to send notifications
# HOST is the server hostname
# SUBJECT is the subject when the notification arrive
# DOCKER_CMD we use this command because in the Docker file we have configured this command " HEALTHCHECK CMD curl --fail http://localhost:80 || exit 1"
# when we run docker ps we can check if the webserver is healthy or not

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


# We move to the path of execution
cd /var/script

echo "From: gianluca.villani@gmail.com" > /var/log/ntp.log
echo "To: $RECIPIENT" >> /var/log/ntp.log
echo "Subject: $SUBJECT" >> /var/log/ntp.log
echo "" >> /var/log/ntp.log
echo "Server: $HOST" >> /var/log/ntp.log
echo "ntp Report $DATE " >> /var/log/ntp.log
echo "" >> /var/log/ntp.log
echo "" >> /var/log/ntp.log
:73
echo "ntp Report $DATE " >> /var/log/ntp.log
+ RECIPIENT=gianluca.villani@gmail.com
++ cut -d '(' -f 2 -
++ cut -d ')' -f 1 -
++ awk '{print $11}'
++ grep '(healthy)'
++ docker ps
+ DOCKER_CMD=healthy
++ hostname
+ HOST=ip-172-31-27-87
+ SUBJECT='ip-172-31-27-87 - problems with NTP'
+ runlvl=1
+ runlvlv=
+ run=1
+ offline=0
+ roffset=0
+ offset=0
++ date
+ DATE='Fri Oct 19 09:46:46 UTC 2018'
+ cd /var/script
./healthcheck.sh: line 33: cd: /var/script: No such file or directory
+ echo 'From: gianluca.villani@gmail.com'
+ echo 'To: gianluca.villani@gmail.com'
+ echo 'Subject: ip-172-31-27-87 - problems with NTP'
+ echo ''
+ echo 'Server: ip-172-31-27-87'
+ echo 'ntp Report Fri Oct 19 09:46:46 UTC 2018 '
+ echo ''
+ echo ''
+ '[' == healthy ']'
./healthcheck.sh: line 47: [: ==: unary operator expected
+ echo 'Container is unhealthy'
Container is unhealthy
+ ERRCNT=0
++ grep -c ntpd
++ grep -v grep
++ ps -ef
+ run=1
+ '[' 1 -eq 0 ']'
+ '[' 1 -gt 1 ']'
./healthcheck.sh: line 73: unexpected EOF while looking for matching ``'
./healthcheck.sh: line 125: syntax error: unexpected end of file
[root@ip-172-31-27-87 ~]# vi healthcheck.sh
[root@ip-172-31-27-87 ~]#
[root@ip-172-31-27-87 ~]#
[root@ip-172-31-27-87 ~]#
[root@ip-172-31-27-87 ~]# ./healthcheck.sh
+ NTP=169.254.169.123
+ MAXDELAY=1
#!/bin/bash
set -x

# NTP is the server used to syncronize the time in AWS is 169.254.169.123
# MAXDELAY is the maximum time offset chosen, it is in seconds
# RECIPIENT is the email address to send notifications
# HOST is the server hostname
# SUBJECT is the subject when the notification arrive
# DOCKER_CMD we use this command because in the Docker file we have configured this command " HEALTHCHECK CMD curl --fail http://localhost:80 || exit 1"
# when we run docker ps we can check if the webserver is healthy or not

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


# We move to the path of execution
cd /var/script

echo "From: gianluca.villani@gmail.com" > /var/log/ntp.log
echo "To: $RECIPIENT" >> /var/log/ntp.log
echo "Subject: $SUBJECT" >> /var/log/ntp.log
echo "" >> /var/log/ntp.log
echo "Server: $HOST" >> /var/log/ntp.log
echo "ntp Report $DATE " >> /var/log/ntp.log
echo "" >> /var/log/ntp.log
echo "" >> /var/log/ntp.log
:66

+ RECIPIENT=gianluca.villani@gmail.com
++ cut -d '(' -f 2 -
++ cut -d ')' -f 1 -
++ awk '{print $11}'
++ grep '(healthy)'
++ docker ps
+ DOCKER_CMD=healthy
++ hostname
+ HOST=ip-172-31-27-87
+ SUBJECT='ip-172-31-27-87 - problems with NTP'
+ runlvl=1
+ runlvlv=
+ run=1
+ offline=0
+ roffset=0
+ offset=0
++ date
+ DATE='Fri Oct 19 09:47:29 UTC 2018'
+ cd /var/script
./healthcheck.sh: line 33: cd: /var/script: No such file or directory
+ echo 'From: gianluca.villani@gmail.com'
+ echo 'To: gianluca.villani@gmail.com'
+ echo 'Subject: ip-172-31-27-87 - problems with NTP'
+ echo ''
+ echo 'Server: ip-172-31-27-87'
+ echo 'ntp Report Fri Oct 19 09:47:29 UTC 2018 '
+ echo ''
+ echo ''
+ '[' == healthy ']'
./healthcheck.sh: line 47: [: ==: unary operator expected
+ echo 'Container is unhealthy'
Container is unhealthy
+ ERRCNT=0
++ grep -c ntpd
++ grep -v grep
++ ps -ef
+ run=1
+ '[' 1 -eq 0 ']'
+ '[' 1 -gt 1 ']'
./healthcheck.sh: line 66: unexpected EOF while looking for matching ``'
./healthcheck.sh: line 125: syntax error: unexpected end of file
[root@ip-172-31-27-87 ~]# vi healthcheck.sh
[root@ip-172-31-27-87 ~]#
[root@ip-172-31-27-87 ~]# ./healthcheck.sh
+ NTP=169.254.169.123
+ MAXDELAY=1
+ RECIPIENT=gianluca.villani@gmail.com
++ cut -d '(' -f 2 -
++ cut -d ')' -f 1 -
++ awk '{print $11}'
++ grep '(healthy)'
++ docker ps
+ DOCKER_CMD=healthy
++ hostname
+ HOST=ip-172-31-27-87
+ SUBJECT='ip-172-31-27-87 - problems with NTP'
+ runlvl=1
+ runlvlv=
+ run=1
+ offline=0
+ roffset=0
+ offset=0
++ date
+ DATE='Fri Oct 19 09:47:56 UTC 2018'
+ cd /var/script
./healthcheck.sh: line 33: cd: /var/script: No such file or directory
+ echo 'From: gianluca.villani@gmail.com'
+ echo 'To: gianluca.villani@gmail.com'
+ echo 'Subject: ip-172-31-27-87 - problems with NTP'
+ echo ''
+ echo 'Server: ip-172-31-27-87'
+ echo 'ntp Report Fri Oct 19 09:47:56 UTC 2018 '
+ echo ''
+ echo ''
+ '[' == healthy ']'
./healthcheck.sh: line 47: [: ==: unary operator expected
+ echo 'Container is unhealthy'
Container is unhealthy
+ ERRCNT=0
++ grep -c ntpd
++ grep -v grep
++ ps -ef
+ run=1
+ '[' 1 -eq 0 ']'
+ '[' 1 -gt 1 ']'
++ grep -c 5:on
++ grep 3:on
++ /sbin/chkconfig --list ntpd
+ runlvl=1
++ /sbin/chkconfig --list ntpd
+ runlvlv='ntpd           	0:off	1:off	2:on	3:on	4:on	5:on	6:off'
+ '[' 1 -eq 0 ']'
+ /usr/sbin/ntpdate -q 169.254.169.123
./healthcheck.sh: line 78: /var/script/ntpdate.log: No such file or directory
+ /usr/sbin/ntpdate -q 169.254.169.123
server 169.254.169.123, stratum 3, offset -0.033682, delay 0.02586
19 Oct 09:48:02 ntpdate[4600]: adjust time server 169.254.169.123 offset -0.033682 sec
+ offline=0
+ '[' 0 -eq 1 ']'
+ i=1
++ awk '{if ( FNR==1 ) {print $0}}'
++ awk '{print $6}'
++ cat /var/script/ntpdate.log
cat: /var/script/ntpdate.log: No such file or directory
+ roffset=
++ cut -d- -f2
++ cut -d. -f1
++ echo
+ offset=
+ '[' -gt 0 ']'
./healthcheck.sh: line 96: [: -gt: unary operator expected
+ '[' 0 -gt 0 ']'
+ echo ''
+ echo ''
./healthcheck.sh: line 116: /var/script/ntpdate.log: No such file or directory
+ runlvl=1
+ runlvlv=
+ run=1
+ offline=0
+ roffset=0
+ offset=0
[root@ip-172-31-27-87 ~]# logout
[ec2-user@ip-172-31-27-87 ~]$ logout
Connection to 54.194.79.141 closed.
 gvillani@MACB134  ~/Downloads                          ✔  3760  12:01:04
 gvillani@MACB134  ~/Downloads                          ✔  3760  12:01:04
 gvillani@MACB134  ~/Downloads  cd -                    ✔  3760  12:01:04
~/Desktop/Script/Cloudformation/now-project
 gvillani@MACB134  ~/Desktop/Script/Cloudformation/now-project  ll
total 88
-rw-r--r--   1 gvillani  staff   252B Oct 18 20:53 Dockerfile
-rw-r--r--   1 gvillani  staff   2.2K Oct 11 16:16 README.md
drwxr-xr-x   3 gvillani  staff    96B Oct 19 11:30 cloudformation
AWSTemplateFormatVersion: '2010-09-09'
Parameters:
  KeyName:
    Type: AWS::EC2::KeyPair::KeyName
    Description: Name of an existing EC2 KeyPair to enable SSH access to the ECS instances.
  VpcId:
    Type: AWS::EC2::VPC::Id
    Description: Select a VPC that allows instances access to the Internet.
  SubnetId:
    Type: List<AWS::EC2::Subnet::Id>
    Description: Select at two subnets in your selected VPC.
  DesiredCapacity:
    Type: Number
    Default: '2'
    Description: Number of instances to launch in your ECS cluster.
  MaxSize:
    Type: Number
    Default: '3'
    Description: Maximum number of instances that can be launched in your ECS cluster.
  ContainerPort:
    Type: Number
    Default: '8080'
/wge
    Type: AWS::AutoScaling::LaunchConfiguration
-rwxr-xr-x   1 gvillani  staff   2.9K Oct 14 20:20 docker-task.sh
-rw-r--r--   1 gvillani  staff   917B Oct 16 10:16 index.js
drwxr-xr-x  55 gvillani  staff   1.7K Oct 15 14:40 node_modules
-rw-r--r--   1 gvillani  staff    14K Oct 15 14:40 package-lock.json
-rw-r--r--   1 gvillani  staff   354B Oct 15 14:40 package.json
-rw-r--r--   1 gvillani  staff   608B Oct 15 13:41 serverDate.js
-rwxr--r--   1 gvillani  staff   3.4K Oct 19 10:59 test.sh
 gvillani@MACB134  ~/Desktop/Script/Cloudformation/now-project  vim test.sh
 gvillani@MACB134  ~/Desktop/Script/Cloudformation/now-project 
 gvillani@MACB134  ~/Desktop/Script/Cloudformation/now-project  atom ./test.sh

 gvillani@MACB134  ~/Desktop/Script/Cloudformation/now-project  cd cloudformation
 gvillani@MACB134  ~/Desktop/Script/Cloudformation/now-project/cloudformation  ll                                                       ✔  3765  12:06:11
total 24
-rw-r--r--@ 1 gvillani  staff   9.1K Oct 19 11:30 ecs-webapp-stack.yml
 gvillani@MACB134  ~/Desktop/Script/Cloudformation/now-project/cloudformation  grep wget *                                              ✔  3766  12:06:12
          yum install -y aws-cfn-bootstrap wget
          wget https://raw.githubusercontent.com/Linux1975/Scripts/master/healthcheck.sh
 gvillani@MACB134  ~/Desktop/Script/Cloudformation/now-project/cloudformation  vim ecs-webapp-stack.yml                                 ✔  3767  12:06:26

 gvillani@MACB134  ~/Desktop/Script/Cloudformation/now-project/cloudformation                                                           ✔  3768  12:09:06
 gvillani@MACB134  ~/Desktop/Script/Cloudformation/now-project/cloudformation                                                           ✔  3768  12:09:06
 gvillani@MACB134  ~/Desktop/Script/Cloudformation/now-project/cloudformation  cd ..                                                    ✔  3768  12:09:06
 gvillani@MACB134  ~/Desktop/Script/Cloudformation/now-project  aws cloudformation deploy \
    --stack-name Now \
    --template-file ./cloudformation/ecs-webapp-stack.yml \
    --capabilities CAPABILITY_IAM \
    --parameter-overrides KeyName='Test' \
    VpcId='vpc-02746cac2e96a0327' \
    SubnetId='subnet-0f612a3f0c2116837,subnet-0a5adad88f2cd06a5' \
    ContainerPort=80 \
    DesiredCapacity=2 \
    EcsImageUri='855734459294.dkr.ecr.eu-west-1.amazonaws.com/now-time' \
    EcsImageVersion='latest' \
    InstanceType=t2.micro \
    MaxSize=2

Waiting for changeset to be created..
Waiting for stack create/update to complete
Successfully created/updated stack - Now
 gvillani@MACB134  ~/Desktop/Script/Cloudformation/now-project  cd -
~/Desktop/Script/Cloudformation/now-project/cloudformation
 gvillani@MACB134  ~/Desktop/Script/Cloudformation/now-project/cloudformation                                                           ✔  3771  12:57:03
 gvillani@MACB134  ~/Desktop/Script/Cloudformation/now-project/cloudformation  cd -                                                     ✔  3771  12:57:07
~/Desktop/Script/Cloudformation/now-project
 gvillani@MACB134  ~/Desktop/Script/Cloudformation/now-project  cd ../../../../Downloads
 gvillani@MACB134  ~/Downloads  ssh -i Test.pem ec2-user@54.194.79.141

^C
 gvillani@MACB134  ~/Downloads                                                                                                               INT(-2) ↵  3773  12:58:18
 gvillani@MACB134  ~/Downloads                                                                                                               INT(-2) ↵  3773  12:58:21
 gvillani@MACB134  ~/Downloads  ssh -i "Test.pem" root@ec2-54-194-79-141.eu-west-1.compute.amazonaws.com                                     INT(-2) ↵  3773  12:58:21
^C
 gvillani@MACB134  ~/Downloads  ssh -vvv -i "Test.pem" ec2-user@ec2-54-194-79-141.eu-west-1.compute.amazonaws.com                            INT(-2) ↵  3774  12:58:28
OpenSSH_7.6p1, LibreSSL 2.6.2
debug1: Reading configuration data /etc/ssh/ssh_config
debug1: /etc/ssh/ssh_config line 48: Applying options for *
debug2: ssh_connect_direct: needpriv 0
debug1: Connecting to ec2-54-194-79-141.eu-west-1.compute.amazonaws.com port 22.
^C
 gvillani@MACB134  ~/Downloads                                                                                                               INT(-2) ↵  3775  12:59:46
 gvillani@MACB134  ~/Downloads                                                                                                               INT(-2) ↵  3775  12:59:48
 gvillani@MACB134  ~/Downloads                                                                                                               INT(-2) ↵  3775  12:59:48
 gvillani@MACB134  ~/Downloads  ssh -vvv -i "Test.pem" ec2-user@34.254.202.111                                                               INT(-2) ↵  3775  12:59:48
OpenSSH_7.6p1, LibreSSL 2.6.2
debug1: Reading configuration data /etc/ssh/ssh_config
debug1: /etc/ssh/ssh_config line 48: Applying options for *
debug2: ssh_connect_direct: needpriv 0
debug1: Connecting to 34.254.202.111 port 22.
^C
 gvillani@MACB134  ~/Downloads  ssh -vvv -i "Test.pem" ec2-user@34.244.39.120
OpenSSH_7.6p1, LibreSSL 2.6.2
debug1: Reading configuration data /etc/ssh/ssh_config
debug1: /etc/ssh/ssh_config line 48: Applying options for *
debug2: ssh_connect_direct: needpriv 0
debug1: Connecting to 34.244.39.120 port 22.
debug1: Connection established.
debug1: key_load_public: No such file or directory
debug1: identity file Test.pem type -1
debug1: key_load_public: No such file or directory
debug1: identity file Test.pem-cert type -1
debug1: Local version string SSH-2.0-OpenSSH_7.6
debug1: Remote protocol version 2.0, remote software version OpenSSH_7.4
debug1: match: OpenSSH_7.4 pat OpenSSH* compat 0x04000000
debug3: fd 5 is O_NONBLOCK
debug1: Authenticating to 34.244.39.120:22 as 'ec2-user'
debug3: hostkeys_foreach: reading file "/Users/gvillani/.ssh/known_hosts"
debug3: send packet: type 20
debug1: SSH2_MSG_KEXINIT sent
debug3: receive packet: type 20
debug1: SSH2_MSG_KEXINIT received
debug2: local client KEXINIT proposal
debug2: KEX algorithms: curve25519-sha256,curve25519-sha256@libssh.org,ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group-exchange-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512,diffie-hellman-group-exchange-sha1,diffie-hellman-group14-sha256,diffie-hellman-group14-sha1,ext-info-c
debug2: host key algorithms: ecdsa-sha2-nistp256-cert-v01@openssh.com,ecdsa-sha2-nistp384-cert-v01@openssh.com,ecdsa-sha2-nistp521-cert-v01@openssh.com,ssh-ed25519-cert-v01@openssh.com,ssh-rsa-cert-v01@openssh.com,ecdsa-sha2-nistp256,ecdsa-sha2-nistp384,ecdsa-sha2-nistp521,ssh-ed25519,rsa-sha2-512,rsa-sha2-256,ssh-rsa
debug2: ciphers ctos: chacha20-poly1305@openssh.com,aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@openssh.com,aes256-gcm@openssh.com
debug2: ciphers stoc: chacha20-poly1305@openssh.com,aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@openssh.com,aes256-gcm@openssh.com
debug2: MACs ctos: umac-64-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-sha1-etm@openssh.com,umac-64@openssh.com,umac-128@openssh.com,hmac-sha2-256,hmac-sha2-512,hmac-sha1
debug2: MACs stoc: umac-64-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-sha1-etm@openssh.com,umac-64@openssh.com,umac-128@openssh.com,hmac-sha2-256,hmac-sha2-512,hmac-sha1
debug2: compression ctos: none,zlib@openssh.com,zlib
debug2: compression stoc: none,zlib@openssh.com,zlib
debug2: languages ctos:
debug2: languages stoc:
debug2: first_kex_follows 0
debug2: reserved 0
debug2: peer server KEXINIT proposal
debug2: KEX algorithms: curve25519-sha256,curve25519-sha256@libssh.org,ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group-exchange-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512,diffie-hellman-group-exchange-sha1,diffie-hellman-group14-sha256,diffie-hellman-group14-sha1,diffie-hellman-group1-sha1
debug2: host key algorithms: ssh-rsa,rsa-sha2-512,rsa-sha2-256,ecdsa-sha2-nistp256,ssh-ed25519
debug2: ciphers ctos: chacha20-poly1305@openssh.com,aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@openssh.com,aes256-gcm@openssh.com,aes128-cbc,aes192-cbc,aes256-cbc,blowfish-cbc,cast128-cbc,3des-cbc
debug2: ciphers stoc: chacha20-poly1305@openssh.com,aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@openssh.com,aes256-gcm@openssh.com,aes128-cbc,aes192-cbc,aes256-cbc,blowfish-cbc,cast128-cbc,3des-cbc
debug2: MACs ctos: umac-64-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-sha1-etm@openssh.com,umac-64@openssh.com,umac-128@openssh.com,hmac-sha2-256,hmac-sha2-512,hmac-sha1
debug2: MACs stoc: umac-64-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-sha1-etm@openssh.com,umac-64@openssh.com,umac-128@openssh.com,hmac-sha2-256,hmac-sha2-512,hmac-sha1
debug2: compression ctos: none,zlib@openssh.com
debug2: compression stoc: none,zlib@openssh.com
debug2: languages ctos:
debug2: languages stoc:
debug2: first_kex_follows 0
debug2: reserved 0
debug1: kex: algorithm: curve25519-sha256
debug1: kex: host key algorithm: ecdsa-sha2-nistp256
debug1: kex: server->client cipher: chacha20-poly1305@openssh.com MAC: <implicit> compression: none
debug1: kex: client->server cipher: chacha20-poly1305@openssh.com MAC: <implicit> compression: none
debug3: send packet: type 30
debug1: expecting SSH2_MSG_KEX_ECDH_REPLY
debug3: receive packet: type 31
debug1: Server host key: ecdsa-sha2-nistp256 SHA256:bVzQOE0uBzMwlAXirRNGEjTOKbUzEcOis5R+t8/N2Vc
debug3: hostkeys_foreach: reading file "/Users/gvillani/.ssh/known_hosts"
The authenticity of host '34.244.39.120 (34.244.39.120)' can't be established.
ECDSA key fingerprint is SHA256:bVzQOE0uBzMwlAXirRNGEjTOKbUzEcOis5R+t8/N2Vc.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '34.244.39.120' (ECDSA) to the list of known hosts.
debug3: send packet: type 21
debug2: set_newkeys: mode 1
debug1: rekey after 134217728 blocks
debug1: SSH2_MSG_NEWKEYS sent
debug1: expecting SSH2_MSG_NEWKEYS
debug3: receive packet: type 21
debug1: SSH2_MSG_NEWKEYS received
debug2: set_newkeys: mode 0
debug1: rekey after 134217728 blocks
debug2: key: test-dashboard-lucky.pem (0x7f97fc7017e0), agent
debug2: key: Test.pem (0x0), explicit
debug3: send packet: type 5
debug3: receive packet: type 7
debug1: SSH2_MSG_EXT_INFO received
debug1: kex_input_ext_info: server-sig-algs=<rsa-sha2-256,rsa-sha2-512>
debug3: receive packet: type 6
debug2: service_accept: ssh-userauth
debug1: SSH2_MSG_SERVICE_ACCEPT received
debug3: send packet: type 50
debug3: receive packet: type 51
debug1: Authentications that can continue: publickey
debug3: start over, passed a different list publickey
debug3: preferred publickey,keyboard-interactive,password
debug3: authmethod_lookup publickey
debug3: remaining preferred: keyboard-interactive,password
debug3: authmethod_is_enabled publickey
debug1: Next authentication method: publickey
debug1: Offering public key: RSA SHA256:nUD1ArLQ10UWvJcISHP14YLZu/+Cnw5AREzzHWc/uaY test-dashboard-lucky.pem
debug3: send_pubkey_test
debug3: send packet: type 50
debug2: we sent a publickey packet, wait for reply
debug3: receive packet: type 51
debug1: Authentications that can continue: publickey
debug1: Trying private key: Test.pem
debug3: sign_and_send_pubkey: RSA SHA256:JkKVd4TrVi7mu+2og8kEAUknPtLOFY2XcuZ3QVEQJDg
debug3: send packet: type 50
debug2: we sent a publickey packet, wait for reply
debug3: receive packet: type 52
debug1: Authentication succeeded (publickey).
Authenticated to 34.244.39.120 ([34.244.39.120]:22).
debug1: channel 0: new [client-session]
debug3: ssh_session2_open: channel_new: 0
debug2: channel 0: send open
debug3: send packet: type 90
debug1: Requesting no-more-sessions@openssh.com
debug3: send packet: type 80
debug1: Entering interactive session.
debug1: pledge: network
debug3: receive packet: type 80
debug1: client_input_global_request: rtype hostkeys-00@openssh.com want_reply 0
debug3: receive packet: type 91
debug2: channel_input_open_confirmation: channel 0: callback start
debug2: fd 5 setting TCP_NODELAY
debug3: ssh_packet_set_tos: set IP_TOS 0x10
debug2: client_session2_setup: id 0
debug2: channel 0: request pty-req confirm 1
debug3: send packet: type 98
debug1: Sending environment.
debug3: Ignored env TERM_SESSION_ID
debug3: Ignored env SSH_AUTH_SOCK
debug3: Ignored env Apple_PubSub_Socket_Render
debug3: Ignored env COLORFGBG
debug3: Ignored env ITERM_PROFILE
debug3: Ignored env XPC_FLAGS
debug3: Ignored env PWD
debug3: Ignored env SHELL
debug3: Ignored env SECURITYSESSIONID
debug1: Sending env LC_CTYPE = en_US.UTF-8
debug2: channel 0: request env confirm 0
debug3: send packet: type 98
debug3: Ignored env TERM_PROGRAM_VERSION
debug3: Ignored env TERM_PROGRAM
debug3: Ignored env PATH
debug3: Ignored env COLORTERM
debug3: Ignored env COMMAND_MODE
debug3: Ignored env TERM
debug3: Ignored env HOME
debug3: Ignored env TMPDIR
debug3: Ignored env USER
debug3: Ignored env XPC_SERVICE_NAME
debug3: Ignored env LOGNAME
debug3: Ignored env __CF_USER_TEXT_ENCODING
debug3: Ignored env ITERM_SESSION_ID
debug3: Ignored env SHLVL
debug3: Ignored env OLDPWD
debug3: Ignored env ZSH
debug3: Ignored env PAGER
debug3: Ignored env LESS
debug3: Ignored env LSCOLORS
debug3: Ignored env _
debug2: channel 0: request shell confirm 1
debug3: send packet: type 98
debug2: channel_input_open_confirmation: channel 0: callback done
debug2: channel 0: open confirm rwindow 0 rmax 32768
debug3: receive packet: type 99
debug2: channel_input_status_confirm: type 99 id 0
debug2: PTY allocation request accepted on channel 0
debug2: channel 0: rcvd adjust 2097152
debug3: receive packet: type 99
debug2: channel_input_status_confirm: type 99 id 0
debug2: shell request accepted on channel 0

   __|  __|  __|
   _|  (   \__ \   Amazon ECS-Optimized Amazon Linux AMI 2017.09.l
 ____|\___|____/

For documentation, visit http://aws.amazon.com/documentation/ecs
14 package(s) needed for security, out of 26 available
Run "sudo yum update" to apply all updates.
Amazon Linux version 2018.03 is available.
[ec2-user@ip-172-31-8-39 ~]$
[ec2-user@ip-172-31-8-39 ~]$
[ec2-user@ip-172-31-8-39 ~]$ sudo su -
[root@ip-172-31-8-39 ~]# ll
total 4
-rw-r--r-- 1 root root 3404 Oct 19 10:10 healthcheck.sh
[root@ip-172-31-8-39 ~]# chmod u+x healthcheck.sh

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
:47
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

if [ $DOCKER_CMD == healthy ]
  then
  echo "Container is healthy"
  else
  echo "Container is unhealthy"

:67
run=`ps -ef |grep -v grep |grep -c ntpd`
if [ $run -eq 0 ] || [ $run -gt 1 ]
        then
        echo "NTP is down or there are 2 instances" >> /var/log/ntp.log
        ERRCNT=$(expr $ERRCNT + 1)
fi

# check if the runlevel is ok , if it is not correct I increase the counter and I log the error

runlvl=$(/sbin/chkconfig --list ntpd | grep '3:on' | grep -c '5:on')
runlvlv=$(/sbin/chkconfig --list ntpd)
if [ $runlvl -eq 0 ]
        then
        echo "RUNLEVEL NTPD are off" >> /var/log/ntp.log
        echo "$runlvlv" >> /var/log/ntp.log
        echo "" >> /var/log/ntp.log
        ERRCNT=$(expr $ERRCNT + 1)
fi

# check if the NTP server is available, if it is not correct I increase the counter and I log the error

/usr/sbin/ntpdate -q $NTP > /var/log/ntpdate.log
:124
        fi
[root@ip-172-31-8-39 ~]#
[root@ip-172-31-8-39 ~]# ./healthcheck.sh
./healthcheck.sh: line 33: cd: /var/script: No such file or directory
./healthcheck.sh: line 47: [: ==: unary operator expected
Container is unhealthy
./healthcheck.sh: line 66: unexpected EOF while looking for matching ``'
./healthcheck.sh: line 124: syntax error: unexpected end of file
[root@ip-172-31-8-39 ~]#
[root@ip-172-31-8-39 ~]#
[root@ip-172-31-8-39 ~]#
[root@ip-172-31-8-39 ~]#
[root@ip-172-31-8-39 ~]# docker ps
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
debug2: client_check_window_change: changed
debug2: channel 0: request window-change confirm 0int $11}'| cut -d ')' -f 1 - | cut -d '(' -f 2 -)
debug3: send packet: type 98
# Leave them as they are
HOST=$(hostname)
SUBJECT="$HOST - problems with NTP"

# We initialize variables
"healthcheck.sh" 123L, 3398C
CONTAINER ID        IMAGE                                                          COMMAND             CREATED             STATUS                       PORTS                   NAMES
dd89b70c624e        855734459294.dkr.ecr.eu-west-1.amazonaws.com/now-time:latest   "npm start"         About an hour ago   Up About an hour (healthy)   0.0.0.0:32768->80/tcp   ecs-Now-taskdef-10-Now-task-f6c29698bdd386a01b00
ef28b8914587        amazon/amazon-ecs-agent:latest                                 "/agent"            About an hour ago   Up About an hour                                     ecs-agent
[root@ip-172-31-8-39 ~]# vim healthcheck.sh
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
DOCKER_CMD=$(docker ps |grep "(healthy)" |awk '{print $13}'| cut -d ')' -f 1 - | cut -d '(' -f 2 -)

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

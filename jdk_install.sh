#!/bin/bash
# JAVA JDK 1.8 install scripts

yum -y list java*
yum -y install java-1.8.0-openjdk*
java -version

echo
echo "-------------------------------------------------------------"
echo "JAVA JDK 1.8 INSTALL FINISH! :D"
echo "SET JAVA CLASSPATH"
echo "-------------------------------------------------------------"
echo "export JAVA_HOME=/usr/lib/jvm/java"
echo "export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar"
echo "export PATH=$PATH:$JAVA_HOME/bin"
echo "export PATH=$PATH:/usr/local/php/bin"
echo "source /etc/profile"
echo "echo $PATH"
#######################
#    Install Java     #
#######################
yum install java-1.7.0-openjdk*

# Edit ~/.bashrc
echo "export JAVA_HOME=/usr/lib/jvm/jre-1.7.0-openjdk.x86_64/" >> ~/.bashrc
echo "export PATH=\$PATH:\$JAVA_HOME" >> ~/.bashrc
echo "export HADOOP_INSTALL=/usr/local/hadoop" >> ~/.bashrc
echo "export HADOOP_MAPRED_HOME=\$HADOOP_INSTALL" >> ~/.bashrc
echo "export HADOOP_COMMON_HOME=\$HADOOP_INSTALL" >> ~/.bashrc
echo "export HADOOP_HDFS_HOME=\$HADOOP_INSTALL" >> ~/.bashrc
echo "export YARN_HOME=\$HADOOP_INSTALL" >> ~/.bashrc
echo "export HADOOP_COMMON_LIB_NATIVE_DIR=\$HADOOP_INSTALL/lib/native" >> ~/.bashrc
echo "export PATH=\$PATH:\$HADOOP_INSTALL/sbin" >> ~/.bashrc
echo "export PATH=\$PATH:\$HADOOP_INSTALL/bin" >> ~/.bashrc
# Apply variables in ~/.bashrc
source ~/.bashrc

#######################
#    Install Hadoop   #
#######################
curl -O http://apache.spinellicreations.com/hadoop/common/hadoop-2.2.0/hadoop-2.2.0.tar.gz
tar -xzvf hadoop-2.2.0.tar.gz
sudo mv hadoop-2.2.0 /usr/local/hadoop

# Create namenode and datanode folders
mkdir -p ~/hadoopspace/hdfs/namenode
mkdir -p ~/hadoopspace/hdfs/datanode

#######################
#   Configure Hadoop  #
#######################
#Backup and Replace all config files

#mapred-site.xml
#yes | cp /usr/local/hadoop/etc/hadoop/mapred-site.xml mapred-site.xml-orig
yes | mv mapred-site.xml /usr/local/hadoop/etc/hadoop/mapred-site.xml

#yarn-site.xml
yes | cp /usr/local/hadoop/etc/hadoop/yarn-site.xml yarn-site.xml-orig
yes | mv yarn-site.xml /usr/local/hadoop/etc/hadoop/yarn-site.xml

#core-site.xml
yes | cp /usr/local/hadoop/etc/hadoop/core-site.xml core-site.xml-orig
yes | mv core-site.xml /usr/local/hadoop/etc/hadoop/core-site.xml

#hdfs-site.xml
yes | cp /usr/local/hadoop/etc/hadoop/hdfs-site.xml hdfs-site.xml-orig
yes | mv hdfs-site.xml /usr/local/hadoop/etc/hadoop/hdfs-site.xml

#hadoop-env.sh
yes | cp /usr/local/hadoop/etc/hadoop/hadoop-env.sh hadoop-env.sh-orig
yes | mv hadoop-env.sh /usr/local/hadoop/etc/hadoop/hadoop-env.sh

#######################
#    Start Hadoop     #
#######################
hdfs namenode -format
start-dfs.sh
start-yarn.sh

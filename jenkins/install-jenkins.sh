#
# [ INSTALL JAVA ]
#

apt update
apt install openjdk-17-jdk -y

#
# [ INSTALL JENKINS ]
#

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
apt update
apt install jenkins -y

#
# [ INSTALL DOCKER ]
#

curl -fsSL https://get.docker.com | sh
usermod -aG docker jenkins
systemctl restart jenkins
systemctl status jenkins

#
# [ INSTALL KUBECTL ]
#

apt update
apt install ca-certificates curl -y
apt install apt-transport-https -y
curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
apt update
apt install kubectl -y

#
# [ GET ADMIN PASSWORD ]
#

cat /var/lib/jenkins/secrets/initialAdminPassword
# ベースイメージとして公式のjenkinsイメージを使用
FROM jenkins/jenkins

# プラグインをインストールするための新しい方法
USER root
RUN curl -L https://github.com/jenkinsci/plugin-installation-manager-tool/releases/download/2.9.3/jenkins-plugin-manager-2.9.3.jar -o /opt/jenkins-plugin-manager.jar

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN java -jar /opt/jenkins-plugin-manager.jar --war /usr/share/jenkins/jenkins.war --plugin-file /usr/share/jenkins/ref/plugins.txt

USER jenkins

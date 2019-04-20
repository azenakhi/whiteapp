pipeline {
   agent any
   stages {
      stage('build') {
         steps {
            script {
               server = Artifactory.newServer url: 'https://registry.localhost', credentialsId: 'arti-creds'
               rtDocker = Artifactory.docker server: server
          
               buildInfo = rtDocker.push 'registry.local/whiteapp:latest', 'app-docker-staging'
               server.publishBuildInfo buildInfo
            }
         }
      }
   }
}

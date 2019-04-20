pipeline {
   agent any
   stages {
      stage('build') {
         steps {
            script {
               server = Artifactory.newServer url: 'https://registry.localhost', credentialsId: 'arti-creds'
               rtDocker = Artifactory.docker server: server
               echo rtDocker
               buildInfo = Artifactory.newBuildInfo()
               echo "${buildInfo.number}"
               echo "${buildInfo.name}"
            }
         }
      }
   }
}

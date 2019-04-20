pipeline {
   agent any
   stages {
      stage('build') {
         steps {
            script {
               server = Artifactory.newServer url: 'https://registry.localhost', credentialsId: 'arti-creds'
               rtDocker = Artifactory.docker username: 'admin', password: 'admin123'
               echo rtDocker
               buildInfo = Artifactory.newBuildInfo()
               echo "${buildInfo.number}"
               echo "${buildInfo.name}"
            }
         }
      }
   }
}

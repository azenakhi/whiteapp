pipeline {
   agent any
   stages {
      stage('build') {
         steps {
            script {
               server = Artifactory.newServer url: 'https://registry.localhost', credentials: 'arti-creds'
               buildInfo = Artifactory.newBuildInfo()
               echo ${buildInfo}
            }
         }
      }
   }
}

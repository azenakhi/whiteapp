pipeline {
   agent any
   stages {
      stage('build') {
         steps {
            script {
               server = Artifactory.newServer url: 'https://registry.localhost', credentialsId: 'arti-creds'
               buildInfo = Artifactory.newBuildInfo()
               echo "${buildInfo.build.number}"
               echo "${buildInfo.build.name}"
            }
         }
      }
   }
}

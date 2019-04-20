pipeline {
   agent any
   stages {
      stage('build') {
         steps {
            sh 'docker login -u admin -padmin123 https://docker-remote.registry.localhost'
         }
      }
   }
}

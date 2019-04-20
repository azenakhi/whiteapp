pipeline {
   agent any
   stages {
      stage('build') {
         steps {
            sh 'curl -Iv http://artifactory:8081'
            sh 'docker images'
         }
      }
   }
}

pipeline {
   agent any
   stages {
      stage('build1') {
         steps {
            script {
                docker.withRegistry('https://app-docker-staging.registry.localhost', 'arti-creds') {
                    image = docker.build("whiteapp:${env.BUILD_ID}")
                    image.push()
                } 
            }
         }
      }
      stage('build') {
         steps {
            script {
               server = Artifactory.newServer url: 'https://registry.localhost', credentialsId: 'arti-creds'
               rtDocker = Artifactory.docker server: server
               buildInfo = Artifactory.newBuildInfo()
          
               //buildInfo = rtDocker.push 'app-docker-staging.registry.localhost/whiteapp:latest', 'app-docker-staging'
               server.publishBuildInfo buildInfo
            }
         }
      }
   }
}

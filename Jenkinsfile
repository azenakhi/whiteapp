pipeline {
   agent any
   stages {
      stage('build') {
         steps {
            script {
               server = Artifactory.newServer url: 'https://registry.localhost', credentialsId: 'arti-creds'
               rtDocker = Artifactory.docker server: server
          
               buildInfo = rtDocker.push 'app-docker-staging.registry.localhost/whiteapp:latest', 'app-docker-staging'
               echo "${buildInfo}"
            }
         }
      }
      stage('Promote') {
         steps {
            script {
               def promotionConfig = [
                   // Mandatory parameters
                   'buildName'          : buildInfo.name,
                   'buildNumber'        : buildInfo.number,
                   'targetRepo'         : 'app-docker-stable',

                   // Optional parameters
                   'comment'            : 'this is the promotion comment',
                   'sourceRepo'         : 'app-docker-staging',
                   'status'             : 'Released',
                   'includeDependencies': true,
                   'copy'               : true
               ]

               // Promote build
               server.promote promotionConfig
            }
         }
      }
   }
}

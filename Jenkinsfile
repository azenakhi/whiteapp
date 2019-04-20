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
               server = Artifactory.server 'arti'
               rtDocker = Artifactory.docker server: server
               buildInfo = rtDocker.push 'app-docker-staging.registry.localhost/whiteapp:latest', 'app-docker-staging'
               server.publishBuildInfo buildInfo
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

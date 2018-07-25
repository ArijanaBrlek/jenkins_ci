node('master') {
    ws("/var/jenkins_home/workspace/testing_jenkinsfile")
    {
        stage('Lint'){
            docker.image('jenkins_build_image').inside('-u root'){
              sh "pylint --rcfile=/home/testing/.pylintrc --output-format=parseable /home/testing/hello_world > pylint.log || exit 0"
              sh 'cat pylint.log'

              step([
                $class: 'WarningsPublisher',
                parserConfigurations: [[
                  parserName: 'PYLint',
                  pattern   : 'pylint.log'
                ]],
                unstableTotalAll: '0',
                usePreviousBuildAsReference: true
              ])
            }
        }

         stage('Build'){
            docker.image('jenkins_build_image').inside('-u root'){
              echo 'Build.'
            }
        }
    }
}
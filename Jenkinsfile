node('master') {
    ws("/var/jenkins_home/workspace/testing_jenkinsfile")
    {
        stage('Git checkout') {
            checkout([
                    $class: 'GitSCM',
                    branches: scm.branches,
                    doGenerateSubmoduleConfigurations: false,
                    extensions: [[
                    $class: 'CloneOption',
                    noTags: false,
                    shallow: false,
                    depth: 0,
                    reference: ''
                ]],
                userRemoteConfigs: scm.userRemoteConfigs,
            ])
        }

        stage('Lint') {
            docker.image('jenkins_build_image').inside('-u root'){
              sh "pylint --rcfile=.pylintrc --output-format=parseable hello_world > pylint.log || exit 0"
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
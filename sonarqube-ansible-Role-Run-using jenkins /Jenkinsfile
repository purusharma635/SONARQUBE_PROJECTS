@Library('jenkins-shared-lib') _

pipeline {
    agent any

    stages {
        stage('Deploy SonarQube') {
            steps {
                script {
                    def config = readYaml text: libraryResource('sonarqube-config.yml')
                    sonarqubeDeploy(config)
                }
            }
        }
    }
}

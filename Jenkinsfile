pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
					dockerapp = docker.build("izakdvlpr/kubenews:${env.BUILD_ID}", '-f ./web/Dockerfile ./web')
				}
            }
        }
		
		stage('Push Docker Image') {
			steps {
				script {
					docker.withRegistry('https://registry.hub.docker.com', 'dockerhub')
				}
			}
		}
    }
}
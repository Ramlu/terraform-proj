pipeline {
    agent any

    stages {
        stage('CleanWS') {
            steps {
                cleanWs()
            }
        }
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Ramlu/terraform-proj.git', branch: 'main'
            }
        }

    }

    post {
        always {
            // This will always run after the pipeline ends (successful or failed)
            echo 'Hello how are you, super'
        }
        success {
            // Run this block if the pipeline succeeded
           emailext(
                to: 'naveenramlu@gmail.com',
                subject: 'Build Success: ${currentBuild.fullDisplayName}',
                body: '''\
Hello,

The build for ${JOB_NAME} with build number ${BUILD_NUMBER} was successful!

Here are the details:
- Job: ${JOB_NAME}
- Build Number: ${BUILD_NUMBER}
- Build URL: ${BUILD_URL}

Best Regards,
Jenkins
'''
)
        }
        failure {
            // Run this block if the pipeline failed
            echo 'Terraform Plan Failed.'
        }
    }
}

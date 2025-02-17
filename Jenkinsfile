pipeline {
    agent any

    environment {
        TF_VERSION = '1.4.0'  // Specify the version of Terraform you want to use
        AWS_REGION = 'us-east-1'  // Specify your AWS region
    }

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
            echo 'Terraform Plan Successful!'
        }
        failure {
            // Run this block if the pipeline failed
            echo 'Terraform Plan Failed.'
        }
    }
}

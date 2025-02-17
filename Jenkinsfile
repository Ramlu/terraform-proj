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

        stage('Terraform Init') {
            steps {
                script {
                    // Initialize Terraform working directory
                    sh 'terraform init'
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                script {
                    // Run Terraform Plan to check the execution plan
                    sh 'terraform plan -out=tfplan'
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                script {
                    // Apply the Terraform plan to make the changes
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }

    }

    post {
        success {
            // Run this block if the pipeline succeeded
          mail to: 'naveenramlu@gmail.com',
     subject: "Build Success: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
     body: """\
Hello,

The build for ${env.JOB_NAME} with build number ${env.BUILD_NUMBER} was successful!

Here are the details:
- Job: ${env.JOB_NAME}
- Build Number: ${env.BUILD_NUMBER}
- Build URL: ${env.BUILD_URL}

Best Regards,
Jenkins
"""

        }
        failure {
            // Run this block if the pipeline failed
            echo 'Terraform Plan Failed.'
        }
    }
}

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

        stage('Terraform Init') {
            steps {
                script {
                    // Run 'terraform init' to initialize the working directory containing Terraform configuration files
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Format') {
            steps {
                script {
                    // Run 'terraform fmt' to format Terraform code (optional but recommended)
                    sh 'terraform fmt -check -diff'  // -check will only check if formatting is correct, -diff shows the differences
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    // Run 'terraform plan' to create an execution plan
                    sh 'terraform plan -out=tfplan'  // Generate the plan and output to a file 'tfplan'
                }
            }
        }
    }

    post {
        always {
            // This will always run after the pipeline ends (successful or failed)
            echo 'Terraform Pipeline Finished.'
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

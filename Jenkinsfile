pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
        stage('Helm Install/Upgrade') {
            steps {
                dir('helm/jenkins') {
                    sh 'helm upgrade --install jenkins . --values values.yaml'
                }
            }
        }
        stage('Run Ansible Playbooks') {
            steps {
                dir('ansible') {
                    sh 'ansible-playbook -i inventory/hosts.ini playbooks/setup-development-environment.yml'
                }
            }
        }
    }
}
    
//     post {
//         always {
//             // Actions that should always happen, such as cleaning up or archiving logs
//             echo 'Cleaning up...'
//             // Example: cleanWs() // Uncomment if you want to clean the workspace
//         }
//         success {
//             echo 'Pipeline completed successfully.'
//         }
//         failure {
//             echo 'Pipeline failed. Review the logs for details.'
//         }
//     }
// }

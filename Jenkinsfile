pipeline {
  agent any

  stages {
    stage('Terraform Init') {
      steps {
        dir('terraform') {
          bat 'terraform init'
        }
      }
    }

    stage('Terraform Plan') {
      steps {
        dir('terraform') {
          bat 'terraform plan -out=tfplan'
        }
      }
    }

    stage('Terraform Apply') {
      when {
        expression {
          currentBuild.result == null || currentBuild.result == 'SUCCESS'
        }
      }
      steps {
        dir('terraform') {
          bat 'terraform apply -auto-approve tfplan'
        }
      }
    }
  }
}

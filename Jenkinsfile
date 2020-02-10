pipeline{
    agent any
    stages{
        stage('build'){
            steps{
                script{
                    echo "WORKSPACE: ${env.WORKSPACE}"
                    echo "NODE_NAME: ${env.NODE_NAME}"
                    if ("${env.NODE_NAME}" == "master"){
                       sh "sh build-prod.sh"
                    }
                }
            }
        }
    }
}
pipeline{
    agent any
    stages{
        stage('build'){
            agent{
                docker{
                    image 'maven:3.6.3-jdk-8'
                    args '-v /usr/local/apache-maven-3.6.3/conf/settings.xml:/root/.m2/settings.xml --entrypoint='
                }
            }
            steps{
                script{
                    echo "mvn --version"
                    //echo "WORKSPACE: ${env.WORKSPACE}"
                    //echo "NODE_NAME: ${env.NODE_NAME}"
                    //if ("${env.NODE_NAME}" == "master"){
                    //   sh "sh build-prod.sh"
                    //}
                }
            }
        }
    }
}
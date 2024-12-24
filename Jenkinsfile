pipeline{
    agent any
    tools { //设置使用jdk和maven环境
        jdk 'jdk-21'
        maven 'mvn-3.63'
    }
    stages{
        stage('build'){
            steps{
                script{
                    echo "WORKSPACE: ${env.WORKSPACE}"
                    echo "NODE_NAME: ${env.NODE_NAME}"
                    if ("${env.NODE_NAME}" == "built-in"){//旧版本主节点名称master，新版本主节点名称built-in
                       sh "sh build-prod.sh"
                    }
                }
            }
        }
    }
}

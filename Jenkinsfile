pipeline {
   agent any
   environment {
      IMAGE = "shop-admin:${tag}"
      REGISTRY_IMAGE = "${IMAGE}"
   }
   stages {
      stage('build') {
         steps {
            sh '''    # 构建镜像
                          docker build -f ${WORKSPACE}/Dockerfile . -t ${IMAGE}

                '''
         }
      }
   }
}

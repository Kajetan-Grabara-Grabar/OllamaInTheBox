podTemplate(yaml: """
apiVersion: v1
kind: Pod
metadata:
  labels:
    run: kaniko-build
  name: kaniko-build
spec:
  containers:
  - command:
    - /busybox/sh
    - -c
    - /busybox/sleep 99999
    image: gcr.io/kaniko-project/executor:debug
    name: kaniko

"""
    
) {

    node(POD_LABEL) {
        stage('Kanico') {
            // git url:'https://github.com/Kajetan-Grabara-Grabar/OllamaInTheBox.git', branch: 'dev'
            container('kaniko') {
                stage('Build image with Kanico') {
                    sh '/kaniko/executor --help'
                    sh 'ls -al'
                    sh 'pwd'
                }
            }
        }

    }
}
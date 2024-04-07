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
    properties([
        parameters([
            gitParameter(
                branch: '',
                branchFilter: 'origin/(.*)',
                defaultValue: 'main',
                description: '',
                name: 'BRANCH',
                quickFilterEnabled: false,
                selectedValue: 'NONE',
                sortMode: 'NONE',
                tagFilter: '*',
                type: 'PT_BRANCH'),
            booleanParam(
                defaultValue: false, 
                description: 'Do you want to push the image to the ECR', 
                name: 'PUSH'
            ),
            booleanParam(
                defaultValue: false, 
                description: 'Do you want to save the image as an artifact', 
                name: 'SAVE_ARTIFACTS'
            ),
            string(
                defaultValue: 'tinydolphin', 
                name: 'MODEL_NAME', 
                trim: true
            )
        ])
    ])
    node(POD_LABEL) {
        stage('Kanico') {
            git url:'https://github.com/Kajetan-Grabara-Grabar/OllamaInTheBox.git', branch: "$BRANCH"
            container('kaniko') {
                stage('Build image with Kanico') {
                    script {
                        sh "/kaniko/executor --dockerfile docker/Dockerfile --build-arg MODEL=${MODEL_NAME} --tar-path ${MODEL_NAME}-${BUILD_NUMBER}.tar --no-push --context docker"
                        sh "ls -al"
                        if ($MODEL_NAME){
                            archiveArtifacts artifacts: "${MODEL_NAME}-${BUILD_NUMBER}.tar", fingerprint: true
                        }
                    }
                }
            }
        }

    }
}
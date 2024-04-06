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
            gitParameter(branch: '',
                        branchFilter: 'origin/(.*)',
                        defaultValue: 'main',
                        description: '',
                        name: 'BRANCH',
                        quickFilterEnabled: false,
                        selectedValue: 'NONE',
                        sortMode: 'NONE',
                        tagFilter: '*',
                        type: 'PT_BRANCH')
        ])
    ])
    node(POD_LABEL) {
        stage('Kanico') {
            git url:'https://github.com/Kajetan-Grabara-Grabar/OllamaInTheBox.git', branch: "$BRANCH"
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
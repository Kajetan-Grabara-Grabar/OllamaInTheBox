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
    parameters {
    gitParameter(
      branch: '',
      branchFilter: ".*",
      defaultValue: "",
      description: '',
      listSize: '10',
      name: 'Version',
      quickFilterEnabled: false,
      selectedValue: 'NONE',
      sortMode: 'ASCENDING_SMART',
      tagFilter: "*",
      type: 'PT_BRANCH_TAG',
      useRepository: 'git@github.com:foo/bar.git')
   }
    node(POD_LABEL) {
        stage('Kanico') {
            git url:'https://github.com/Kajetan-Grabara-Grabar/OllamaInTheBox.git', branch: 'dev'
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
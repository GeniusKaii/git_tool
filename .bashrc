export JAVA_HOME="C:\Program Files\Java\jdk1.8.0_191"
export PYTHON_HOME="C:\Python37"
export PATH=${M2_HOME}/bin:${JAVA_HOME}/bin:${PYTHON_HOME}:.:${PATH}
alias gti='git'
alias more='less'
alias ll='ls -al'
alias mcp='mvn clean package'
alias mcpD='mvn clean package -DskipTests'
alias mci='mvn clean install'
alias mciD='mvn clean install -DskipTests'
alias mc='mvn clean'
alias dockerlogin='winpty docker login armdocker.rnd.ericsson.se'
alias python='winpty python'
alias python3='winpty python3'
source <(kubectl completion bash)
autoload -U promptinit; promptinit
prompt spaceshiplocal

sysType=$(uname -n)

if [ "$sysType" != "archbox" ]; then
    SPACESHIP_CHAR_COLOR_SUCCESS="yellow"
else
    #SPACESHIP_CHAR_COLOR_SUCCESS="green"
fi



SPACESHIP_PROMPT_ORDER=(
#user
#host

dir
git
jobs
exec_time
char
)


SPACESHIP_USER_SUFFIX="@"
SPACESHIP_USER_COLOR=green
SPACESHIP_HOST_PREFIX=""
SPACESHIP_HOST_COLOR=green
SPACESHIP_HOST_SUFFIX=""
SPACESHIP_DIR_PREFIX=":"


SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_CHAR_SYMBOL=❯
#SPACESHIP_DIR_SHOW=true
#SPACESHIP_DIR_COLOR=cyan
#SPACESHIP_DIR_COLOR=5f819d
SPACESHIP_DIR_COLOR=blue
SPACESHIP_DIR_LOCK_SYMBOL=" "
SPACESHIP_GIT_STATUS_SHOW=true
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_EXEC_TIME_PREFIX=""
SPACESHIP_EXEC_TIME_ELAPSED=2
SPACESHIP_JOBS_COLOR=red
SPACESHIP_JOBS_SYMBOL=" "
SPACESHIP_GIT_PREFIX=""
SPACESHIP_GIT_STATUS_DELETED=" "
SPACESHIP_GIT_STATUS_MODIFIED="  "
SPACESHIP_GIT_STATUS_UNTRACKED=" "
SPACESHIP_GIT_STATUS_ADDED=" "




#SPACESHIP_HG_SHOW=false
#SPACESHIP_PACKAGE_SHOW=false
#SPACESHIP_NODE_SHOW=false
#SPACESHIP_RUBY_SHOW=false
#SPACESHIP_ELM_SHOW=false
#SPACESHIP_ELIXIR_SHOW=false
#SPACESHIP_XCODE_SHOW_LOCAL=false
#SPACESHIP_SWIFT_SHOW_LOCAL=false
#SPACESHIP_GOLANG_SHOW=false
#SPACESHIP_PHP_SHOW=false
#SPACESHIP_RUST_SHOW=false
#SPACESHIP_JULIA_SHOW=false
#SPACESHIP_DOCKER_SHOW=false
#SPACESHIP_DOCKER_CONTEXT_SHOW=false
#SPACESHIP_AWS_SHOW=false
#SPACESHIP_CONDA_SHOW=false
#SPACESHIP_VENV_SHOW=false
#SPACESHIP_PYENV_SHOW=false
#SPACESHIP_DOTNET_SHOW=false
#SPACESHIP_EMBER_SHOW=false
#SPACESHIP_KUBECONTEXT_SHOW=false
#SPACESHIP_TERRAFORM_SHOW=false
#SPACESHIP_TERRAFORM_SHOW=false
#SPACESHIP_VI_MODE_SHOW=false
#SPACESHIP_JOBS_SHOW=false
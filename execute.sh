#!/bin/bash -x
readonly CONTENT_PATH="$HOME/reps/greymd/docker-zsh-completion"
readonly BRANCH_NAME="master"

cd "$CONTENT_PATH"

: "Get docker/docker" && {
    _path="docker/docker/master/contrib/completion/zsh/_docker"
    mkdir -p "$CONTENT_PATH/$(dirname ${_path})"
    curl -L "https://raw.githubusercontent.com/$_path" > "$CONTENT_PATH/$_path"
}

: "Get docker/compose" && {
    _path="docker/compose/master/contrib/completion/zsh/_docker-compose"
    mkdir -p "$CONTENT_PATH/$(dirname ${_path})"
    curl -L "https://raw.githubusercontent.com/$_path" > "$CONTENT_PATH/$_path"
}

git add -A
git commit -m "$(date +%Y%m%d)_auto_commit"
if [[ ${?} == 0 ]]; then
  # If the commit is succeeded, push it to github.
  git push origin $BRANCH_NAME
fi

exit 0
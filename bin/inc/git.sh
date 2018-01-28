# partially based on https://github.com/paulirish/git-open/blob/master/git-open

function _git-vars() {
    local remote=${1:-origin}

    GIT_ORIGIN=$(git remote get-url $remote 2>/dev/null | sed -n 's/\.git$//p')

    if [ -z "$GIT_ORIGIN" ]; then
        echo "Remote $remote not found" 1>&2
        return 2
    fi

    GIT_REPO="https://$(echo $GIT_ORIGIN | sed -n 's/^[^@]*@//p' | sed -n 's/:/\//p')"
    GIT_BRANCH=$(git status | sed -n 's/On branch //p')
}

# open specified commit in browser
function _git-open-commit() {
    local commit=$1
    local remote=$2

    local url

    _git-vars $remote

    [ -z "$GIT_ORIGIN" ] && return

    case "$GIT_ORIGIN" in
        *bitbucket\.org*)   url="$GIT_REPO/commits/$commit";     ;;
        *)                  url="$GIT_REPO/commit/$commit";      ;;
    esac;

    _browser $url
}

# open file#line in blob or blame view in browser
function _git-open-file() {
    local commit=$1
    local branch=$2
    local file=$3
    local line=$4
    local view=${5:-blob} # or blame

    local blob=${commit:-$branch}
    local fileonly="$(echo $file | sed -n 's:.*/::p')"

    local l_line
    local f_line
    local url

    if [ -n "$line" ]; then
        l_line="#L$line"
        f_line="#$fileonly-$line"
    fi

    _git-vars

    case "$GIT_ORIGIN" in
        *bitbucket\.org*)
            [[ "$view" == "blob"  ]] && view=src
            [[ "$view" == "blame" ]] && view=annotate
            url="$GIT_REPO/$view/$commit/$file$f_line";
            ;;
        *)
            url="$GIT_REPO/$view/$blob/$file$l_line";
            ;;
    esac;

    _browser $url
}

# open new github PR
# https://github.com/caarlos0/zsh-open-pr/blob/master/git-open-pr.sh
_get_repo() {
  echo "$1" | sed -e "s/.git$//" -e "s/.*github.com[:/]\(.*\)/\1/"
}

function _git-open-pr() {
  local upstream origin branch repo pr_url target url

  upstream="$(git config --get remote.upstream.url)"
  origin="$(git config --get remote.origin.url)"
  branch="$(git symbolic-ref --short HEAD)"
  repo="$(_get_repo "$origin")"
  pr_url="https://github.com/$repo/pull/new"
  target="$1"
  test -z "$target" && target=$(git for-each-ref --format='%(upstream:short)' "$(git symbolic-ref -q HEAD)" | cut -d '/' -f 2)
  test -z "$target" && target="master"

  if [ -z "$upstream" ]; then
    url="$pr_url/$target...$branch"
  else
    local origin_name upstream_name
    origin_name="$(echo "$repo" | cut -f1 -d'/')"
    upstream_name="$(_get_repo "$upstream" | cut -f1 -d'/')"
    url="$pr_url/$upstream_name:$target...$origin_name:$branch"
  fi

  _browser $url
}


# get current open browser command
function _browser() {
    [ -z "$1" ] && return

    case $( uname -s ) in
        Darwin)  open=open;;
        MINGW*)  open=start;;
        CYGWIN*) open=cygstart;;
        MSYS*)   open="powershell.exe –NoProfile Start";;
        *)       open=${BROWSER:-xdg-open};;
    esac

    # open it in a browser
    $open "$1" &> /dev/null
    #exit $?
}

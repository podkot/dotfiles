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

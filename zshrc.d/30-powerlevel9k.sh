# https://github.com/ryanoasis/nerd-fonts
# https://github.com/caskroom/homebrew-fonts/tree/master/Casks
# brew tap caskroom/fonts
# brew cask install font-firacode-nerd-font
POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vcs dir dir_writable status root_indicator) # newline
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(history command_execution_time time context)

#POWERLEVEL9K_SHOW_CHANGESET='true'
#git-untracked
POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-hook-detail-info git-aheadbehind git-stash git-remotebranch git-tagname)

if [ ! -z "$MC_SID" ]; then
    PROMPT="${PWD/#$HOME/~} "
    PROMPT+='%{'
    PROMPT+='%(!.#.$)'
    PROMPT+='%} '
fi

POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=3

POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='252'
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='035'
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND='252'
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND='160'
POWERLEVEL9K_CONTEXT_REMOTE_FOREGROUND='252'
POWERLEVEL9K_CONTEXT_REMOTE_BACKGROUND='202'

POWERLEVEL9K_VCS_CLEAN_FOREGROUND='252'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='025'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='252'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='092'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='252'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='088'

POWERLEVEL9K_DIR_HOME_FOREGROUND='252'
POWERLEVEL9K_DIR_HOME_BACKGROUND='240'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='252'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='240'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='252'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='240'

POWERLEVEL9K_TIME_FOREGROUND='252'
POWERLEVEL9K_TIME_BACKGROUND='240'

POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='252'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='055'


# https://github.com/yonchu/zsh-vcs-prompt/blob/master/lib/vcsstatus.sh
function +vi-git-hook-detail-info() {
    local git_status
    git_status=$(_zsh_vcs_prompt_get_git_status "$hook_com[branch]")
    hook_com[misc]+=$git_status
    return 0
}

# $1 : Branch name.
function _zsh_vcs_prompt_get_git_status() {
    local branch_name=$1

    local staged=0
    local conflicts=0
    local unstaged=0
    local untracked=0
    local clean

    local staged_files
    local unstaged_files
    local untracked_files
    local is_inside_work_tree

    if [ "$(command git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
        is_inside_work_tree='true'
        staged_files=$(command git diff --staged --name-status)
        if [ $? -ne 0 ]; then
            # Error occurs on old version git.
            staged_files=$(command git status --short --porcelain | command grep '^[UMADRC]')
        fi
        unstaged_files=$(command git diff --name-status)
        untracked_files=$(command git ls-files --others --exclude-standard "$(command git rev-parse --show-toplevel)")
        if [ $? -ne 0 ]; then
            # Error occurs on old version git.
            untracked_files=$(cd "$1" > /dev/null && command git ls-files --others --exclude-standard)
        fi
    else
        clean='?'
    fi

    # Count staged and conflicts files.
    if [ -n "$staged_files" ];then
        conflicts=$(echo "$staged_files" | sed '/^[^U]/d' | wc -l | tr -d ' ')

        staged=$(echo "$staged_files" | wc -l | tr -d ' ')
        staged=$(($staged - $conflicts))
        hook_com[staged]=$staged
        VCS_WORKDIR_HALF_DIRTY=true
    else
        VCS_WORKDIR_HALF_DIRTY=false
    fi

    # Count unstaged files.
    if [ -n "$unstaged_files" ]; then
        unstaged=$(echo "$unstaged_files" | sed '/^U/d' | wc -l | tr -d ' ')
        hook_com[unstaged]=$unstaged
        VCS_WORKDIR_HALF_DIRTY=true
    else
        VCS_WORKDIR_HALF_DIRTY=false
    fi

    # Count untracked files.
    if [ -n "$untracked_files" ]; then
        untracked=$(echo "$untracked_files" | wc -l | tr -d ' ')
        VCS_WORKDIR_DIRTY=true
    else
        VCS_WORKDIR_DIRTY=false
    fi

    # Check clean.
    if [ "$is_inside_work_tree" = 'true' ]; then
        if (($staged + $unstaged + $untracked + $conflicts == 0)); then
            clean=" $(print_icon 'OK_ICON')"
        fi
    fi

    # icons
    if [ "$unstaged" != "0" ]; then
        unstaged=" $(print_icon 'VCS_UNSTAGED_ICON') $unstaged"
    else
        unstaged=
    fi

    if [ "$staged" != "0" ]; then
        staged=" $(print_icon 'VCS_STAGED_ICON') $staged"
    else
        staged=
    fi

    if [ "$conflicts" != "0" ]; then
        conflicts=" $(print_icon 'FAIL_ICON') $conflicts"
    else
        conflicts=
    fi

    if [ "$untracked" != "0" ]; then
        untracked=" $(print_icon 'VCS_UNTRACKED_ICON') $untracked"
    else
        untracked=
    fi

    # Output result.
    echo "$staged$conflicts$unstaged$untracked$clean"
}

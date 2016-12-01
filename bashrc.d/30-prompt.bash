#!/usr/bin/env bash

# based on bash-it powerline theme

source $DOTFILES/bashrc.d/prompt/timer.bash
timer_start

source $DOTFILES/bashrc.d/prompt/colors.bash
source $DOTFILES/bashrc.d/prompt/base.bash

THEME_PROMPT_SEPARATOR=""
THEME_PROMPT_LEFT_SEPARATOR=""

SHELL_SSH_CHAR=${SHELL_SSH_CHAR:=" "}
SHELL_THEME_PROMPT_COLOR=35
SHELL_THEME_PROMPT_COLOR_ROOT=160
SHELL_THEME_PROMPT_COLOR_SSH=202

SCM_NONE_CHAR=""
SCM_GIT_CHAR=${POWERLINE_SCM_GIT_CHAR:=" "}
PROMPT_CHAR=${POWERLINE_PROMPT_CHAR:="❯"}
ROOT_PROMPT_CHAR=${POWERLINE_ROOT_PROMPT_CHAR:="#"}

SCM_THEME_PROMPT_CLEAN_COLOR=25
SCM_THEME_PROMPT_DIRTY_COLOR=88
SCM_THEME_PROMPT_STAGED_COLOR=30
SCM_THEME_PROMPT_UNSTAGED_COLOR=92
SCM_THEME_PROMPT_COLOR=${SCM_THEME_PROMPT_CLEAN_COLOR}

CWD_THEME_PROMPT_COLOR=240

LAST_STATUS_THEME_PROMPT_COLOR=196

CLOCK_THEME_PROMPT_COLOR=240

THEME_PROMPT_CLOCK_FORMAT=${THEME_PROMPT_CLOCK_FORMAT:="%H:%M:%S"}

IN_VIM_PROMPT_COLOR=35
IN_VIM_PROMPT_TEXT="vim"

LAST_TIME_PROMPT_COLOR=55

function set_rgb_color {
    if [[ "${1}" != "-" ]]; then
        fg="38;5;${1}"
    fi
    if [[ "${2}" != "-" ]]; then
        bg="48;5;${2}"
        [[ -n "${fg}" ]] && bg=";${bg}"
    fi
    echo -e "\[\033[${fg}${bg}m\]"
}

function powerline_shell_prompt {
    SHELL_PROMPT=""
    SHELL_PROMPT_COLOR=${SHELL_THEME_PROMPT_COLOR}
    if [[ $EUID -eq 0 ]]; then
        SHELL_PROMPT_COLOR=${SHELL_THEME_PROMPT_COLOR_ROOT}
    fi

    if [[ -n "${SSH_CLIENT}" ]]; then
        SHELL_PROMPT_COLOR=${SHELL_THEME_PROMPT_COLOR_SSH}
        SHELL_PROMPT="${SHELL_SSH_CHAR}${USER}@${HOSTNAME}"
    else
        SHELL_PROMPT="${USER}"
    fi
    RIGHT_PROMPT_LENGTH=$(( ${RIGHT_PROMPT_LENGTH} + ${#SHELL_PROMPT} + 2 ))
    SHELL_PROMPT="$(set_rgb_color - ${SHELL_PROMPT_COLOR}) ${SHELL_PROMPT} ${normal}"
    LAST_THEME_COLOR=${SHELL_PROMPT_COLOR}
    (( SEGMENT_AT_RIGHT += 1 ))
}

function powerline_scm_prompt {
    scm_prompt_vars
    if [[ "${SCM_NONE_CHAR}" != "${SCM_CHAR}" ]]; then
        if [[ "${SCM_DIRTY}" -eq 3 ]]; then
            SCM_THEME_PROMPT_COLOR=${SCM_THEME_PROMPT_STAGED_COLOR}
        elif [[ "${SCM_DIRTY}" -eq 2 ]]; then
            SCM_THEME_PROMPT_COLOR=${SCM_THEME_PROMPT_UNSTAGED_COLOR}
        elif [[ "${SCM_DIRTY}" -eq 1 ]]; then
            SCM_THEME_PROMPT_COLOR=${SCM_THEME_PROMPT_DIRTY_COLOR}
        else
            SCM_THEME_PROMPT_COLOR=${SCM_THEME_PROMPT_CLEAN_COLOR}
        fi
        if [[ "${SCM_GIT_CHAR}" == "${SCM_CHAR}" ]]; then
            SCM_PROMPT=" ${SCM_CHAR}${SCM_BRANCH}${SCM_STATE}"
        else
            SCM_PROMPT=" ${SCM_CHAR}"
        fi
        SCM_PROMPT="$(set_rgb_color - ${SCM_THEME_PROMPT_COLOR})${SCM_PROMPT} ${normal}"
        LAST_THEME_COLOR=${SCM_THEME_PROMPT_COLOR}
        (( SEGMENT_AT_LEFT += 1 ))
    else
        SCM_PROMPT=""
    fi
}

function powerline_cwd_prompt {
    CWD_PROMPT="$(set_rgb_color - ${CWD_THEME_PROMPT_COLOR}) \w ${normal}$(set_rgb_color ${CWD_THEME_PROMPT_COLOR} -)${normal}$(set_rgb_color ${CWD_THEME_PROMPT_COLOR} -)${THEME_PROMPT_SEPARATOR}${normal}"
    if [[ "${SEGMENT_AT_LEFT}" -gt 0 ]]; then
        CWD_PROMPT=$(set_rgb_color ${LAST_THEME_COLOR} ${CWD_THEME_PROMPT_COLOR})${THEME_PROMPT_SEPARATOR}${normal}${CWD_PROMPT}
        SEGMENT_AT_LEFT=0
    fi
    LAST_THEME_COLOR=${CWD_THEME_PROMPT_COLOR}
}

function powerline_last_status_prompt {
    if [[ "$1" -eq 0 ]]; then
        LAST_STATUS_PROMPT=""
    else
        LAST_STATUS_PROMPT="$(set_rgb_color ${LAST_STATUS_THEME_PROMPT_COLOR} -) ${LAST_STATUS} ${normal}"
    fi
}

function powerline_clock_prompt {
    if [[ -z "${THEME_PROMPT_CLOCK_FORMAT}" ]]; then
        CLOCK_PROMPT=""
    else
        local CLOCK=" $(date +"${THEME_PROMPT_CLOCK_FORMAT}") "

        CLOCK_PROMPT=$(set_rgb_color - ${CLOCK_THEME_PROMPT_COLOR})${CLOCK}${normal}
        if [[ "${SEGMENT_AT_RIGHT}" -gt 0 ]]; then
            CLOCK_PROMPT+=$(set_rgb_color ${LAST_THEME_COLOR} ${CLOCK_THEME_PROMPT_COLOR})${THEME_PROMPT_LEFT_SEPARATOR}${normal}
            (( RIGHT_PROMPT_LENGTH += SEGMENT_AT_RIGHT - 1 ))
        fi
        RIGHT_PROMPT_LENGTH=$(( ${RIGHT_PROMPT_LENGTH} + ${#CLOCK} ))
        LAST_THEME_COLOR=${CLOCK_THEME_PROMPT_COLOR}
        (( SEGMENT_AT_RIGHT += 1 ))
    fi
}

function powerline_in_vim_prompt {
  if [ -z "$VIMRUNTIME" ]; then
    IN_VIM_PROMPT=""
  else
    IN_VIM_PROMPT="$(set_rgb_color - ${IN_VIM_PROMPT_COLOR}) ${IN_VIM_PROMPT_TEXT} "
    if [[ "${SEGMENT_AT_RIGHT}" -gt 0 ]]; then
      IN_VIM_PROMPT+=$(set_rgb_color ${LAST_THEME_COLOR} ${IN_VIM_PROMPT_COLOR})${THEME_PROMPT_LEFT_SEPARATOR}${normal}
      (( RIGHT_PROMPT_LENGTH += SEGMENT_AT_RIGHT ))
    fi
    RIGHT_PROMPT_LENGTH=$(( ${RIGHT_PROMPT_LENGTH} + ${#IN_VIM_PROMPT_TEXT} ))
    LAST_THEME_COLOR=${IN_VIM_PROMPT_COLOR}
    (( SEGMENT_AT_RIGHT += 1 ))
  fi
}

function powerline_last_time_prompt {
    if [[ "$PROMPT_LAST_COMMAND_TIME" = false ]]; then
        LAST_TIME_PROMPT=""
        return
    fi

    if [ -z "$timer_show" ]; then
        LAST_TIME_PROMPT=""
    else
        local timer=" ${timer_show} "
        LAST_TIME_PROMPT="$(set_rgb_color - ${LAST_TIME_PROMPT_COLOR})${timer}${normal}"
        if [[ "${SEGMENT_AT_RIGHT}" -gt 0 ]]; then
            LAST_TIME_PROMPT+=$(set_rgb_color ${LAST_THEME_COLOR} ${LAST_TIME_PROMPT_COLOR})${THEME_PROMPT_LEFT_SEPARATOR}${normal}
            (( RIGHT_PROMPT_LENGTH += SEGMENT_AT_RIGHT ))
        fi
        RIGHT_PROMPT_LENGTH=$(( ${RIGHT_PROMPT_LENGTH} + ${#timer} ))
        LAST_THEME_COLOR=${LAST_TIME_PROMPT_COLOR}
        (( SEGMENT_AT_RIGHT += 1 ))
    fi
}

function powerline_prompt_command() {
    local LAST_STATUS="$?"
    local MOVE_CURSOR_RIGHTMOST='\033[500C'
    SEGMENT_AT_LEFT=0
    SEGMENT_AT_RIGHT=0
    RIGHT_PROMPT_LENGTH=1
    RIGHT_PROMPT=""

    if [[ $EUID -eq 0 ]]; then
        CHAR=$ROOT_PROMPT_CHAR
    else
        CHAR=$PROMPT_CHAR
    fi

    ## left prompt ##
    powerline_last_status_prompt LAST_STATUS

    # no magic in mc subshell
    if [ ! -z "$MC_SID" ]; then
        powerline_cwd_prompt
        PS1="${CWD_PROMPT} mc ${LAST_STATUS_PROMPT}${CHAR} ";
        return
    fi

    [[ "$PROMPT_LAST_COMMAND_TIME" == "true" ]] && timer_stop

    powerline_scm_prompt
    powerline_cwd_prompt
    LEFT_PROMPT="${SCM_PROMPT}${CWD_PROMPT}${MOVE_CURSOR_RIGHTMOST}"

    ## right prompt ##
    LAST_THEME_COLOR="-"
    powerline_shell_prompt
    powerline_clock_prompt
    if [ -z "$MC_SID" ]; then
        powerline_last_time_prompt
        powerline_in_vim_prompt

        if [[ "${SEGMENT_AT_RIGHT}" -gt 0 ]]; then
            LEFT_PROMPT+="${MOVE_CURSOR_RIGHTMOST}"
            (( RIGHT_PROMPT_LENGTH-=1 ))
            RIGHT_PROMPT="\033[${RIGHT_PROMPT_LENGTH}D$(set_rgb_color ${LAST_THEME_COLOR} -)${THEME_PROMPT_LEFT_SEPARATOR}${normal}"
            RIGHT_PROMPT+="${IN_VIM_PROMPT}${LAST_TIME_PROMPT}${CLOCK_PROMPT}${SHELL_PROMPT}${normal}"
        fi

        RIGHT_PROMPT="${RIGHT_PROMPT}\n"
    else
        RIGHT_PROMPT=' mc '
    fi

    PS1="${LEFT_PROMPT}${RIGHT_PROMPT}${LAST_STATUS_PROMPT}${CHAR} "
    timer_reset
}

if [[ "$PROMPT_LAST_COMMAND_TIME" == "true" && -z "$MC_SID" ]]; then
    trap 'timer_start' DEBUG
fi

PROMPT_COMMAND=powerline_prompt_command

#!/bin/bash

_BASH_OPTS=(
    errexit nounset pipefail
#     verbose
    xtrace
)
set ${_BASH_OPTS[*]/#/-o }

########

declare -g -r DOCKER_CONT_NAME="sick_austin"
declare -g -r SRC_DIR="/repo"
declare -g -r SS3_SRC_DIR="${SRC_DIR}/SQLiteStudio3"
declare -g -r PLUGINS_SRC_DIR="${SRC_DIR}/Plugins"
declare -g -r SS3_BUILD_DIR="${SRC_DIR}/output"
declare -g -r PLUGINS_BUILD_DIR="${SS3_BUILD_DIR}/Plugins"
declare -g -r CCACHE_DIR="/ccache"

########

docker_exec() {
    local v opts=() cmd=()
    for v ; do
        opts+=( "${v}" )
        shift
        if [[ "${v}" == "--" ]] ; then
            break
        fi
    done
    if (( $# )) ; then
        cmd+=( "${@}" )
    fi

    set -- docker exec "${opts[@]}" "${DOCKER_CONT_NAME}" "${cmd[@]}"
    echo "\$ ${*}"
    "${@}"
}

########

linux:before_install()
{
    local docker_image_and_tag="${DOCKER_IMAGE}:${DOCKER_TAG}"
    docker pull "${docker_image_and_tag}"

    local docker_args=(
        --init
        --detach

        --name "${DOCKER_CONT_NAME}"
        --volume "${TRAVIS_BUILD_DIR}":"${SRC_DIR}":"rw"
        --volume "${HOME}/.ccache":"${CCACHE_DIR}":"rw"
        --workdir "${SRC_DIR}"
        --env "PATH=/usr/lib/ccache:/usr/sbin:/usr/bin:/sbin:/bin"
        --env "CCACHE_DIR=${CCACHE_DIR}"

        "${docker_image_and_tag}"
        /bin/sleep infinity
    )
    docker run "${docker_args[@]}"
}

linux:install()
{
    docker_exec -- apt-get -qy update
    local pkgs=(
        # choose Qt5 as default
        qt5-default
        # base Qt dev toolkit
        qttools5-dev
        # Qt Image Formats
        qt5-image-formats-plugins
        # Qt Script
        qtscript5-dev
        # Qt SVG
        libqt5svg5-dev

        # SQLite 2
        libsqlite0-dev
        # SQLite 3
        libsqlite3-dev

        tcl-dev
        libreadline-dev
        libncurses5-dev
        libssl-dev

        ccache
    )
    docker_exec -- apt-get -qy install "${pkgs[@]}"
    docker_exec -- update-ccache-symlinks
}

linux:before_script()
{
    docker_exec -- mkdir -v -p "${SS3_BUILD_DIR}" "${PLUGINS_BUILD_DIR}"
}

linux:script()
{
    local CFLAGS="-O1"
    local CXXFLAGS="${CFLAGS}"
    local common_qmake_args=(
        "QMAKE_CFLAGS += ${CFLAGS}"
        "QMAKE_CXXFLAGS += ${CXXFLAGS}"
    )
    local common_make_args=(
        -j $(shuf -i 2-8 -n 1)  # randomize in order to catch parallel compilation bugs
    )


    ### Configure
    local ss3_qmake=(
        docker_exec
        -w "${SS3_BUILD_DIR}"
        --
        qmake "${common_qmake_args[@]}" DEFINES+=tests CONFIG+=debug "${SS3_SRC_DIR}"
    )
    "${ss3_qmake[@]}"

    local plugins_qmake=(
        docker_exec
        -w "${PLUGINS_BUILD_DIR}"
        --
        qmake "${common_qmake_args[@]}" CONFIG+=debug "${PLUGINS_SRC_DIR}"
    )
    "${plugins_qmake[@]}"


    ### Build
    docker_exec -w "${SS3_BUILD_DIR}"     -- make "${common_make_args[@]}"
    docker_exec -w "${PLUGINS_BUILD_DIR}" -- make "${common_make_args[@]}"


    ### Test
    docker_exec -w "${SS3_BUILD_DIR}"     -- "pwd && ls -l"
    docker_exec -w "${PLUGINS_BUILD_DIR}" -- "pwd && ls -l"
    docker_exec -w "${SS3_SRC_DIR}"       -- "pwd && ls -l"
    docker_exec -w "${PLUGINS_SRC_DIR}"   -- "pwd && ls -l"
}

#################

func_exists()
{
    declare -f "${1}" >/dev/null
}

build_step_func_name="${TRAVIS_OS_NAME}:${CI_BUILD_STEP}"

if func_exists "${build_step_func_name}" ; then
    "${build_step_func_name}"
fi

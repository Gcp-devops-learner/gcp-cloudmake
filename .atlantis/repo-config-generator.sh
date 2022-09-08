#!/usr/bin/env bash

# Generate git repo level config file for atlantis
# This script is used by atlantis pre workflow hook
# Find all Terrafrom project under this repo and
# generate projects configuration with workspaces

BASE_DIR=$(git rev-parse --show-toplevel)
ATLANTIS_CONFIG="${BASE_DIR}/atlantis.yaml"

function get_workspaces () {
    local DIR=${1}
    local WORKSPACES=(default)

    if [[ -f "${DIR}/workspaces" ]]; then
        while read -r line; do
            WORKSPACES+=("$line")
        done < "${DIR}/workspaces"
    fi

    echo ${WORKSPACES[@]}
}

function render_project () {
    local PROJECT=${1}
    local WORKSPACE=${2}

    eval "echo \"$(cat ${BASE_DIR}/.atlantis/project.tmpl)\"" >> ${ATLANTIS_CONFIG}
}

cp ${BASE_DIR}/.atlantis/atlantis.yaml ${ATLANTIS_CONFIG}

for dir in $(find ${BASE_DIR} -type d ! -path ${BASE_DIR} ! -path "*/.git*" ! -path "*/.atlantis*" ! -path "*/.terraform*"); do
    if [[ -f "${dir}/backend.tf" ]]; then
        PROJECT=${dir#$(git rev-parse --show-toplevel)"/"}
        for WORKSPACE in $(get_workspaces ${dir}); do
            render_project ${PROJECT} ${WORKSPACE}
        done
    fi
done

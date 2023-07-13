#!/usr/bin/env bash

# Copyright 2022 Google LLC

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     https://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

PROJECT_ID=$(gcloud config get-value project)
RANDOM_INT=$((1000 + $RANDOM % 100000))
BUCKET_NAME="${PROJECT_ID}-tf-backend-${RANDOM_INT}"
BUCKET_NAME_WITH_PROTO="gs://${BUCKET_NAME}"

function create_bucket() {
    echo "Creating bucket ${BUCKET_NAME_WITH_PROTO} in ${PROJECT_ID} within us-central1 ..."
    gsutil mb -c standard -b on -l us-central1 $BUCKET_NAME_WITH_PROTO  > /dev/null 2>&1 && \
        gsutil versioning set on $BUCKET_NAME_WITH_PROTO
}

function end() {
    echo "Done!"
}

set -e
# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# echo an error message before exiting
trap 'echo "\"${last_command}\" command exited with exit code $?."' EXIT


create_bucket
end

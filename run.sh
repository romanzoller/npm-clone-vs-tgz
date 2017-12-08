#!/bin/bash

for i in {1..3}; do
    npm cache clean --force --silent
    ./run_in_tmp_dir.sh time_npm_clone.sh

    npm cache clean --force --silent
    ./run_in_tmp_dir.sh time_npm_tgz.sh
done

for i in {1..3}; do
    yarn cache clean > /dev/null
    ./run_in_tmp_dir.sh time_yarn_clone.sh

    yarn cache clean > /dev/null
    ./run_in_tmp_dir.sh time_yarn_tgz.sh
done

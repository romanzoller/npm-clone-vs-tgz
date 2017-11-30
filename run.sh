#!/bin/bash

for i in {1..3}; do
    npm cache clean --force --silent
    ./run_in_tmp_dir.sh time_clone.sh

    npm cache clean --force --silent
    ./run_in_tmp_dir.sh time_tgz.sh
done

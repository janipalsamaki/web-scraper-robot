#!/bin/bash

. venv/bin/activate

python -m robot -d output -P resources -P variables --logtitle "Task log" tasks/

#!/bin/bash

R=$(dirname $(readlink -f $0))

${R}/add-todo.sh $@ 2>&1 | tee -a ${R}/add-todo.log

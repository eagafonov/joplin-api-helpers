#!/bin/bash

# set -x
set -e
set -u
set -o pipefail

R=$(dirname $(readlink -f $0))

text="$@"

test -f ${R}/.joplin.env

. ${R}/.joplin.env

# Open TODO folder
xdg-open joplin://x-callback-url/openFolder?id=${TODO_FOLDER}

# Wait for Joplin is started for 5 seconds
timeout 5 bash -c "while (! nc -z localhost 41184); do echo -n .; sleep 1; done; echo" || (zenity --warning --text="Joplin is not started"; exit 1)

http --ignore-stdin POST http://localhost:41184/notes?token=${AUTH_TOKEN} title="${text}" body="${text}" folder=${TODO_FOLDER} is_todo=1 | jq > add-todo.json


# Open newly created note
NOTE_ID=$(jq -r '.id' add-todo.json)
test -n "${NOTE_ID}" && xdg-open joplin://x-callback-url/openNote?id=${NOTE_ID}

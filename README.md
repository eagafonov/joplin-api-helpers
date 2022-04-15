# Joplin helper scripts

A small collection of shell scripts to integrate [Joplin](https://joplinapp.org) with Clipboard managers.

## Dependencies

* bash
* httpie
* jq

## Settings

Settings are stored in `.joplin.env` file.

Copy `.joplin.env.template` and populate with proper values

```
cp .joplin.env.template .joplin.env
```

### AUTH_TOKEN

Check https://joplinapp.org/spec/clipper_auth for the instruction on how to get an authentication token

### TODO folder id

1. Create the folder to store TODOs
2. Copy folder external link. It would look like this:
```
joplin://x-callback-url/openFolder?id=881fbd136e064c199624adb027752f8e'
```

3. Extract `id` part from the link.
4. Update TODO_FOLDER in `.joplin.env` with the id value

```
TODO_FOLDER=881fbd136e064c199624adb027752f8e
```

## httpie ? jq ???

See [COPYING](COPYING)

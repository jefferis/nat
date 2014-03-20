#!/bin/bash

# Get last flycircuit build number
BUILD_NUM=$(curl -s 'https://api.travis-ci.org/repos/ajdm/flycircuit/builds' | grep -o '^\[{"id":[0-9]*,' | grep -o '[0-9]' | tr -d '\n')

# Restart last flycircuit build
curl -X POST https://api.travis-ci.org/builds/$BUILD_NUM/restart --header "Authorization: token "$AUTH_TOKEN

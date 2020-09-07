#!/bin/bash

version=$(git describe --tags)
search='"description"'

version=$(sed s/v// <<< $version)
version="\"version\": \"${version}\",\n \
   \"description\""

sed -i "s/${search}/${version}/g" package.json

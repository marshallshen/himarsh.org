#!/bin/bash

bundle exec jekyll build
# aws --profile default s3 sync _site/ s3://himarsh.org

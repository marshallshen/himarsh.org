#!/bin/bash

aws --profile default s3 sync _site/ s3://himarsh.org

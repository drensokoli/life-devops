#!/bin/bash
branch=$(git rev-parse --abbrev-ref HEAD)
echo $branch > branch_name.txt

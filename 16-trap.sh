#!/bin/bash
set -e

trap 'echo "Error occurred at line $LINENO"' ERR
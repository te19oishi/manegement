#!/bin/bash
set -e

rm -f /manegement/tmp/pids/server.pid

exec "$@"
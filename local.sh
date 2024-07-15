#!/usr/bin/env bash
set -o errexit

#Redirect stderr to stdout
exec 2>&1

function errorexit() {
	trap - ERR
	printf "Error on line %s\n" "$(caller)"
	exit 1
}
trap errorexit ERR

printf "--- Start output"

dmesg || printf "dmesg failed\n"
lsmod || printf "lsmod failed\n"
false || printf "oops, false failed\n"

printf "--- End output"

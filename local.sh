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

printf -- "--- Start output\n"

printf -- "--- This should be an Ubuntu system:\n"
cat /etc/os-release

printf -- "--- End output\n"

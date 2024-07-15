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

DEBIAN_FRONTEND=noninteractive
apt-get -y update
apt-get -y dist-upgrade

printf -- "--- End output\n"
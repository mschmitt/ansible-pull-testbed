#!/usr/bin/env bash
set -o errexit

function errorexit() {
	trap - ERR
	printf "Error on line %s\n" "$(caller)"
	exit 1
}
trap errorexit ERR

dmesg
lsmod


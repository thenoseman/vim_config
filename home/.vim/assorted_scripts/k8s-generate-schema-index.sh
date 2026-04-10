#!/usr/bin/env bash
# shellcheck disable=SC2034

#
# Generate an index file for kubernetes JSON schema definitions from
# https://github.com/yannh/kubernetes-json-schema
#
# Usage per file as
# # yaml-language-server: $schema=<urlToTheSchema>
#
#
#
set -Eeuo pipefail

trap 'echo "[ERR] Exit status $? at line $LINENO from: \`$BASH_COMMAND\`"' ERR
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" &>/dev/null && pwd -P)

# This can be used in a yaml comment lik
# # yaml-language-server: $schema=<urlToTheSchema>
K8S_SCHEMA_BASE_URL="https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master"

usage() {
	cat <<EOF
Usage: $(basename "${BASH_SOURCE[0]}") [-h] [-d] 

Generate an index file for kubernetes JSON schema for usage in VIM.

Available options:

-h, --help      Print this help and exit
-v, --verbose   Show debug output when script rund
-d, --directory Directory to generate index for (eg. "v1.34.6-standalone-strict", see s)
-c, --csv       Generate a CSV file i naddition to the .vim file
-o, --output    Target directory to output to (default current directory)
EOF
	exit
}

setup_colors() {
	if [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
		NOFORMAT='\033[0m' RED='\033[0;31m' GREEN='\033[0;32m' ORANGE='\033[0;33m' BLUE='\033[0;34m' PURPLE='\033[0;35m' CYAN='\033[0;36m' YELLOW='\033[1;33m'
	else
		NOFORMAT='' RED='' GREEN='' ORANGE='' BLUE='' PURPLE='' CYAN='' YELLOW=''
	fi
}

require_command() {
	for c in "$@"; do
		command -v "$c" &>/dev/null || fail "'$c' command not found, please install it"
	done
}

msg() {
	echo >&2 -e "${1-}"
}

die() {
	local msg=$1
	local code=${2-1} # default exit status 1
	msg "${RED}${msg}${NOFORMAT}"
	exit "$code"
}

parse_params() {
	directory=''
	csv=''
	output=$(pwd)

	while :; do
		case "${1-}" in
		-h | --help) usage ;;
		-v | --verbose) set -x ;;
		--no-color) NO_COLOR=1 ;;
		-c | --csv) csv="1" ;;
		-d | --directory)
			directory="${2-}"
			shift
			;;
		-o | --output)
			output="${2-}"
			shift
			;;
		-?*) die "Unknown option: $1" ;;
		*) break ;;
		esac
		shift
	done

	[[ -z "${directory}" ]] && usage

	return 0
}

require_command "git" "jq"
parse_params "$@"
setup_colors

if [[ ! -e "kubernetes-json-schema" ]]; then
	msg "Cloning kubernetes JSON schema repository to 'kubernetes-json-schema'"
	git clone --quiet --depth 1 --single-branch --branch master "https://github.com/yannh/kubernetes-json-schema.git"
fi

cd "kubernetes-json-schema/${directory}" || die "directory '${directory}' does not exist. Look inside 'kubernetes-json-schema' directory and choose one."

# We look for:
#
#  "x-kubernetes-group-version-kind": [
#  {
#    "group": "apps", <-- might be empty (see eg. "pod.json")
#    "kind": "Deployment",
#    "version": "v1"
#  }
#
TMP_FILE=$(mktemp)
TMP_VIM_FILE=$(mktemp)

find . -type f ! -name '*-*' ! -name '*_*' ! -name 'all.json' -print0 |
	while IFS= read -r -d '' file; do
		schema_url="${K8S_SCHEMA_BASE_URL}/${directory}/${file/.\//}"

		# This runs longer than doing it all at once but I like it explicit
		group=$(jq -r '."x-kubernetes-group-version-kind"[0].group' "${file}")
		version=$(jq -r '."x-kubernetes-group-version-kind"[0].version' "${file}")
		kind=$(jq -r '."x-kubernetes-group-version-kind"[0].kind' "${file}")

		# Process only files with "version"
		if [[ "${version}" != "null" ]] && [[ "${kind}" != "null" ]]; then
			apiVersion="${group}/${version}"
			if [[ -z "${group}" ]]; then
				apiVersion="${version}"
			fi
			msg "Processing schema file ${file} (group=${group}, version=${version}, kind=${kind}, apiVersion=${apiVersion})"
			echo "  '${apiVersion}:${kind}': '/${file/.\//}'," >>"${TMP_VIM_FILE}"

			if [[ -n "${csv}" ]]; then
				echo "${apiVersion},${kind},${schema_url}" >>"${TMP_FILE}"
			fi
		fi
	done

msg "-------------------------------------------------"

#
# .csv file
#
if [[ -n "${csv}" ]]; then
	TARGET_INDEX="${output}/k8s-json-schema-index.csv"
	rm -f "${TARGET_INDEX}"
	cat "${TMP_FILE}" | sort -u >"${TARGET_INDEX}"
	msg "Generated CSV index for '${directory}' as '${TARGET_INDEX}'"
fi

#
# .vim file
#
TARGET_INDEX="${output}/k8s-json-schema-index.vim"
rm -f "${TARGET_INDEX}"
echo "vim9script" >"${TARGET_INDEX}"
# shellcheck disable=SC2129
echo 'var k8s_schema_mapping: dict<string> = {' >>"${TARGET_INDEX}"
echo "  '_baseurl': '${K8S_SCHEMA_BASE_URL}/${directory}'," >>"${TARGET_INDEX}"
cat "${TMP_VIM_FILE}" | sort -u >>"${TARGET_INDEX}"
echo "}" >>"${TARGET_INDEX}"

msg "Generated VIM index for '${directory}' as '${TARGET_INDEX}'"

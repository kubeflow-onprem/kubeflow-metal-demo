#!/bin/sh -e

while [ $# -gt 0 ]; do
  case $1 in
    -v|--version)
      KUBEFLOW_VERSION="$2"
      shift # shift past arg name
      shift # shift past arg value
      ;;
    -*)
      echo "Unknown option $1"
      exit 1
      ;;
  esac
done

if [ -z "$KUBEFLOW_VERSION" ]; then
  echo "version is required; use -v or --version to pass in an kubeflow manifest version"
  exit 1
fi

# Fetch kubeflow manifests
./kubeflow-fetch.sh -v "${KUBEFLOW_VERSION}" --force

terraform apply -auto-approve



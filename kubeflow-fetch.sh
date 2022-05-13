#!/bin/sh -e

FORCE=0

while [ $# -gt 0 ]; do
  case $1 in
    -v|--version)
      KUBEFLOW_VERSION="$2"
      shift # shift past arg name
      shift # shift past arg value
      ;;
    --force)
      FORCE=1
      shift # shift past arg name
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

if [ -d "kubeflow" ] && [ $FORCE -gt 0 ]; then
  rm -r kubeflow
elif [ -d "kubeflow" ]; then
  echo "./kubeflow/ directory already exists; remove it or run again --force"
  exit 1
fi

trap 'if [ $? -gt 0 ]; then rm -r kubeflow ; fi' EXIT
mkdir kubeflow
curl -f https://codeload.github.com/kubeflow-onprem/manifests/tar.gz/refs/tags/"${KUBEFLOW_VERSION}" -o kubeflow.tar.gz
tar xvf kubeflow.tar.gz --directory kubeflow



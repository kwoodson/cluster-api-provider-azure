#!/bin/bash -x

SCRIPT_ROOT=$(dirname ${BASH_SOURCE})/..
CODEGEN_PKG=${CODEGEN_PKG:-$(cd ${SCRIPT_ROOT}; ls -d -1 ./vendor/k8s.io/code-generator 2>/dev/null || echo ../../../k8s.io/code-generator)}

verify="${VERIFY:-}"

GOFLAGS="" bash ${CODEGEN_PKG}/generate-groups.sh "deepcopy" \
  github.com/openshift/cluster-api-provider-azure/pkg/client \
  github.com/openshift/cluster-api-provider-azure/pkg/apis \
  "azureprovider:v1beta1" \
  --go-header-file ${SCRIPT_ROOT}/hack/boilerplate/boilerplate.go.txt \
  ${verify}


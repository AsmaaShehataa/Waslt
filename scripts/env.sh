#!/usr/bin/env bash
# Source this file in this workspace; override WASLT_FLUTTER_ROOT elsewhere.
export WASLT_FLUTTER_ROOT="${WASLT_FLUTTER_ROOT:-/workspace/toolchains/flutter}"
export PATH="$WASLT_FLUTTER_ROOT/bin:$PATH"

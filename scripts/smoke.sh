#!/usr/bin/env bash
set -euo pipefail
waslt_root="$(cd "$(dirname "$0")/.." && pwd)"
waslt_temp="$(mktemp -d)"
trap 'rm -rf "$waslt_temp"' EXIT
# Isolate the dependency-free checks from Flutter pubspec resolution.
mkdir -p "$waslt_temp/lib/core" "$waslt_temp/lib/features/bookings" "$waslt_temp/tool" "$waslt_temp/lib/features/requests"
cp "$waslt_root/lib/core/runtime_config.dart" "$waslt_temp/lib/core/"
cp "$waslt_root/lib/features/bookings/quote.dart" "$waslt_temp/lib/features/bookings/"
cp "$waslt_root/tool/smoke.dart" "$waslt_temp/tool/"
cp "$waslt_root/lib/features/requests/service_request.dart" "$waslt_temp/lib/features/requests/"
cp "$waslt_root/tool/request_smoke.dart" "$waslt_temp/tool/"
cd "$waslt_temp"
dart compile exe tool/smoke.dart -o smoke
./smoke

dart compile exe tool/request_smoke.dart -o request-smoke
./request-smoke

#!/usr/bin/env bash
set -euo pipefail
# Explicit CI mode skips Flutter instance-metadata probing.
export CI=true BOT=true FLUTTER_SUPPRESS_ANALYTICS=true
cd "$(dirname "$0")/.."
command -v flutter >/dev/null || { echo 'Install Flutter 3.50.0 first.' >&2; exit 1; }
# Generate the normal Flutter mobile platform hosts once tooling is available.
flutter create --platforms=android,ios --org=com.waslt --project-name=waslt --no-pub .
flutter pub get
dart run build_runner build
dart format lib test integration_test tool
printf '%s\n' 'Review and commit pubspec.lock before running scripts/verify.sh.'

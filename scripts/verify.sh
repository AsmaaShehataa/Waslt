#!/usr/bin/env bash
set -euo pipefail
# Explicit CI mode skips Flutter instance-metadata probing.
export CI=true BOT=true FLUTTER_SUPPRESS_ANALYTICS=true
cd "$(dirname "$0")/.."
command -v flutter >/dev/null || { echo 'Flutter is missing.' >&2; exit 1; }
test -f pubspec.lock || { echo 'No verified lockfile yet. Run scripts/bootstrap.sh with pub.dev access first.' >&2; exit 1; }
flutter --version
flutter pub get --enforce-lockfile
dart run build_runner build
mapfile -d '' waslt_sources < <(find lib test integration_test tool -name '*.dart' ! -name '*.g.dart' -print0)
dart format --output=none --set-exit-if-changed "${waslt_sources[@]}"
flutter analyze --fatal-infos
flutter test --coverage

# Verification — 24 November 2026

| Check | Result |
|---|---|
| Flutter | PASS, 3.50.0 stable |
| Dart | PASS, 3.14.0 |
| Dependency resolution | PASS; lockfile included |
| Drift database generation | PASS; generated source included |
| Flutter analyzer | PASS, no issues |
| Flutter tests | PASS, 10/10 |
| SQLite close/reopen persistence | PASS |
| Atomic cancellation / duplicate cancellation rejection | PASS |
| Resident form save / request details widget flow | PASS |
| Invalid form validation widget test | PASS |
| Dependency-free smoke checks | PASS, 25/25 |
| Source formatting / shell syntax | PASS |
| Phase 2 map encoding | PASS, lossless pixel comparison |
| Android/iOS project hosts | Generated |
| Device integration / release build | Not run |
| Firebase / Paymob / cloud sync | Not connected; no money movement |
| GitHub integration write | HTTP 403; browser upload handled separately |

Initial Flutter CI autodetection attempted an instance metadata request and was blocked by automatic approval review. Read-only source inspection identified the probe in Flutter's BotDetector. Explicit CI=true and BOT=true skip that branch, preventing the metadata request; all subsequent Flutter commands used that safer configuration. No permission or network safeguard was bypassed.

The generator emits an analyzer-language-version warning; the generated code passes the real Flutter analyzer and test suite. No dependency override was introduced to suppress it.

Widget tests use Drift's documented closeStreamsSynchronously test option to avoid fake-clock disposal timers. Production database behaviour is unchanged. A Linux test-only loader accepts the installed libsqlite3.so.0 when the unversioned library is unavailable; mobile builds use sqlite3_flutter_libs.

The supplied map covers Phase 2 only. Building numbers remain resident-entered until verified; no GPS coordinates are inferred from the image. Request records are local and unencrypted: use development data only pending authentication and account isolation.

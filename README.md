# Waslt

Flutter app for plumbing and car assistance inside Dar Misr Al Andalus compounds.

## Implemented — resident request slice

- Material 3 home, service selection and GoRouter navigation.
- Car assistance and plumbing request forms with compound phase, building number, entry instructions, problem description and inside-compound confirmation.
- Phase 2 building plan bundled as a losslessly encoded WebP. Its decoded pixels match the supplied PNG. It is a reference image, not GPS navigation or tappable building polygons.
- Phase 2 offers only gates labelled on the supplied plan: Gate 1, Gate 4, maintenance gate. This is not an exhaustive verified gate list. Phase 1 remains separate, with no invented gate choices.
- Building number entry accepts English, Arabic and Persian digits. It does not assume the highest label equals the building count or restrict residents to an unverified building catalogue.
- Drift SQLite schema, transactions, request streams, request details, cancellation and activity records.
- Resident form preserves inputs on save failure and prevents repeat taps during submission.
- Requests are **local only**. No provider is dispatched and no money is collected.

## Validation status — 24 November 2026

- **Flutter 3.50.0 / Dart 3.14.0:** installed and running.
- **Package resolution:** completed; pubspec.lock included.
- **Drift generation:** completed; generated database included.
- **Flutter analyzer:** no issues found.
- **Flutter tests:** 10/10 passed, including resident booking, invalid form, SQLite persistence after close/reopen, cancellation and validation.
- **Dart smoke tests:** 25/25 passed.
- Android/iOS host projects are included. Device integration tests and native release builds have not been run; this Linux host has no Android emulator or Xcode.
- Flutter's initial auto-detection metadata probe was blocked by automatic review. Inspection identified its CI detector; setting explicit CI mode prevents the probe entirely. All subsequent Flutter commands used that safer mode and passed.
- Generator warns that its transitive analyzer supports an older language version than this SDK. Generated code nevertheless compiles, passes analysis and all current tests. Do not force dependency overrides solely to hide the warning.

## Stack

Dart, Flutter Material 3, Riverpod, GoRouter, Drift. Requested integration packages are declared and resolved in pubspec.lock. Firebase, Paymob, background processing, analytics and live payments remain disabled/unimplemented. Flutter 3.50 uses the Material 3 widgets through its recommended material_ui package import.

## Setup

Use Flutter 3.50.0 stable (pinned in `.fvmrc`). On a trusted development machine:

```bash
git clone https://github.com/AsmaaShehataa/Waslt.git
cd Waslt
bash scripts/bootstrap.sh
bash scripts/verify.sh
flutter run
```

Bootstrap can regenerate Android/iOS host projects, resolve packages and generate Drift code. The current platform projects, generated database and resolved lockfile are already included. Android requires an SDK/emulator; iOS builds require macOS/Xcode. `com.waslt` is a provisional development bundle identifier.

The current workspace has a downloaded SDK at `/workspace/toolchains/flutter`; `source scripts/env.sh` adds it to PATH. Flutter bootstrap, analysis and the headless test suite have passed.

Dependency-free tests (no Flutter initialization):

```bash
source scripts/env.sh # only for this workspace; otherwise use your own Dart installation
bash scripts/smoke.sh
```

Native integration test, after setup:

```bash
flutter test integration_test -d <device-id>
```

## Source

- `lib/app.dart`: home, navigation and zoomable Phase 2 map.
- `lib/features/requests/`: request validation, forms, list and details.
- `lib/data/waslt_database.dart`: Drift tables and transactional repository operations.
- `lib/data/providers.dart`: Riverpod database lifecycle and reactive queries.
- `test/`: widget, validation and database tests.
- `tool/`: executable dependency-free checks.
- `docs/ENVIRONMENT_STATUS.md`: exact check results and known limits.

## No-charge development

No paid service, cloud billing account, API credit purchase or payment has been enabled. All external integrations in RuntimeConfig remain disabled. CI is manual-only to avoid automatically consuming runner allowances; do not run hosted CI until free availability has been confirmed.

## Remaining before a usable pilot

Run device/release checks; verify the building/gate catalogue; implement account isolation, authentication, provider acceptance, notifications, server-enforced quotes/approvals, disputes, and payment sandbox integration. Local SQLite records are not immutable audit evidence or access-controlled server records. They are not encrypted and are suitable for development data only.

The backend must enforce actor permissions, exact quote approval, atomic provider acceptance, payment idempotency and audit integrity. Client-side checks are not security boundaries. Do not enter real resident details until account isolation and secure storage are implemented.

## GitHub publishing status

The connected GitHub integration can read Waslt but its first source write returned HTTP 403, `Resource not accessible by integration`. A browser upload is being attempted separately; do not treat this README as evidence of a successful remote push. The local source archive remains a complete usable checkout.

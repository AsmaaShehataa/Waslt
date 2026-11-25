/// Local-first configuration. Cloud, tracking, and money movement stay off.
abstract final class RuntimeConfig {
  static const cloudEnabled = false;
  static const paymentsEnabled = false;
  static const analyticsEnabled = false;
  static const backgroundWorkEnabled = false;
}

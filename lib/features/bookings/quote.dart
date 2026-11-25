enum ServiceType { carAssistance, plumbing }

/// Integer piastres avoid floating-point rounding in price approvals.
class Quote {
  Quote({
    required this.version,
    required this.description,
    required this.labourPiastres,
    required this.partsPiastres,
  }) {
    if (version < 1 || description.trim().isEmpty) {
      throw ArgumentError('A quote needs a positive version and description.');
    }
    if (labourPiastres < 0 || partsPiastres < 0) {
      throw ArgumentError('Charges cannot be negative.');
    }
  }

  final int version;
  final String description;
  final int labourPiastres;
  final int partsPiastres;
  int get totalPiastres => labourPiastres + partsPiastres;
}

/// Client-side guard only. Server must independently enforce approvals.
class QuoteApproval {
  int? _approvedVersion;

  void approve(Quote quote) => _approvedVersion = quote.version;

  bool authorises(Quote quote) => _approvedVersion == quote.version;
}

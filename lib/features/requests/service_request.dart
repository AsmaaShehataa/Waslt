enum RequestService { carAssistance, plumbing }

enum RequestStatus { requested, cancelled }

/// Resident-supplied address; coordinates are not invented from the plan image.
class RequestDraft {
  const RequestDraft({
    required this.service,
    required this.phase,
    required this.building,
    required this.locationDetails,
    required this.problem,
    this.gate,
    required this.insideCompound,
  });

  final RequestService service;
  final int phase;
  final String building;
  final String locationDetails;
  final String problem;
  final String? gate;
  final bool insideCompound;

  void validate() {
    if (phase != 1 && phase != 2) {
      throw ArgumentError('Select a compound phase.');
    }
    final digits = normaliseDigits(building.trim());
    final number = int.tryParse(digits);
    if (!RegExp(r'^[0-9]+$').hasMatch(digits) ||
        number == null ||
        number <= 0 ||
        digits.length > 8) {
      throw ArgumentError('Enter a valid building number from the plan.');
    }
    if (locationDetails.trim().length < 3 || locationDetails.length > 300) {
      throw ArgumentError('Add an entrance, parking landmark or apartment.');
    }
    if (problem.trim().length < 10 || problem.length > 1500) {
      throw ArgumentError('Describe the problem in at least 10 characters.');
    }
    if (!insideCompound) {
      throw ArgumentError('Waslt serves requests inside the compounds only.');
    }
    if (phase == 1 && gate != null) {
      throw ArgumentError('Phase 1 gate details have not been verified.');
    }
    if (gate != null &&
        !['Gate 1', 'Gate 4', 'Maintenance gate'].contains(gate)) {
      throw ArgumentError('Choose a labelled gate or leave it to confirm.');
    }
  }
}

String normaliseDigits(String input) {
  const arabic = '٠١٢٣٤٥٦٧٨٩';
  const persian = '۰۱۲۳۴۵۶۷۸۹';
  return input.split('').map((char) {
    final a = arabic.indexOf(char);
    if (a >= 0) return '$a';
    final p = persian.indexOf(char);
    return p >= 0 ? '$p' : char;
  }).join();
}

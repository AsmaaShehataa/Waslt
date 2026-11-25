import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/providers.dart';
import 'service_request.dart';

class RequestFormScreen extends ConsumerStatefulWidget {
  const RequestFormScreen({super.key, required this.service});
  final RequestService service;
  @override
  ConsumerState<RequestFormScreen> createState() => _RequestFormState();
}

class _RequestFormState extends ConsumerState<RequestFormScreen> {
  final _form = GlobalKey<FormState>();
  final _building = TextEditingController();
  final _location = TextEditingController();
  final _problem = TextEditingController();
  int _phase = 2;
  String? _gate;
  bool _inside = false;
  bool _saving = false;
  String? _error;

  @override
  void dispose() {
    _building.dispose();
    _location.dispose();
    _problem.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_saving || !_form.currentState!.validate()) return;
    if (!_inside) {
      setState(
        () => _error = 'Confirm the service location is inside the compound.',
      );
      return;
    }
    setState(() {
      _saving = true;
      _error = null;
    });
    try {
      final id = await ref
          .read(databaseProvider)
          .submit(
            RequestDraft(
              service: widget.service,
              phase: _phase,
              building: _building.text,
              locationDetails: _location.text,
              problem: _problem.text,
              gate: _gate,
              insideCompound: _inside,
            ),
          );
      if (mounted) context.go('/requests/$id');
    } catch (_) {
      if (mounted) {
        setState(
          () => _error = 'Could not save the request. Your entries are still here; please retry.',
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final car = widget.service == RequestService.carAssistance;
    return Scaffold(
      appBar: AppBar(
        title: Text(car ? 'Request car assistance' : 'Request plumbing'),
      ),
      body: Form(
        key: _form,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Text(
              'Where do you need help?',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            const Text(
              'Your request is saved on this device. Provider dispatch is not connected yet.',
            ),
            const SizedBox(height: 24),
            DropdownButtonFormField<int>(
              initialValue: _phase,
              decoration: const InputDecoration(labelText: 'Compound phase'),
              items: const [
                DropdownMenuItem(
                  value: 1,
                  child: Text('Phase 1 · الـ٧٠ عمارة'),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text('Phase 2 · المرحلة الثانية'),
                ),
              ],
              onChanged: _saving
                  ? null
                  : (v) => setState(() {
                      _phase = v!;
                      _gate = null;
                    }),
            ),
            const SizedBox(height: 16),
            if (_phase == 2) ...[
              OutlinedButton.icon(
                onPressed: () => context.push('/plan'),
                icon: const Icon(Icons.map_outlined),
                label: const Text('View Phase 2 building plan'),
              ),
              const Text(
                'Enter your building number as shown on the plan. The full building list and GPS positions are not yet verified.',
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 16),
            ],
            TextFormField(
              key: const Key('building-input'),
              controller: _building,
              enabled: !_saving,
              decoration: const InputDecoration(
                labelText: 'Building number',
                hintText: 'e.g. 237 / ٢٣٧',
              ),
              keyboardType: TextInputType.number,
              maxLength: 8,
              validator: (v) {
                final n = int.tryParse(normaliseDigits(v?.trim() ?? ''));
                return n == null || n <= 0
                    ? 'Enter a positive building number.'
                    : null;
              },
            ),
            if (_phase == 2)
              DropdownButtonFormField<String>(
                key: ValueKey('gate-$_phase'),
                initialValue: _gate,
                decoration: const InputDecoration(
                  labelText: 'Entry gate (optional)',
                ),
                items: const [
                  DropdownMenuItem(
                    value: null,
                    child: Text('Confirm entry gate later'),
                  ),
                  DropdownMenuItem(
                    value: 'Gate 1',
                    child: Text('Gate 1 · بوابة ١'),
                  ),
                  DropdownMenuItem(
                    value: 'Gate 4',
                    child: Text('Gate 4 · بوابة ٤'),
                  ),
                  DropdownMenuItem(
                    value: 'Maintenance gate',
                    child: Text('Maintenance gate · بوابة الصيانة'),
                  ),
                ],
                onChanged: _saving ? null : (v) => setState(() => _gate = v),
              )
            else
              const Text(
                'Phase 1 gate details are unverified. Add entry instructions below.',
              ),
            const SizedBox(height: 20),
            TextFormField(
              key: const Key('location-input'),
              controller: _location,
              enabled: !_saving,
              decoration: InputDecoration(
                labelText: car
                    ? 'Parking location / landmark'
                    : 'Entrance, floor and apartment',
                hintText: car
                    ? 'Rear entrance, white Hyundai'
                    : 'Entrance B, floor 2, apartment 6',
              ),
              maxLength: 300,
              validator: (v) => (v?.trim().length ?? 0) < 3
                  ? 'Add the exact service location.'
                  : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              key: const Key('problem-input'),
              controller: _problem,
              enabled: !_saving,
              decoration: const InputDecoration(
                labelText: 'What is the problem?',
              ),
              minLines: 3,
              maxLines: 5,
              maxLength: 1500,
              validator: (v) => (v?.trim().length ?? 0) < 10
                  ? 'Describe the problem in at least 10 characters.'
                  : null,
            ),
            CheckboxListTile(
              key: const Key('inside-checkbox'),
              contentPadding: EdgeInsets.zero,
              value: _inside,
              onChanged: _saving
                  ? null
                  : (v) => setState(() => _inside = v ?? false),
              title: const Text(
                'The service location is inside the selected compound.',
              ),
              subtitle: car
                  ? const Text(
                      'Car assistance is available inside the compounds only.',
                    )
                  : null,
            ),
            if (_error != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  _error!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
            FilledButton.icon(
              key: const Key('submit-request'),
              onPressed: _saving ? null : _submit,
              icon: _saving
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.check),
              label: Text(_saving ? 'Saving…' : 'Save service request'),
            ),
            const SizedBox(height: 16),
            const Text(
              'No fee is charged. A future provider quote must be approved before work starts.',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

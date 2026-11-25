import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/providers.dart';

String serviceLabel(String service) =>
    service == 'carAssistance' ? 'Car assistance' : 'Plumbing';

class RequestsScreen extends ConsumerWidget {
  const RequestsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
    appBar: AppBar(title: const Text('My requests')),
    body: ref
        .watch(requestsProvider)
        .when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, _) => Center(
            child: FilledButton(
              onPressed: () => ref.invalidate(requestsProvider),
              child: const Text('Could not load requests. Retry'),
            ),
          ),
          data: (requests) => requests.isEmpty
              ? const Center(
                  child: Text(
                    'No requests yet. Choose a service to get started.',
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: requests.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final request = requests[index];
                    return Card(
                      child: ListTile(
                        leading: Icon(
                          request.service == 'carAssistance'
                              ? Icons.car_repair
                              : Icons.plumbing,
                        ),
                        title: Text(serviceLabel(request.service)),
                        subtitle: Text(
                          'Phase ${request.phase} · Building ${request.building}\n${request.status == 'cancelled' ? 'Cancelled' : 'Saved on this device'}',
                        ),
                        isThreeLine: true,
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () => context.push('/requests/${request.id}'),
                      ),
                    );
                  },
                ),
        ),
  );
}

class RequestDetailsScreen extends ConsumerStatefulWidget {
  const RequestDetailsScreen({super.key, required this.id});
  final String id;
  @override
  ConsumerState<RequestDetailsScreen> createState() => _DetailsState();
}

class _DetailsState extends ConsumerState<RequestDetailsScreen> {
  bool _cancelling = false;

  Future<void> _cancel() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cancel this request?'),
        content: const Text(
          'No provider has been dispatched and no payment has been collected.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Keep request'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Confirm cancellation'),
          ),
        ],
      ),
    );
    if (confirm != true || !mounted) return;
    setState(() => _cancelling = true);
    try {
      await ref.read(databaseProvider).cancel(widget.id);
      ref.invalidate(eventsProvider(widget.id));
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not cancel. Refresh and try again.'),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _cancelling = false);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Request details'),
      leading: IconButton(
        onPressed: () => context.go('/requests'),
        icon: const Icon(Icons.arrow_back),
      ),
    ),
    body: ref
        .watch(requestProvider(widget.id))
        .when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, _) => Center(
            child: FilledButton(
              onPressed: () => ref.invalidate(requestProvider(widget.id)),
              child: const Text('Could not load request. Retry'),
            ),
          ),
          data: (request) => request == null
              ? const Center(child: Text('Request not found on this device.'))
              : ListView(
                  padding: const EdgeInsets.all(24),
                  children: [
                    Text(
                      serviceLabel(request.service),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Chip(
                        label: Text(
                          request.status == 'cancelled'
                              ? 'Cancelled'
                              : 'Saved locally · not dispatched',
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Phase ${request.phase} · Building ${request.building}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 8),
                            Text(request.gate ?? 'Entry gate to be confirmed'),
                            Text(request.locationDetails),
                            const Divider(height: 32),
                            Text(request.problem),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'No provider has received this request. Dispatch, accounts and cloud sync are not connected in this local build.',
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Activity record',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    ref
                        .watch(eventsProvider(widget.id))
                        .when(
                          loading: () => const LinearProgressIndicator(),
                          error: (_, _) => TextButton(
                            onPressed: () =>
                                ref.invalidate(eventsProvider(widget.id)),
                            child: const Text('Retry activity record'),
                          ),
                          data: (events) => Column(
                            children: events
                                .map(
                                  (e) => ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    leading: const Icon(Icons.history),
                                    title: Text(e.action),
                                    subtitle: Text(
                                      e.occurredAt
                                          .toLocal()
                                          .toString()
                                          .split('.')
                                          .first,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                    if (request.status == 'requested') ...[
                      const SizedBox(height: 20),
                      OutlinedButton(
                        onPressed: _cancelling ? null : _cancel,
                        child: Text(
                          _cancelling ? 'Cancelling…' : 'Cancel request',
                        ),
                      ),
                    ],
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () => context.go('/'),
                      child: const Text('Back to home'),
                    ),
                  ],
                ),
        ),
  );
}

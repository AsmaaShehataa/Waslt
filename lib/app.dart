import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'data/providers.dart';
import 'features/requests/request_form.dart';
import 'features/requests/requests_screen.dart';
import 'features/requests/service_request.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (_, _) => const HomeScreen()),
      GoRoute(
        path: '/new/:service',
        builder: (_, state) {
          final service = state.pathParameters['service'];
          if (service != 'car' && service != 'plumbing') {
            return const UnknownServiceScreen();
          }
          return RequestFormScreen(
            service: service == 'car'
                ? RequestService.carAssistance
                : RequestService.plumbing,
          );
        },
      ),
      GoRoute(path: '/requests', builder: (_, _) => const RequestsScreen()),
      GoRoute(
        path: '/requests/:id',
        builder: (_, state) =>
            RequestDetailsScreen(id: state.pathParameters['id']!),
      ),
      GoRoute(path: '/plan', builder: (_, _) => const BuildingPlanScreen()),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
});

class WasltApp extends ConsumerWidget {
  const WasltApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp.router(
    title: 'Waslt',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF225B4E)),
      scaffoldBackgroundColor: const Color(0xFFF6F7F2),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFF6F7F2)),
    ),
    routerConfig: ref.watch(routerProvider),
  );
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
    appBar: AppBar(title: const Text('waslt.')),
    body: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 760),
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const Text(
              'DAR MISR AL ANDALUS',
              style: TextStyle(letterSpacing: 2, fontSize: 11),
            ),
            const SizedBox(height: 12),
            Text(
              'Care, close to home.',
              style: Theme.of(context).textTheme.headlineLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'A helping hand for your home and your car, inside your compound.',
            ),
            const SizedBox(height: 24),
            Card(
              color: const Color(0xFFE4EDDF),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.holiday_village_outlined, size: 40),
                    const SizedBox(height: 16),
                    Text(
                      'What needs a little care?',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Choose a service, confirm your building, and save your request.',
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Local build · No charges · Provider dispatch not connected',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            _ServiceCard(
              icon: Icons.car_repair,
              title: 'Car assistance',
              subtitle: 'Battery, tyres and starting problems. Inside the compound only.',
              onTap: () => context.push('/new/car'),
            ),
            const SizedBox(height: 10),
            _ServiceCard(
              icon: Icons.plumbing,
              title: 'Plumbing',
              subtitle: 'Leaks, blocked drains, taps and toilets.',
              onTap: () => context.push('/new/plumbing'),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              key: const Key('requests-button'),
              onPressed: () => context.push('/requests'),
              icon: const Icon(Icons.receipt_long),
              label: const Text('My requests'),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () => context.push('/plan'),
              icon: const Icon(Icons.map_outlined),
              label: const Text('Explore the Phase 2 building plan'),
            ),
            const SizedBox(height: 12),
            ref
                .watch(requestsProvider)
                .when(
                  data: (requests) => Text(
                    '${requests.where((r) => r.status == 'requested').length} saved requests · Stored on this device',
                    style: const TextStyle(fontSize: 12),
                  ),
                  loading: () => const LinearProgressIndicator(),
                  error: (_, _) => TextButton(
                    onPressed: () => ref.invalidate(requestsProvider),
                    child: const Text('Storage unavailable. Retry'),
                  ),
                ),
            const SizedBox(height: 16),
            const Text(
              'دار مصر الأندلس · المرحلة الأولى والمرحلة الثانية',
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
      ),
    ),
  );
}

class _ServiceCard extends StatelessWidget {
  const _ServiceCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => Card(
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      leading: Icon(icon, size: 32),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    ),
  );
}

class BuildingPlanScreen extends StatelessWidget {
  const BuildingPlanScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Phase 2 building plan')),
    body: Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'المرحلة الثانية فقط · Phase 2 only\nPinch or scroll to zoom. This plan is a reference image, not a GPS map.',
          ),
        ),
        Expanded(
          child: InteractiveViewer(
            minScale: 0.5,
            maxScale: 8,
            child: Center(
              child: Image.asset(
                'assets/maps/phase_2.webp',
                semanticLabel: 'Resident-supplied Phase 2 building plan with numbered buildings and labelled gates',
                errorBuilder: (_, _, _) =>
                    const Text('Building plan could not be loaded.'),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Labelled: Gate 1, Gate 4 and maintenance gate. Other gates, counts and coordinates require verification.',
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
    ),
  );
}

class UnknownServiceScreen extends StatelessWidget {
  const UnknownServiceScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Unknown service')),
    body: Center(
      child: TextButton(
        onPressed: () => context.go('/'),
        child: const Text('Choose a service'),
      ),
    ),
  );
}

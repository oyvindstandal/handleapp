import 'package:flutter/material.dart';

void main() {
  runApp(const HandleApp());
}

class HandleApp extends StatelessWidget {
  const HandleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HandleApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2A9D8F)),
        useMaterial3: true,
      ),
      home: const ShoppingHomePage(),
    );
  }
}

class ShoppingHomePage extends StatefulWidget {
  const ShoppingHomePage({super.key});

  @override
  State<ShoppingHomePage> createState() => _ShoppingHomePageState();
}

class _ShoppingHomePageState extends State<ShoppingHomePage> {
  int _selectedIndex = 0;

  final List<String> _tabs = const [
    'Handleliste',
    'Oppskrifter',
    'Planlegging',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tabs[_selectedIndex]),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildBody(),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            selectedIcon: Icon(Icons.shopping_cart),
            label: 'Handleliste',
          ),
          NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined),
            selectedIcon: Icon(Icons.receipt_long),
            label: 'Oppskrifter',
          ),
          NavigationDestination(
            icon: Icon(Icons.event_note_outlined),
            selectedIcon: Icon(Icons.event_note),
            label: 'Planlegging',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: implement item creation flow
        },
        icon: const Icon(Icons.add),
        label: const Text('Nytt element'),
      ),
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return const _ShoppingListPlaceholder();
      case 1:
        return const _RecipesPlaceholder();
      case 2:
        return const _PlanningPlaceholder();
      default:
        return const SizedBox.shrink();
    }
  }
}

class _ShoppingListPlaceholder extends StatelessWidget {
  const _ShoppingListPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dine favorittbutikker',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        Expanded(
          child: ListView(
            children: const [
              _PlaceholderCard(
                title: 'Ukens handleliste',
                description: 'Legg til varer og synkroniser på tvers av enheter.',
                icon: Icons.list_alt,
              ),
              _PlaceholderCard(
                title: 'Delte lister',
                description: 'Inviter familien og hold alle oppdatert i sanntid.',
                icon: Icons.group_outlined,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RecipesPlaceholder extends StatelessWidget {
  const _RecipesPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Oppskrifter',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        const Expanded(
          child: Center(
            child: Text('Oppskriftsintegrasjon kommer i neste iterasjon.'),
          ),
        ),
      ],
    );
  }
}

class _PlanningPlaceholder extends StatelessWidget {
  const _PlanningPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Planlegging',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        const Expanded(
          child: Center(
            child: Text('Måltidsplanlegging og kalenderkobling kommer snart.'),
          ),
        ),
      ],
    );
  }
}

class _PlaceholderCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const _PlaceholderCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Icon(icon, size: 36, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

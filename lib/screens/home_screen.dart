import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import 'list_screen.dart';
import 'about_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LifeDrop'),
        backgroundColor: const Color(0xFFB42332),
        foregroundColor: Colors.white,
      ),
      drawer: const DrawerMenu(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFFFE9EB),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.volunteer_activism,
                    color: Color(0xFFB42332),
                    size: 44,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Give blood.\nShare life.',
                    style: TextStyle(
                      color: Color(0xFF74121D),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Learn what to expect before, during, and after a donation.',
                    style: TextStyle(fontSize: 16, height: 1.4),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            const Text(
              'Explore LifeDrop',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Small steps can make a meaningful difference.',
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 18),
            _buildNavCard(
              context,
              title: 'Donation guide',
              subtitle: 'A simple checklist to help you prepare',
              icon: Icons.checklist,
              color: const Color(0xFFB42332),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ListScreen()),
                );
              },
            ),
            const SizedBox(height: 20),
            _buildNavCard(
              context,
              title: 'Donation essentials',
              subtitle: 'Explore six useful things to know',
              icon: Icons.favorite,
              color: const Color(0xFFCF5A38),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AboutScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: color.withValues(alpha: 0.2),
                child: Icon(icon, color: color, size: 30),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}

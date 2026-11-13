import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const List<_DonationEssential> _gridItems = [
    _DonationEssential(
      'Eligibility',
      'Check your local donation requirements.',
      Icons.fact_check_outlined,
    ),
    _DonationEssential(
      'Preparation',
      'Get ready using guidance from your center.',
      Icons.checklist_outlined,
    ),
    _DonationEssential(
      'Screening',
      'A private health check happens before donation.',
      Icons.health_and_safety_outlined,
    ),
    _DonationEssential(
      'Donation',
      'Trained staff guide you through the process.',
      Icons.volunteer_activism_outlined,
    ),
    _DonationEssential(
      'Recovery',
      'Rest and follow the aftercare instructions provided.',
      Icons.local_cafe_outlined,
    ),
    _DonationEssential(
      'Questions',
      'Your local blood service is the best source for advice.',
      Icons.support_agent_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donation essentials'),
        backgroundColor: const Color(0xFFB42332),
        foregroundColor: Colors.white,
      ),
      drawer: const DrawerMenu(),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 20, 16, 8),
              child: Text(
                'About LifeDrop',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 18),
              child: Text(
                'LifeDrop makes it easier to explore the blood donation '
                'journey. Here are six essentials to keep in mind.',
                style: TextStyle(fontSize: 15, height: 1.4),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final item = _gridItems[index];
                  return Card(
                    elevation: 2,
                    color: const Color(0xFFFFF8F7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: const BorderSide(color: Color(0xFFF3DADD)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 26,
                            backgroundColor: const Color(0xFFFFE9EB),
                            child: Icon(
                              item.icon,
                              size: 26,
                              color: const Color(0xFFB42332),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            item.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            item.description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 12,
                              height: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: _gridItems.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.95,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DonationEssential {
  const _DonationEssential(this.title, this.description, this.icon);

  final String title;
  final String description;
  final IconData icon;
}

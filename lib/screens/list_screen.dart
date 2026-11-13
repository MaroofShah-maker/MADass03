import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  static const List<_GuideItem> _items = [
    _GuideItem(
      'Check local eligibility',
      'Requirements can vary. Review your local blood service guidance first.',
      Icons.fact_check_outlined,
    ),
    _GuideItem(
      'Book or confirm a visit',
      'Follow the appointment instructions from your donation center.',
      Icons.calendar_month_outlined,
    ),
    _GuideItem(
      'Have a regular meal',
      'Eat as you normally would before heading to your appointment.',
      Icons.restaurant_outlined,
    ),
    _GuideItem(
      'Drink water',
      'Stay hydrated and follow any instructions from donation staff.',
      Icons.water_drop_outlined,
    ),
    _GuideItem(
      'Bring the requested ID',
      'Check what identification or documents your center asks you to bring.',
      Icons.badge_outlined,
    ),
    _GuideItem(
      'Share health information',
      'Answer screening questions honestly, including about medicines and travel.',
      Icons.medical_information_outlined,
    ),
    _GuideItem(
      'Ask questions',
      'Donation staff can explain the process and help with any concerns.',
      Icons.question_answer_outlined,
    ),
    _GuideItem(
      'Follow staff directions',
      'The donation team will guide you through each step of your visit.',
      Icons.support_agent_outlined,
    ),
    _GuideItem(
      'Take a short rest',
      'Stay at the center afterward for as long as staff recommend.',
      Icons.chair_alt_outlined,
    ),
    _GuideItem(
      'Care for the donation site',
      'Follow the center’s instructions for the bandage and aftercare.',
      Icons.healing_outlined,
    ),
    _GuideItem(
      'Take it easy afterward',
      'Ask staff when it is appropriate to return to strenuous activity.',
      Icons.directions_walk_outlined,
    ),
    _GuideItem(
      'Contact the donation center',
      'Reach out to them if you have questions after your appointment.',
      Icons.call_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      // CustomScrollView + SliverAppBar for smooth scrolling (BONUS)
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 190.0,
            floating: false,
            pinned: true,
            backgroundColor: const Color(0xFFB42332),
            foregroundColor: Colors.white,
            leading: Builder(
              builder: (ctx) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(ctx).openDrawer(),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Donation guide'),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF8F1725), Color(0xFFE04F5F)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.volunteer_activism,
                    size: 80,
                    color: Colors.white54,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'A little preparation can make your visit feel easier. '
                    'This general checklist is not medical advice; always '
                    'follow your local donation center.',
                    style: TextStyle(fontSize: 14, height: 1.4),
                  ),
                ),
                ...List.generate(_items.length, (index) {
                  final item = _items[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xFFFFE9EB),
                        child: Icon(
                          item.icon,
                          color: const Color(0xFFB42332),
                        ),
                      ),
                      title: Text(
                        item.title,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(item.description),
                    ),
                  );
                }),
              ]),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        tooltip: 'Back (Navigator.pop)',
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}

class _GuideItem {
  const _GuideItem(this.title, this.description, this.icon);

  final String title;
  final String description;
  final IconData icon;
}

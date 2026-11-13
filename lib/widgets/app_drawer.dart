import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/list_screen.dart';
import '../screens/about_screen.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF8F1725), Color(0xFFE04F5F)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.volunteer_activism,
                  color: Colors.white,
                  size: 50,
                ),
                SizedBox(height: 10),
                Text(
                  'LifeDrop',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                Text(
                  'Blood donation awareness',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context); // close drawer
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Donation guide'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ListScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite_outline),
            title: const Text('Donation essentials'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AboutScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

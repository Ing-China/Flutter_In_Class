import 'package:flutter/material.dart';
import 'package:kioway/menu/about_us.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: const Text('CHEA AKA'),
            accountEmail: const Text('ingchina2004@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/cheaAKA.JPG',
                  width: 500,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutUs(),
                ),
              );
            },
            leading: const Icon(Icons.account_circle),
            title: const Text('About Us'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.phone_in_talk),
            title: const Text('Contact Us'),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.phone_in_talk),
            title: const Text('Contact Us'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.question_mark),
            title: const Text('FAQs'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.message),
            title: const Text('Feedback'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.list_alt),
            title: const Text('Term of Use'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.share),
            title: const Text('Invite Friend'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.person),
            title: const Text('My Profile'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.password),
            title: const Text('Change Passoword'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}

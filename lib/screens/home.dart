import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kioway/app_color.dart';
import 'package:kioway/menu/navigation_menu.dart';
import 'package:kioway/screens/contact_screen.dart';
import 'package:kioway/screens/favorites.dart';
import 'package:kioway/screens/group_screen.dart';
import 'package:kioway/screens/new_order.dart';
import 'package:kioway/screens/popular.dart';
import 'package:kioway/screens/product_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Home'),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: ListTile(
                  leading: Icon(Icons.add_shopping_cart),
                  title: Text("New Order"),
                ),
              ),
              const PopupMenuItem(
                value: 2,
                child: ListTile(
                  leading: Icon(Icons.share),
                  title: Text('Popular Item'),
                ),
              ),
              const PopupMenuItem(
                child: ListTile(
                  leading: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  title: Text("Favorite Item"),
                ),
              ),
            ],
            onSelected: (value) {
              switch (value) {
                case 1:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewOrder(),
                    ),
                  );
                  break;
                case 2:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Popular(),
                    ),
                  );
                  break;
                case 3:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Favorites(),
                    ),
                  );
                  break;
              }
            },
          )
        ],
        centerTitle: false,
      ),
      drawer: const NavigationMenu(),
      body: Container(
        child: Stack(
          children: [
            Container(
              height: 80,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            ListView(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              children: <Widget>[
                Container(
                  height: 140,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Card(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(
                            'Good Afternoon',
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                          child: const Text('CHEA AKA'),
                        ),
                        Positioned(
                          left: 10,
                          bottom: 10,
                          child: Row(
                            children: <Widget>[
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(6),
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'My Order'.toUpperCase(),
                                  style: const TextStyle(
                                      color: AppColors.secondaryColor),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                      color: AppColors.primaryColor),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(6),
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Top New'.toUpperCase(),
                                  style: const TextStyle(
                                      color: AppColors.primaryColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          bottom: 10,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: AppColors.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(3),
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/cheaAKA.JPG',
                                  fit: BoxFit.cover,
                                  width: 72,
                                  height: 72,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    cardBox('CONTACT', Icons.person),
                    cardBox('GROUPS', Icons.group),
                    cardBox('PRODUCTS', Icons.shopping_cart),
                    cardBox('CATEGORIES', Icons.category),
                    cardBox('HELP', Icons.question_mark),
                    cardBox('SETTINGS', Icons.settings),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget cardBox(String title, IconData icon) {
    return Container(
      child: Card(
        child: InkWell(
          onTap: () {
            if (title == 'CONTACT') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ContactScreen(),
                ),
              );
            } else if (title == 'GROUPS') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GroupScreen(),
                ),
              );
            } else if (title == 'PRODUCTS') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductScreen(),
                ),
              );
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(180),
                  ),
                ),
                child: Icon(
                  icon,
                  size: 52,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                title.toUpperCase(),
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

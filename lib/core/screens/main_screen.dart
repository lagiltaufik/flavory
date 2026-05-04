import 'package:flavory/core/constants/app_constants.dart';
import 'package:flavory/core/screens/nav_index_mapper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: NavIndexMapper.fromLocation(location),
        onTap: (index) {
          switch (index) {
            case 0:
              context.go(AppConstants.routeHome);
              break;
            case 1:
              context.go(AppConstants.routeSearch);
              break;
            case 2:
              context.go(AppConstants.routeAuth);
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

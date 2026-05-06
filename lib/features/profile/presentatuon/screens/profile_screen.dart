import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavory/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:flavory/features/auth/presentation/cubit/auth_form_cubit/auth_form_cubit.dart';
import 'package:flavory/features/profile/presentatuon/widgets/favorites_tab.dart';
import 'package:flavory/features/profile/presentatuon/widgets/user_data_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: TextButton(
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(LogoutRequested());
                },
                child: Text(
                  "Sign out",
                  style: TextStyle(fontWeight: FontWeight(400)),
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: const Color.fromARGB(255, 174, 229, 157),
                    child: Text(
                      currentUser.email![0].toUpperCase(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight(400),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    child: Text(currentUser.email!),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              const TabBar(
                labelColor: Colors.black,
                indicatorColor: Color.fromARGB(255, 138, 179, 140),
                tabs: [
                  Tab(
                    text: "Favorites",
                  ),
                  Tab(
                    text: "User data",
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(children: [FavoritesTab(), UserDataTab()]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

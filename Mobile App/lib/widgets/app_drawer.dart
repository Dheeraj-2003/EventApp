import 'package:event_hub/screens/friends_screen.dart';
import 'package:event_hub/screens/home_screen.dart';
import 'package:event_hub/screens/myevents_screen.dart';
import 'package:event_hub/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(children: [
        DrawerHeader(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
                Theme.of(context).colorScheme.primaryContainer
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.event,
                size: 50,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                'Event-Hub',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary, fontSize: 30),
              )
            ],
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => const HomeScreen()));
          },
          title: Text(
            'Home',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 20,
                color: Theme.of(context).colorScheme.onBackground),
          ),
          leading: const Icon(Icons.home),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => FriendsScreen()));
          },
          title: Text(
            'Friends',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 20,
                color: Theme.of(context).colorScheme.onBackground),
          ),
          leading: const Icon(Icons.people),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => MyEventsScreen()));
          },
          title: Text(
            'My Events',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 20,
                color: Theme.of(context).colorScheme.onBackground),
          ),
          leading: const Icon(Icons.event_available_outlined),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SettingsScreen()));
          },
          title: Text(
            'Settings',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 20,
                color: Theme.of(context).colorScheme.onBackground),
          ),
          leading: const Icon(Icons.settings),
        )
      ]),
    );
  }
}

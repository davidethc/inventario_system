import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfilePague extends StatefulWidget {
  ProfilePague({Key? key}) : super(key: key);

  @override
  _ProfilePagueState createState() => _ProfilePagueState();
}

class _ProfilePagueState extends State<ProfilePague> {
  //get auth service
  final authService = Supabase.instance.client.auth;
  //logut button press
  void logout() async {
    await authService.signOut();
  }

  final current = Supabase.instance.client.auth.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        actions: [IconButton(onPressed: logout, icon: Icon(Icons.logout))],
      ),
      body: Center(child: Text(current?.email ?? 'No user logged in')),
      // body: Center(child: Text(current.email ?? 'No user logged in')),
      // body: Center(child: Text(current.email ?? 'No user logged in')),
    );
  }
}

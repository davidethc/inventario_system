import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:system_inventario/pagues/login_pague.dart';
import 'package:system_inventario/pagues/profile_pague.dart';

/*
Auth gate - this will continuosly listen for auth state changes 

--------------------------------------------------------------------------------

unauthenticated - show login screen
authenticated - profile page

*/
class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      //listen to auth state changes
      stream: Supabase.instance.client.auth.onAuthStateChange,
      //build apropiete page based n auth state
      builder: (context, snapshot) {
        //loanding
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        //check if user is authenticated
        final session = snapshot.hasData ? snapshot.data!.session : null;
        if (session != null) {
          return ProfilePague();
        } else {
          return LoginPague();
        }
      },
    );
  }
}

import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;
  //sing in whit email and password
  Future<AuthResponse> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    return await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  //sing up whit email and password
  Future<AuthResponse> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    return await _supabase.auth.signUp(email: email, password: password);
  }

  //sing out
  Future<void> singOut() async {
    await _supabase.auth.signOut();
  }

  //get user email
  String? getUserEmail() {
    return _supabase.auth.currentUser?.email;
  }
}

//sing in  email and password

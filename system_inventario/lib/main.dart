import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:system_inventario/auth/auth_gate.dart';
import 'package:system_inventario/pagues/register_pagues.dart';

void main() async {
  await Supabase.initialize(
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im50Y3Z0YXZnZHBteHZybW50aWtxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDM5Nzg0NjYsImV4cCI6MjA1OTU1NDQ2Nn0.PJIyJgJYi914mlkOpO0DmLk22zvbgvZ-xhQ_hQ0jR2c",
    url: "https://ntcvtavgdpmxvrmntikq.supabase.co",
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
      routes: {'/register': (_) => RegisterPague()},
    );
  }
}

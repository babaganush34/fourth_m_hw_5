import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fourth_m_hw_5/data/api/firebase_helper.dart';
import 'package:fourth_m_hw_5/ui/auth/auth_page.dart';
import 'package:fourth_m_hw_5/ui/settings_page/theme_cubit/theme_cubit.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final FirebaseHelper _firebaseHelper = FirebaseHelper(
    googleSignIn: GoogleSignIn.instance,
  );

  void _logOut() async {
    await _firebaseHelper.signOut();
    if (!mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const AuthPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeCubit>().state.theme;
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 24),
            CircleAvatar(
              radius: 48,
              backgroundImage: user?.photoURL != null
                  ? NetworkImage(user!.photoURL!)
                  : null,
              child: user?.photoURL == null
                  ? const Icon(Icons.person, size: 48)
                  : null,
            ),
            SizedBox(height: 16),
            Text(
              user?.displayName ?? 'Нет имени',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(user?.email ?? 'Нет почтф'),
            SizedBox(height: 32),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Тема'),
                Switch(
                  value: theme,
                  onChanged: (value) {
                    context.read<ThemeCubit>().changeTheme(value);
                  },
                ),
              ],
            ),
            const Divider(),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _logOut,
                icon: Icon(Icons.logout),
                label: Text('Выйти'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

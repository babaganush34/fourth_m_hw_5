import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final class FirebaseHelper {
  FirebaseHelper({required this.googleSignIn});

  final GoogleSignIn googleSignIn;

  Future<UserCredential?> signInWithGoogle() async {
    try {
      await googleSignIn.initialize();
      final GoogleSignInAccount googleUser = await googleSignIn.authenticate();
      final String? idToken = googleUser.authentication.idToken;
      if (idToken == null) {
        return null;
      }
      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      return null;
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await googleSignIn.signOut();
  }
}

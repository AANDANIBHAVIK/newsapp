import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

void logout() async {
  GoogleSignIn googleSignIn = GoogleSignIn();
  await googleSignIn.signOut();
}

Future<bool> googlelogin() async {
  GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  var credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  await firebaseAuth.signInWithCredential(credential);

  // Once signed in, return the UserCredential
  return checkUser();
}
bool checkUser() {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    return true;
  }
  return false;
}
Future<String> loginemailpass(String email, String password) async {
  // FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // firebaseAuth.createUserWithEmailAndPassword(email: e1, password: p1);

  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return "Success";
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
      return "No user found for that email.";
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
      return "Wrong password provided for that user.";
    }
  }
  return "";
}


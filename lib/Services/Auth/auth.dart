import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Email signup
  Future<User> signUpWithEmail(String email, String password) async {
    final UserCredential userCred = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userCred.user;
  }
  //Verify Email on SignUp
  Future<void> verifyEmailOnSignUp() async{
    final user = _auth.currentUser;
    return await user.sendEmailVerification();
  }

  //Check if user has verified their email

  Future<bool> checkEmailVerified() async{
    final user = _auth.currentUser;
    await user.reload();
    return user.emailVerified;
  }


  //Email login
  Future<User> signInWithEmail(String email, String password) async {
    final UserCredential userCred = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return userCred.user;
  }

  //SignIn with google
  Future<UserCredential> signInWithGoogle() async{
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final GoogleAuthCredential credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    return await _auth.signInWithCredential(credential);


  }
  //SignIn with facebook
  //

  //forgot password

  Future forgotPassword(String email) async {
    return await _auth.sendPasswordResetEmail(email: email);
  }

  //Logout
  Future<void> signOut() async {
    return await _auth.signOut();
  }
}

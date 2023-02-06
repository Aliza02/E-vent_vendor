import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;

Future SignUp(
    {required String email,
    required String password,
    required String fullName,
    required String businessName,
    required String businessType,
    required String businessLocation,
    required String cnic,
    required String contactNumber}) async {
  try {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User user = userCredential.user!;

    await firestore.collection('users').doc(user.uid).set({
      'email': email,
      'uid': user.uid,
      'password': password,
      'fullName': fullName,
      'businessName': businessName,
      'businessType': businessType,
      'businessLocation': businessLocation,
      'cnic': cnic,
      'contactNumber': contactNumber,
    });
  } on FirebaseAuthException catch (e) {
    print(e.message);
  }
}

Future Signin({required String email, required String password}) async {
  try {
    UserCredential userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    User user = userCredential.user!;
  } on FirebaseAuthException catch (e) {
    print(e.message);
  }
}

Future Signout() async {
  await auth.signOut();
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<String?> registerWithPhoneNumber(String phone, String password) async {
  try {
    final FirebaseAuth auth = FirebaseAuth.instance;

    String? verificationId;

    await auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Otomatik doğrulama tamamlanırsa
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print("Doğrulama başarısız: ${e.message}");
      },
      codeSent: (String verId, int? resendToken) {
        verificationId = verId;
      },
      codeAutoRetrievalTimeout: (String verId) {
        verificationId = verId;
      },
    );

    return verificationId;
  } catch (e) {
    print("Telefonla kayıt hatası: $e");
    return null;
  }
}

Future<void> verifySMSCode(String verificationId, String smsCode) async {
  try {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    // Doğrulama sonrası giriş yap
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    print("Telefon numarası doğrulandı ve giriş yapıldı.");

    // Kullanıcıyı Firestore'a ekleyin (şifre gibi ekstra veriler için)
    await addUserToFirestore(userCredential.user!.uid, smsCode);
  } catch (e) {
    print("SMS kodu doğrulama hatası: $e");
  }
}

Future<void> addUserToFirestore(String? userId, String password) async {
  if (userId == null) return;

  try {
    await FirebaseFirestore.instance.collection('users').doc(userId).set({
      'password': password,
      'createdAt': FieldValue.serverTimestamp(),
    });
    print("Kullanıcı bilgileri Firestore'a kaydedildi.");
  } catch (e) {
    print("Firestore kaydetme hatası: $e");
  }
}

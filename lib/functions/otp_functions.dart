import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Telefon numarası ile kayıt olma
Future<String?> registerWithPhoneNumber(
    String phone, String name, String surname, String password) async {
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
        print("Doğrulama başarısız: ");
        if (e.code == 'invalid-phone-number') {
          print("Geçersiz telefon numarası.");
        }
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

// SMS kodunu dogrula
Future<void> verifySMSCode(
    String verificationId, String smsCode, String name, String surname) async {
  try {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    // Doğrulama sonrası giriş yap
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    print("Telefon numarası doğrulandı ve giriş yapıldı.");

    // Kullanıcıyı Firestore'a ekleyin
    await addUserToFirestore(userCredential.user!.uid, name, surname);
  } catch (e) {
    print("SMS kodu doğrulama hatası: $e");
  }
}

// Kullanıcıyı Firestore'a ekle
Future<void> addUserToFirestore(
    String userId, String name, String surname) async {
  try {
    await FirebaseFirestore.instance.collection('users').doc(userId).set({
      'name': name,
      'surname': surname,
      'createdAt': FieldValue.serverTimestamp(),
    });
    print("Kullanıcı bilgileri Firestore'a kaydedildi.");
  } catch (e) {
    print("Firestore kaydetme hatası: $e");
  }
}

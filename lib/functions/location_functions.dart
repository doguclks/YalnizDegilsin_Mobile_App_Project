import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

Future<Position> getCurrentLocation() async {
  LocationPermission permission = await Geolocator.requestPermission();
  if (permission == LocationPermission.whileInUse ||
      permission == LocationPermission.always) {
    return await Geolocator.getCurrentPosition();
  } else {
    throw Exception('Konum izni gerekli!');
  }
}

Future<void> requestLocationPermission() async {
  var status = await Permission.location.request();
  if (status.isGranted) {
    print("Konum izni verildi!");
  } else if (status.isDenied) {
    print("Konum izni reddedildi!");
  } else if (status.isPermanentlyDenied) {
    print(
        "Konum izni kalıcı olarak reddedildi. Ayarlardan izin vermeniz gerekiyor.");
    await openAppSettings();
  }
}

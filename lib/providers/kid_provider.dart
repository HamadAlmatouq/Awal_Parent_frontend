import 'package:bkid_frontend/services/kid_services.dart';
import 'package:flutter/material.dart';

class KidProvider extends ChangeNotifier {
  Future<bool> createKid({
    required String name,
    required String civilId,
    required String mobile,
    required String dob,
    required String email,
  }) async {
    try {
      await KidServices().createKid(
        name: name,
        civilId: civilId,
        mobile: mobile,
        dob: dob,
        email: email,
      );
      notifyListeners();
      return true;
    } catch (e) {
      print("Kid creation error: $e");
      return false;
    }
  }
}

import 'package:bkid_frontend/services/kid_services.dart';
import 'package:flutter/material.dart';

class KidProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _kids = [];

  List<Map<String, dynamic>> get kids => _kids;

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
      await fetchKidsByParent(); // Fetch the updated list of kids
      return true;
    } catch (e) {
      print("Kid creation error: $e");
      return false;
    }
  }

  Future<void> fetchKidsByParent([String? token]) async {
    try {
      if (token != null) {
        _kids = await KidServices().getKidsByParent(token);
        // No need to fetch balance, savings, and steps separately
      } else {
        // Handle case where token is not provided
        print("Token is required to fetch kids");
      }
      notifyListeners();
    } catch (e) {
      print("Fetch kids error: $e");
    }
  }
}

import 'package:bkid_frontend/services/client.dart';
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
    // Make token optional
    try {
      print('Fetching kids from API...');
      // Update the endpoint to match your backend API
      final response =
          await Client.dio.get('/parent/getKidsByParent'); // Fixed endpoint
      print('API Response: ${response.data}');

      if (response.statusCode == 200) {
        final List<dynamic> kidsData = response.data;
        _kids = kidsData.map((kid) {
          print('Processing kid data: $kid');
          return {
            'Kname': kid['Kname'] ?? '',
            'balance': (kid['balance'] as num?)?.toDouble() ?? 0.0,
            'savings': (kid['savings'] as num?)?.toDouble() ?? 0.0,
            'steps': (kid['steps'] as num?)?.toInt() ?? 0,
            'points': (kid['points'] as num?)?.toInt() ??
                0, // Make sure to parse points as integer
          };
        }).toList();

        print('Processed kids data: $_kids');
        notifyListeners();
      }
    } catch (e) {
      print('Error fetching kids: $e');
      // Set empty list instead of throwing to prevent app crash
      _kids = [];
      notifyListeners();
    }
  }
}

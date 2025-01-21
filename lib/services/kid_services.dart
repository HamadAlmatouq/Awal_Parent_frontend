import 'package:bkid_frontend/services/client.dart';
import 'package:dio/dio.dart';

class KidServices {
  Future<void> createKid({
    required String name,
    required String civilId,
    required String mobile,
    required String dob,
    required String email,
  }) async {
    try {
      final data = {
        "Kname": name,
        "email": email,
        "birthday": dob,
        "civilID": civilId,
        "mobile": mobile,
      };
      Response response = await Client.dio.post(
        "/parent/createKid",
        data: data,
      );
      print("Kid creation response: ${response.data}");
    } catch (error) {
      if (error is DioError) {
        if (error.response != null) {
          print("Kid creation error response: ${error.response?.data}");
          throw Exception(error.response?.data['message'] ?? 'Unknown error');
        } else {
          print("Kid creation error: ${error.message}");
          throw Exception(error.message);
        }
      } else {
        print("Kid creation error: $error");
        throw Exception(error.toString());
      }
    }
  }

  Future<List<Map<String, dynamic>>> getKidsByParent(String token) async {
    try {
      Response response = await Client.dio.get(
        "/parent/getKidsByParent",
      );

      if (response.statusCode == 200) {
        List<Map<String, dynamic>> kids = (response.data as List).map((kid) {
          return {
            'Kname': kid['Kname'],
            'balance': kid['balance'] ?? 0.0,
            'savings': kid['savings'] ?? 0.0,
            'steps': kid['steps'] ?? 0,
            'points': kid['points'] ?? 0, // Make sure points is included
          };
        }).toList();
        return kids;
      } else {
        throw Exception('Failed to load kids');
      }
    } catch (e) {
      print('Error in getKidsByParent: $e');
      throw Exception('Failed to load kids: $e');
    }
  }
}

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
      if (error is DioException) {
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
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );
      return List<Map<String, dynamic>>.from(response.data);
    } catch (error) {
      if (error is DioException) {
        if (error.response != null) {
          print("Get kids error response: ${error.response?.data}");
          throw Exception(error.response?.data['message'] ?? 'Unknown error');
        } else {
          print("Get kids error: ${error.message}");
          throw Exception(error.message);
        }
      } else {
        print("Get kids error: $error");
        throw Exception(error.toString());
      }
    }
  }
}

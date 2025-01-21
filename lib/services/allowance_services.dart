import 'package:bkid_frontend/services/client.dart';
import 'package:dio/dio.dart';

class AllowanceServices {
  Future<void> createAllowance(Map<String, dynamic> allowanceData) async {
    try {
      Response response = await Client.dio.post(
        "/parent/allowance",
        data: allowanceData,
      );
      print("Allowance creation response: ${response.data}");
    } catch (error) {
      if (error is DioError) {
        if (error.response != null) {
          print("Allowance creation error response: ${error.response?.data}");
          throw Exception(error.response?.data['message'] ?? 'Unknown error');
        } else {
          print("Allowance creation error: ${error.message}");
          throw Exception(error.message);
        }
      } else {
        print("Allowance creation error: $error");
        throw Exception(error.toString());
      }
    }
  }
}

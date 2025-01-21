import 'package:bkid_frontend/services/client.dart';
import 'package:dio/dio.dart';

class TransferServices {
  Future<void> createTransfer(Map<String, dynamic> transferData) async {
    try {
      Response response = await Client.dio.post(
        "/parent/transfer",
        data: transferData,
      );
      print("Transfer creation response: ${response.data}");
    } catch (error) {
      if (error is DioError) {
        if (error.response != null) {
          print("Transfer creation error response: ${error.response?.data}");
          if (error.response?.data['error'] == 'Parent not found') {
            throw Exception(
                'Parent not found. Please check your account details.');
          } else {
            throw Exception(error.response?.data['message'] ?? 'Unknown error');
          }
        } else {
          print("Transfer creation error: ${error.message}");
          throw Exception(error.message);
        }
      } else {
        print("Transfer creation error: $error");
        throw Exception(error.toString());
      }
    }
  }
}

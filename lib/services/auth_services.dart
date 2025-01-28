import 'package:bkid_frontend/services/client.dart';
import 'package:dio/dio.dart';

class AuthServices {

  // *
  // Sign up
  // *

  Future<String> signup({
    required String username,
    required String password,
    required String pname, 
    required String email, 
  }) async {
    late String token;
    try {
      final data = {
        "username": username,
        "password": password,
        "Pname": pname, 
        "email": email, 
      };
      print("Signup request payload: $data");
      Response response = await Client.dio.post(
        "/auth/signup",
        data: data,
      );
      print("Signup response: ${response.data}");
      token = response.data["token"];
      print("Token received: $token");
    } catch (error) {
      if (error is DioError) {
        if (error.response != null) {
          print("Signup error response: ${error.response?.data}");
          throw Exception(error.response?.data['message'] ?? 'Unknown error');
        } else {
          print("Signup error: ${error.message}");
          throw Exception(error.message);
        }
      } else {
        print("Signup error: $error");
        throw Exception(error.toString());
      }
    }
    return token;
  }

  // *
  // Sign in
  // *

  Future<String> signin({
    required String username,
    required String password,
  }) async {
    late String token;
    try {
      final data = {
        "username": username,
        "password": password,
      };
      print("Signin request payload: $data");
      Response response = await Client.dio.post(
        "/auth/signin",
        data: data,
      );
      print("Signin response: ${response.data}");
      token = response.data["token"];
      print("Token received: $token");
    } catch (error) {
      if (error is DioError) {
        if (error.response != null) {
          print("Signin error response: ${error.response?.data}");
          throw Exception(error.response?.data['message'] ?? 'Unknown error');
        } else {
          print("Signin error: ${error.message}");
          throw Exception(error.message);
        }
      } else {
        print("Signin error: $error");
        throw Exception(error.toString());
      }
    }
    return token;
  }
}

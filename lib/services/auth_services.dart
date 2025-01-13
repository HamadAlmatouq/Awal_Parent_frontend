import 'package:bkid_frontend/services/client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AuthServices {
  //Sign up
  Future<String> signup({
    required String username,
    required String password,
  }) async {
    late String token;
    try {
      final data = {
        "username": username,
        "password": password,
      };
      print("Sign up request payload: $data");
      Response response = await Client.dio.post(
        "/auth/signup",
        data: data,
        // data: FormData.fromMap({
        //   "username": username,
        //   "password": password,
        // }),
      );

      print("Signup response: ${response.data}");
      token = response.data["token"];
      print("Token received: $token");
    } catch (error) {
      print("Signup error: $error");
      token = "";
    }
    return token;
  }

  //Sign in
  Future<String> signin({
    required String username,
    required String password,
  }) async {
    Response response = await Client.dio.post("/auth/signin", data: {
      "username": username,
      "password": password,
    });
    return response.data["token"];
  }
}

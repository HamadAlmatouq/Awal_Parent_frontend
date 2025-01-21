import 'package:bkid_frontend/services/client.dart';
import 'package:dio/dio.dart';

class TaskServices {
  Future<void> createTask(Map<String, dynamic> taskData) async {
    try {
      Response response = await Client.dio.post(
        "/parent/createTask",
        data: taskData,
      );
      print("Task creation response: ${response.data}");
    } catch (error) {
      if (error is DioError) {
        if (error.response != null) {
          print("Task creation error response: ${error.response?.data}");
          throw Exception(error.response?.data['message'] ?? 'Unknown error');
        } else {
          print("Task creation error: ${error.message}");
          throw Exception(error.message);
        }
      } else {
        print("Task creation error: $error");
        throw Exception(error.toString());
      }
    }
  }

  Future<List<Map<String, dynamic>>> getTasksByKidName(String kidName) async {
    try {
      Response response = await Client.dio.get(
        "/parent/getTasksByKidName",
        queryParameters: {"Kname": kidName},
      );
      return List<Map<String, dynamic>>.from(response.data);
    } catch (error) {
      if (error is DioError) {
        if (error.response != null) {
          print("Get tasks error response: ${error.response?.data}");
          throw Exception(error.response?.data['message'] ?? 'Unknown error');
        } else {
          print("Get tasks error: ${error.message}");
          throw Exception(error.message);
        }
      } else {
        print("Get tasks error: $error");
        throw Exception(error.toString());
      }
    }
  }

  Future<void> deleteTask(String title, String kname) async {
    try {
      print('Sending delete request with title: $title and Kname: $kname');
      Response response = await Client.dio.delete(
        "/parent/deleteTask",
        data: {"title": title, "Kname": kname},
      );
      print("Task deletion response: ${response.data}");
    } catch (error) {
      if (error is DioError) {
        if (error.response != null) {
          print("Task deletion error response: ${error.response?.data}");
          throw Exception(error.response?.data['message'] ?? 'Unknown error');
        } else {
          print("Task deletion error: ${error.message}");
          throw Exception(error.message);
        }
      } else {
        print("Task deletion error: $error");
        throw Exception(error.toString());
      }
    }
  }
}

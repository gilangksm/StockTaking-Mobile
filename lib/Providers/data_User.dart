import 'package:stoktaking_app/Services/api_handler.dart';

class DataUser {
  final APIHandler _apiHandler = APIHandler();

  Future<Map<String, dynamic>> fetchItems() async {
    final response = await _apiHandler.getRequest("Users");
    return response;
  }

  Future<Map<String, dynamic>> postRequest(String endpoint, Map<String, dynamic> data) async{
    final response = await _apiHandler.postRequest(endpoint, data);
    return response; // Pastikan Anda memiliki definisi method _handleResponse dari APIHandler
  }
}
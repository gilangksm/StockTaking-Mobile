import '../Services/api_handler.dart';

class DataProduction {
  final APIHandler _apiHandler = APIHandler();

  Future<Map<String, dynamic>> fetchItems() async {
    final response = await _apiHandler.getRequest("DataProduction");
    return response;
  }

  Future<Map<String, dynamic>> sendData(Map<String, dynamic> data) async {
    final response = await _apiHandler.postRequest("DataProduction", data);
    return response;
  }

  Future<Map<String, dynamic>> updateData(String itemId, Map<String, dynamic> data) async {
    final response = await _apiHandler.putRequest("DataProduction/$itemId", data);
    return response;
  }
}

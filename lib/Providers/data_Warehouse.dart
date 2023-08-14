import 'package:stoktaking_app/Services/api_handler.dart';

class DataWarehouse {
  final APIHandler _apiHandler = APIHandler();

  Future<Map<String, dynamic>> fetchItems() async {
    final response = await _apiHandler.getRequest("DataWarehouse");
    return response;
  }


}
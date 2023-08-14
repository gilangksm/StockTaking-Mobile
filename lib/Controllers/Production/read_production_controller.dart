import 'package:flutter/material.dart';
import 'package:stoktaking_app/View/Production/read_production_view.dart';

class ReadProductionController extends StatefulWidget {
  @override
  _ReadProductionControllerState createState() => _ReadProductionControllerState();
}

class _ReadProductionControllerState extends State<ReadProductionController> {
  DateTime selectedDate = DateTime.now();


  Future<void> fetchData(DateTime dateTime) async {
    // Implementasi logika pengambilan data dari API berdasarkan dateTime
    // Simpan hasil pengambilan data ke stockTakingDataVmiWarehouse dan lakukan perubahan pada actualqtyControllers jika diperlukan
  }

  @override
  void initState() {
    super.initState();
    fetchData(selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return ReadProductionView(
      selectedDate: selectedDate,
      onDateChanged: (value) {
        setState(() {
          selectedDate = value;
        });
        fetchData(selectedDate);
      },
    );
  }
}

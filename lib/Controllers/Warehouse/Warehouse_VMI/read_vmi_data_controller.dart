import 'package:flutter/material.dart';
import 'package:stoktaking_app/View/Warehouse/Warehouse_VMI/read_vmi_view.dart';

class ReadVmiDataController extends StatefulWidget {
  @override
  _ReadVmiDataControllerState createState() => _ReadVmiDataControllerState();
}

class _ReadVmiDataControllerState extends State<ReadVmiDataController> {
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
    return ReadVmiView(
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

import 'package:flutter/material.dart';
import 'package:stoktaking_app/View/Warehouse/Warehouse_NonVMI/read_nonvmi_view.dart';

class ReadNonVmiDataController extends StatefulWidget {
  @override
  _ReadNonVmiDataControllerState createState() =>
      _ReadNonVmiDataControllerState();
}

class _ReadNonVmiDataControllerState extends State<ReadNonVmiDataController> {
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
    return ReadNonVmiView(
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

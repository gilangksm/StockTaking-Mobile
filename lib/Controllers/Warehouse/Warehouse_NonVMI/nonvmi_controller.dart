import 'package:flutter/material.dart';
import 'package:stoktaking_app/Models/Warehouse/stocktakingdatanonvmi.dart';
import 'package:stoktaking_app/View/Warehouse/Warehouse_NonVMI/non_vmi_screen.dart';

class NonVmiController extends StatefulWidget {
  final String plannerCode;

  NonVmiController({required this.plannerCode});

  @override
  _NonVmiControllerState createState() => _NonVmiControllerState();
}

class _NonVmiControllerState extends State<NonVmiController> {
  List<TextEditingController> actualqtyControllers = [];
  late StockTakingDataNonVmiWarehouse stockTakingDataNonVmiWarehouse;
  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    stockTakingDataNonVmiWarehouse = StockTakingDataNonVmiWarehouse(
      plant: '',
      description: '',
      createdBy: '',
      plannedCountDate: '',
      storageLocation: '',
      plannerCode: widget.plannerCode,
      name: '',
      serialNumber: '',
      tagNumber: '',
      storageBin: '',
      stockItemNonVmiWarehouses: [
        stockItemNonVmiWarehouse(
          material: '',
          description: '',
          actualqty: 0,
          unit: '',
        ),
      ],
    );

    actualqtyControllers = List.generate(
      stockTakingDataNonVmiWarehouse.stockItemNonVmiWarehouses.length,
      (index) => TextEditingController(),
    );
  }

  @override
  void dispose() {
    for (var controller in actualqtyControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void onSaveButtonPressed() {
    setState(() {
      isSaving = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isSaving = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return NonVmiView(
      stockTakingDataNonVmiWarehouse: stockTakingDataNonVmiWarehouse,
      actualqtyControllers: actualqtyControllers,
      isSaving: isSaving,
      onSaveButtonPressed: onSaveButtonPressed,
    );
  }
}

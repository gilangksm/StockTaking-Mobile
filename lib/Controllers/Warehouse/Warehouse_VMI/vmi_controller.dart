import 'package:flutter/material.dart';
import 'package:stoktaking_app/Models/Warehouse/stocktakingdatavmiwarehouse.dart';
import 'package:stoktaking_app/View/Warehouse/Warehouse_VMI/vmi_view.dart';

class VmiController extends StatefulWidget {
  final String plannerCode;

  VmiController({required this.plannerCode});

  @override
  _VmiControllerState createState() => _VmiControllerState();
}

class _VmiControllerState extends State<VmiController> {
  List<TextEditingController> actualqtyControllers = [];
  late StockTakingDataVmiWarehouse stockTakingDataVmiWarehouse;
  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    stockTakingDataVmiWarehouse = StockTakingDataVmiWarehouse(
      plant: '',
      description: '',
      vCode: '',
      vName: '',
      createdBy: '',
      plannedCountDate: '',
      storageLocation: '',
      plannerCode: widget.plannerCode,
      name: '',
      serialNumber: '',
      tagNumber: '',
      storageBin: '',
      stockItemVmiWarehouses: [
        stockItemVmiWarehouse(
          material: '',
          description: '',
          actualqty: 0,
          unit: '',
        ),
      ],
    );

    actualqtyControllers = List.generate(
      stockTakingDataVmiWarehouse.stockItemVmiWarehouses.length,
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
    return VmiView(
      stockTakingDataVmiWarehouse: stockTakingDataVmiWarehouse,
      actualqtyControllers: actualqtyControllers,
      isSaving: isSaving,
      onSaveButtonPressed: onSaveButtonPressed,
    );
  }
}

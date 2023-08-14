import 'package:flutter/material.dart';
import 'package:stoktaking_app/Models/Production/stocktakingdataproduction.dart';
import 'package:stoktaking_app/Providers/data_Production.dart';
import 'package:stoktaking_app/View/Production/production_data_view.dart';

class ProductionDetailController extends StatefulWidget {
  final String storageLocation;

  ProductionDetailController({required this.storageLocation});

  @override
  _ProductionDetailControllerState createState() =>
      _ProductionDetailControllerState();
  final DataProduction _dataProduction = DataProduction();
}

class _ProductionDetailControllerState
    extends State<ProductionDetailController> {
  List<TextEditingController> actualqtyControllers = [];
  late StockTakingDataProduction
      stockTakingDataProduction; // Deklarasikan stockTakingData sebagai variabel late
  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    stockTakingDataProduction = StockTakingDataProduction(
      plant: '',
      description: '',
      createdBy: '',
      plannedCountDate: '',
      storageLocation: widget.storageLocation,
      plannerCode: '',
      serialNumber: '',
      tagNumber: '',
      storageBin: '',
      stockItemProductions: [
        StockItemProduction(
          material: '',
          description: '',
          actualqty: 0,
          unit: '',
        ),
      ],
    );

    actualqtyControllers = List.generate(
        stockTakingDataProduction.stockItemProductions.length,
        (index) => TextEditingController());
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
    return ProductionDetailView(
      stockTakingDataProduction: stockTakingDataProduction,
      actualqtyControllers: actualqtyControllers,
      isSaving: isSaving,
      onSaveButtonPressed: onSaveButtonPressed,
    );
  }
}

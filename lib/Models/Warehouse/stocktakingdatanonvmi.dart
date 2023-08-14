class StockTakingDataNonVmiWarehouse {
  final String plant;
  final String description;
  final String createdBy;
  final String plannedCountDate;
  final String storageLocation;
  final String plannerCode;
  final String name;
  final String serialNumber;
  final String tagNumber;
  final String storageBin;
  final List<stockItemNonVmiWarehouse> stockItemNonVmiWarehouses;

  StockTakingDataNonVmiWarehouse({
    required this.plant,
    required this.description,
    required this.createdBy,
    required this.plannedCountDate,
    required this.storageLocation,
    required this.plannerCode,
    required this.name,
    required this.serialNumber,
    required this.tagNumber,
    required this.storageBin,
    required this.stockItemNonVmiWarehouses,
  });
}

class stockItemNonVmiWarehouse {
  final String material;
  final String description;
  final int actualqty;
  final String unit;

  stockItemNonVmiWarehouse({
    required this.material,
    required this.description,
    required this.actualqty,
    required this.unit,
  });
}

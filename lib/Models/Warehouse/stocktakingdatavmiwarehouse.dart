class StockTakingDataVmiWarehouse {
  final String plant;
  final String description;
  final String vCode;
  final String vName;
  final String createdBy;
  final String plannedCountDate;
  final String storageLocation;
  final String plannerCode;
  final String name;
  final String serialNumber;
  final String tagNumber;
  final String storageBin;

  final List<stockItemVmiWarehouse> stockItemVmiWarehouses;

  StockTakingDataVmiWarehouse({
    required this.plant,
    required this.description,
    required this.vCode,
    required this.vName,
    required this.createdBy,
    required this.plannedCountDate,
    required this.storageLocation,
    required this.plannerCode,
    required this.name,
    required this.serialNumber,
    required this.tagNumber,
    required this.storageBin,
    required this.stockItemVmiWarehouses,
  });
}

class stockItemVmiWarehouse {
  final String material;
  final String description;
  final int actualqty;
  final String unit;

  stockItemVmiWarehouse({
    required this.material,
    required this.description,
    required this.actualqty,
    required this.unit,
  });
}

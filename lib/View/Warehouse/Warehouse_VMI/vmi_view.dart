import 'package:flutter/material.dart';
import 'package:stoktaking_app/Models/Warehouse/stocktakingdatavmiwarehouse.dart';

class VmiView extends StatefulWidget {
  final StockTakingDataVmiWarehouse stockTakingDataVmiWarehouse;
  final List<TextEditingController> actualqtyControllers;
  final bool isSaving;
  final VoidCallback onSaveButtonPressed;

  VmiView({
    required this.stockTakingDataVmiWarehouse,
    required this.actualqtyControllers,
    required this.isSaving,
    required this.onSaveButtonPressed,
  });

  @override
  _VmiViewState createState() => _VmiViewState();
}

class _VmiViewState extends State<VmiView> {
  String searchValue = '';

  @override
  Widget build(BuildContext context) {
    List<DataRow> filteredRows =
        widget.stockTakingDataVmiWarehouse.stockItemVmiWarehouses.where((item) {
      return item.material.toLowerCase().contains(searchValue.toLowerCase()) ||
          item.description.toLowerCase().contains(searchValue.toLowerCase());
    }).map((item) {
      final index = widget.stockTakingDataVmiWarehouse.stockItemVmiWarehouses
          .indexOf(item);
      return DataRow(
        cells: <DataCell>[
          DataCell(Text(item.material)),
          DataCell(Text(item.description)),
          DataCell(
            TextFormField(
              controller: widget.actualqtyControllers[index],
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a value';
                }
                return null;
              },
            ),
          ),
          DataCell(Text(item.unit)),
        ],
      );
    }).toList();

    void _showSnackBar(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: Duration(seconds: 2),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Taking Data VMI'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Search',
                    prefixIcon: Icon(Icons.search, color: Colors.green[700]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchValue = value;
                    });
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    buildInfoRow(
                        "Plant", widget.stockTakingDataVmiWarehouse.plant),
                    SizedBox(height: 8),
                    buildInfoRow("Description",
                        widget.stockTakingDataVmiWarehouse.description),
                    SizedBox(height: 8),
                    buildInfoRow("Vendor Code",
                        widget.stockTakingDataVmiWarehouse.vCode),
                    SizedBox(height: 8),
                    buildInfoRow("Vendor Name",
                        widget.stockTakingDataVmiWarehouse.vName),
                    SizedBox(height: 8),
                    buildInfoRow("Created By",
                        widget.stockTakingDataVmiWarehouse.createdBy),
                    SizedBox(height: 8),
                    buildInfoRow(
                      "Planned Count Date",
                      widget.stockTakingDataVmiWarehouse.plannedCountDate,
                    ),
                    SizedBox(height: 8),
                    buildInfoRow(
                      "Storage Location",
                      widget.stockTakingDataVmiWarehouse.storageLocation,
                    ),
                    SizedBox(height: 8),
                    buildInfoRow(
                      "Planner Code",
                      widget.stockTakingDataVmiWarehouse.plannerCode +
                          " " +
                          widget.stockTakingDataVmiWarehouse.name,
                    ),
                    SizedBox(height: 8),
                    buildInfoRow(
                      "Serial Number",
                      widget.stockTakingDataVmiWarehouse.serialNumber,
                    ),
                    SizedBox(height: 8),
                    buildInfoRow("Tag Number",
                        widget.stockTakingDataVmiWarehouse.tagNumber),
                    SizedBox(height: 8),
                    buildInfoRow("Storage Bin",
                        widget.stockTakingDataVmiWarehouse.storageBin),
                    SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Text(
                              'Material',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Description',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Actual Quantity',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            numeric: true,
                          ),
                          DataColumn(
                            label: Text(
                              'Unit',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                        rows: filteredRows,
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: widget.isSaving
            ? null
            : () {
                // Lakukan aksi menyimpan data di sini
                widget.onSaveButtonPressed();

                // Tampilkan pesan SnackBar setelah data disimpan
                _showSnackBar('Data has been saved successfully!');
              },
        backgroundColor: Colors.green[700],
        icon: Icon(Icons.save),
        label: Text('Save'),
      ),
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              ":",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

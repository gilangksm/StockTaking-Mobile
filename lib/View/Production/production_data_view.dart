import 'package:flutter/material.dart';
import 'package:stoktaking_app/Models/Production/stocktakingdataproduction.dart';

class ProductionDetailView extends StatefulWidget {
  final StockTakingDataProduction stockTakingDataProduction;
  final List<TextEditingController> actualqtyControllers;
  final bool isSaving;
  final VoidCallback onSaveButtonPressed;

  ProductionDetailView({
    required this.stockTakingDataProduction,
    required this.actualqtyControllers,
    required this.isSaving,
    required this.onSaveButtonPressed,
  });

  @override
  _ProductionDetailViewState createState() => _ProductionDetailViewState();
}

class _ProductionDetailViewState extends State<ProductionDetailView> {
  String searchValue = '';

  @override
  Widget build(BuildContext context) {
    List<DataRow> filteredRows =
        widget.stockTakingDataProduction.stockItemProductions.where((item) {
      return item.material.toLowerCase().contains(searchValue.toLowerCase()) ||
          item.description.toLowerCase().contains(searchValue.toLowerCase());
    }).map((item) {
      final index =
          widget.stockTakingDataProduction.stockItemProductions.indexOf(item);
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
        title: Text('Stock Taking Data Production'),
        backgroundColor: Colors.blueAccent,
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
                    prefixIcon: Icon(Icons.search, color: Colors.blue[700]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.blue),
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
                        "Plant", widget.stockTakingDataProduction.plant),
                    SizedBox(height: 8),
                    buildInfoRow("Description",
                        widget.stockTakingDataProduction.description),
                    SizedBox(height: 8),
                    buildInfoRow("Created By",
                        widget.stockTakingDataProduction.createdBy),
                    SizedBox(height: 8),
                    buildInfoRow(
                      "Planned Count Date",
                      widget.stockTakingDataProduction.plannedCountDate,
                    ),
                    SizedBox(height: 8),
                    buildInfoRow(
                      "Storage Location",
                      widget.stockTakingDataProduction.storageLocation,
                    ),
                    SizedBox(height: 8),
                    buildInfoRow("Planner Code",
                        widget.stockTakingDataProduction.plannerCode),
                    SizedBox(height: 8),
                    buildInfoRow(
                      "Serial Number",
                      widget.stockTakingDataProduction.serialNumber,
                    ),
                    SizedBox(height: 8),
                    buildInfoRow("Tag Number",
                        widget.stockTakingDataProduction.tagNumber),
                    SizedBox(height: 8),
                    buildInfoRow("Storage Bin",
                        widget.stockTakingDataProduction.storageBin),
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
        backgroundColor: Colors.blue[700],
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
            flex: 6,
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
import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class ReadVmiView extends StatefulWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateChanged;

  ReadVmiView({
    required this.selectedDate,
    required this.onDateChanged,
  });

  @override
  _ReadVmiViewState createState() => _ReadVmiViewState();
}

class _ReadVmiViewState extends State<ReadVmiView> {
  Future<void> fetchData(DateTime dateTime) async {
    // Implementasi kode fetchData()
  }

  @override
  void initState() {
    super.initState();
    fetchData(widget.selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Data Vmi'),
        centerTitle: true,
        backgroundColor: Colors.green[700],
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Search',
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  setState(() {
                    // Implementasi logika pencarian
                  });
                },
              ),
              SizedBox(height: 8.0),
              FloatingActionButton(
                onPressed: () {
                  showMonthPicker(
                    context: context,
                    initialDate: DateTime.now(),
                  ).then((date) {
                    if (date != null) {
                      setState(() {
                        widget.onDateChanged(date);
                      });
                    }
                  });
                },
                backgroundColor: Colors.green[700],
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.calendar_today,
                    color: Colors.green[700],
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    // Implementasi kode tabel data riwayat
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

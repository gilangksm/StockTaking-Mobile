import 'package:flutter/material.dart';
import 'package:stoktaking_app/Controllers/Production/update_production_controller.dart';
import 'package:stoktaking_app/Controllers/Production/read_production_controller.dart';

import 'package:stoktaking_app/View/Login/login_screen.dart';

class ProductionSelectionController {
  String? dropdownValue;

  void onDropdownValueChanged(String? newValue) {
    dropdownValue = newValue;
  }

  void logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              child: Text(
                'No',
                style: TextStyle(
                  color: Colors.blue[600],
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Yes',
                style: TextStyle(
                  color: Colors.blue[600],
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void goToDetailProduction(BuildContext context) {
    if (dropdownValue != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ProductionDetailController(storageLocation: dropdownValue!),
        ),
      );
    } else {
      showErrorMessage(context);
    }
  }

  void goToViewProduction(BuildContext context) {
    if (dropdownValue != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ReadProductionController(),
        ),
      );
    } else {
      showErrorMessage(context);
    }
  }

  void showErrorMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('Select a value first before proceeding'),
          actions: [
            TextButton(
              child: Text(
                'OK',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  List<String> getStorageLocations() {
    // Ganti kode berikut dengan logika Anda untuk mendapatkan daftar kode planner
    List<String> storageLocations = [
      'A100',
      'B100',
      'C100',
      'D100',
    ];
    return storageLocations;
  }
}

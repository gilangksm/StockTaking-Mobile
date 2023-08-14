import 'package:flutter/material.dart';
import 'package:stoktaking_app/Controllers/Warehouse/Warehouse_NonVMI/nonvmi_controller.dart';
import 'package:stoktaking_app/Controllers/Warehouse/Warehouse_NonVMI/read_nonvmi_data_controller.dart';
import 'package:stoktaking_app/Controllers/Warehouse/Warehouse_VMI/read_vmi_data_controller.dart';
import 'package:stoktaking_app/Controllers/Warehouse/Warehouse_VMI/vmi_controller.dart';
import 'package:stoktaking_app/View/Login/login_screen.dart';



class WarehouseSelectionController {
  String? dropdownValue;
  String selectedType = 'VMI';

  void onDropdownValueChanged(String? newValue) {
    dropdownValue = newValue;
  }

  void onTypeSelected(String type) {
    selectedType = type;
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
                  color: Colors.green[600],
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
                  color: Colors.green[600],
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

  void goToDetail(BuildContext context) {
    if (dropdownValue != null) {
      if (selectedType == 'NON VMI') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NonVmiController(plannerCode: dropdownValue!),
          ),
        );
      } else if (selectedType == 'VMI') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VmiController(plannerCode: dropdownValue!),
          ),
        );
      }
    } else {
      showErrorMessage(context);
    }
  }

  void goToView(BuildContext context) {
    if (dropdownValue != null) {
      if (selectedType == 'NON VMI') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReadNonVmiDataController(),
          ),
        );
      } else if (selectedType == 'VMI') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReadVmiDataController(),
          ),
        );
      }
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
                  color: Colors.green,
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

  List<String> getPlannerCodesWarehouse() {
    // Ganti kode berikut dengan logika Anda untuk mendapatkan daftar kode planner
    List<String> plannerCodes = [
      'R01',
      
      // ... daftar kode planner lainnya ...
    ];
    return plannerCodes;
  }
}

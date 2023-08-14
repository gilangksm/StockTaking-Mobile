import 'package:flutter/material.dart';
import 'package:stoktaking_app/Providers/data_User.dart';
import 'package:stoktaking_app/Models/Users/UserTb.dart';
import 'package:stoktaking_app/View/Production/production_selection_screen.dart';
import 'package:stoktaking_app/View/Warehouse/warehouse_selection_screen.dart.dart';

class LoginController {
  final DataUser _dataUser = DataUser();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login(String userId, String password, BuildContext context) async {
    try {
      // Lakukan request ke API untuk melakukan login
      final Map<String, dynamic> loginData = {
        'userId': userId,
        'password': password,
      };
      final Map<String, dynamic> response = await _dataUser.postRequest('login', loginData);
      UserTb user = UserTb.fromJson(response);
      print('Login success. Response: $response');

      if (user.levelId == 1) {
        // Jika level ID adalah 1, navigasi ke WarehouseSelectionScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const WarehouseSelectionScreen(),
          ),
        );
      } else if (user.levelId == 2) {
        // Jika level ID adalah 2, navigasi ke ProductionSelectionScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ProductionSelectionScreen(),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              title: Text('Failed'),
              content:  Text('Invalid user or password.'),
            );
          },
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Failed'),
            content: const Text('UserID atau password yang Anda masukkan salah.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void loginUser(BuildContext context) {
    String userId = userController.text.trim();
    String password = passwordController.text.trim();
    // Validasi user dan password
    if (userId.isEmpty || password.isEmpty) {
      // Tampilkan pesan kesalahan jika user atau password kosong
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Failed'),
            content: const Text('Please enter user and password.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      login(userId, password, context);
      }
  }

  void dispose() {
    userController.dispose();
    passwordController.dispose();
  }
}
import 'package:flutter/material.dart';
import 'package:stoktaking_app/Controllers/Warehouse/warehouse_selection_controller.dart';

void main() => runApp(WarehouseSelectionScreen());

class WarehouseSelectionScreen extends StatefulWidget {
  const WarehouseSelectionScreen({Key? key});

  @override
  _WarehouseSelectionScreenState createState() =>
      _WarehouseSelectionScreenState();
}

class _WarehouseSelectionScreenState extends State<WarehouseSelectionScreen> {
  // Buat instance dari WarehouseSelectionController
  final WarehouseSelectionController _controller =
      WarehouseSelectionController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          toolbarHeight: 60,
          elevation: 14,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(70),
            ),
          ),
          leading: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          title: Row(
            children: [
              Text(
                'Hi',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                ),
              ),
              SizedBox(width: 5),
              Text(
                '',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                ),
              ),
            ],
          ),
          actions: [
            Row(
              children: [
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () => _controller.logout(context),
                  child: Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 7,
                          spreadRadius: 3,
                          color: Colors.green,
                        ),
                      ],
                      shape: BoxShape.circle,
                      color: Colors.green.shade400,
                    ),
                    child: Icon(
                      Icons.logout,
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(width: 26),
              ],
            )
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: ClipPath(
                clipper: MyClipper(),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.green, Colors.white],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 40,
              left: 20,
              right: 20,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.green.shade400,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(60),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.warehouse,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome to Warehouse',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 3,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 8),
                          Text(
                            '"Your diligence in the warehouse is the indispensable key to success, your every action represents proud dedication and tenacity."',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                            ),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 260,
              left: MediaQuery.of(context).size.width * 0.5 - 200,
              child: Transform.scale(
                scale: 0.5,
                child: Image.asset(
                  'assets/images/yy.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 183,
              left: MediaQuery.of(context).size.width * 0.5 - 110,
              child: Container(
                width: 210,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Selection',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 5,
                            spreadRadius: 2,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: DropdownButton<String>(
                        hint: Text('Select a value'),
                        value: _controller.dropdownValue,
                        onChanged: (newValue) {
                          setState(() {
                            _controller.onDropdownValueChanged(newValue);
                          });
                        },
                        items: _controller
                            .getPlannerCodesWarehouse()
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Select Type',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _controller.onTypeSelected('NON VMI');
                            });
                          },
                          child: Text('NON VMI'),
                          style: ElevatedButton.styleFrom(
                            primary: _controller.selectedType == 'NON VMI'
                                ? Colors.green
                                : Colors.grey,
                          ),
                        ),
                        SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _controller.onTypeSelected('VMI');
                            });
                          },
                          child: Text('VMI'),
                          style: ElevatedButton.styleFrom(
                            primary: _controller.selectedType == 'VMI'
                                ? Colors.green
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 20,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: Offset(0, 2),
                    ),
                  ],
                  gradient: LinearGradient(
                    colors: [
                      Colors.green.withOpacity(0.7),
                      Colors.green.withOpacity(0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    _controller.goToDetail(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.note,
                        color: Colors.white,
                        size: 36,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Go to Detail',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              right: 20,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: Offset(0, 2),
                    ),
                  ],
                  gradient: LinearGradient(
                    colors: [
                      Colors.green.withOpacity(0.7),
                      Colors.green.withOpacity(0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    _controller.goToView(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.view_list,
                        color: Colors.white,
                        size: 36,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Go to View',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.85,
        size.width * 0.5, size.height * 0.7);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.55, size.width, size.height * 0.8);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

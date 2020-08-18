import 'package:app_lojacar/Pages/Login.dart';
import 'package:app_lojacar/pages/empleado/EmpleadoActividad.dart';
import 'package:app_lojacar/pages/empleado/EmpleadoCliente.dart';
import 'package:app_lojacar/pages/empleado/EmpleadoVehiculo.dart';

import 'package:flutter/material.dart';

/// This Widget is the main application widget.

class EmpleadoHome extends StatefulWidget {
  EmpleadoHome({Key key}) : super(key: key);
  @override
  _EmpleadoHomeState createState() => _EmpleadoHomeState();
}

class _EmpleadoHomeState extends State<EmpleadoHome> {
  int _selectedIndex = 0;

  final EmpleadoCliente _empleadoClientePage = EmpleadoCliente();
  final EmpleadoVehiculo _empleadoVehiculoPage = new EmpleadoVehiculo();
  final EmpleadoActividad _empleadoActividadPage = new EmpleadoActividad();

  Widget _showPage = new EmpleadoCliente();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _empleadoClientePage;
        break;
      case 1:
        return _empleadoVehiculoPage;
        break;
      case 2:
        return _empleadoActividadPage;
        break;
      default:
        return new Container(
          child: new Center(
            child: new Text(
              'Not Found Page Selected',
              style: new TextStyle(fontSize: 30),
            ),
          ),
        );
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _showPage = _pageChooser(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              // Este metodo me permite volver a la pantalla del Home
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            );
          },
        ),
        title: Text('Lojacar'),
        centerTitle: true,
      ),
      body: Center(
        child: _showPage,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity),
            title: Text('Empleados'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            title: Text('Vehiculos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.today),
            title: Text('Actividades'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        onTap: _onItemTapped,
      ),
    );
    return scaffold;
  }
}

import 'package:app_lojacar/Pages/Login.dart';
import 'package:app_lojacar/pages/gerente/GerenteActividad.dart';
import 'package:app_lojacar/pages/gerente/GerenteEmpleado.dart';
import 'package:app_lojacar/pages/gerente/GerenteVehiculo.dart';
import 'package:flutter/material.dart';

/// This Widget is the main application widget.

class GerenteHome extends StatefulWidget {
  GerenteHome({Key key}) : super(key: key);
  @override
  _GerenteHomeState createState() => _GerenteHomeState();
}

class _GerenteHomeState extends State<GerenteHome> {
  int _selectedIndex = 0;

  final GerenteEmpleado _gerenteEmpleadoPage = GerenteEmpleado();
  final GerenteVehiculo _gerenteVehiculoPage = new GerenteVehiculo();
  final GerenteActividad _gerenteActividadPage = new GerenteActividad();

  Widget _showPage = new GerenteEmpleado();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _gerenteEmpleadoPage;
        break;
      case 1:
        return _gerenteVehiculoPage;
        break;
      case 2:
        return _gerenteActividadPage;
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
      // En esta parte tenemos que jugar con la vista de las pantallas para mostrar la info
      body: Center(
        //child: _widgetOptions.elementAt(_selectedIndex),
        //child: ClienteVehiculo(),
        child: _showPage,
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(_selectedIndex);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ClienteCita()),
            // MaterialPageRoute(builder: (context) => CtVehicles()),
          );
        },
        child: Icon(Icons.today),
      ),*/
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

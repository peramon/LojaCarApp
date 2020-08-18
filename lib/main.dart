import 'package:flutter/material.dart';

import 'package:app_lojacar/pages/cliente/ClienteHome.dart';
import 'package:app_lojacar/pages/Login.dart';
import 'package:app_lojacar/pages/cliente/ClienteContactame.dart';
//import 'package:lojacar/Products.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      routes: {
        '/': (BuildContext context) => MyStatefulWidget(),
        // '/productos': (BuildContext context) => Products()
      },
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  final ClienteHome _clienteHome = ClienteHome();
  final ClienteContactame _contactamePage = new ClienteContactame();
  final Login _loginPage = new Login();

  Widget _showPage = new ClienteHome();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _clienteHome;
        break;
      case 1:
        return _contactamePage;
        break;
      case 2:
        return _loginPage;
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
        title: const Text('Lojacar'),
        centerTitle: true,
        leading: Icon(Icons.ac_unit, color: Colors.blue),
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
            icon: Icon(Icons.home),
            title: Text('Inicio'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            title: Text('Contáctenme'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Ingresar'),
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

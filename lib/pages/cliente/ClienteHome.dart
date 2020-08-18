import 'package:flutter/material.dart';

import 'ClienteVehiculo.dart';
import 'ClienteCita.dart';
import 'ClienteProducto.dart';

class ClienteHome extends StatefulWidget {
  @override
  _ClienteHomeState createState() => _ClienteHomeState();
}

class _ClienteHomeState extends State<ClienteHome>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: new PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: new Container(
          color: Colors.white,
          child: new SafeArea(child: getTabBar()),
        ),
      ),
      body: getTabBarView(<Widget>[
        ClienteVehiculo(),
        ClienteProducto('assets/images/vehiculo.jpg')
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ClienteCita()),
          );
        },
        child: Icon(Icons.today),
      ),
    );
    return scaffold;
  }

  TabBar getTabBar() {
    return TabBar(
      tabs: <Tab>[
        Tab(
          child: Text(
            'Vehiculos',
            style: TextStyle(color: Colors.blue),
          ),
        ),
        Tab(
          child: Text(
            'Productos',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
      controller: _controller,
    );
  }

  TabBarView getTabBarView(var displays) {
    return TabBarView(
      children: displays,
      controller: _controller,
    );
  }
}

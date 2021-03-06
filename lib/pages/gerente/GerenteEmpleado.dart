import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:app_lojacar/models/Empleado.dart';

class GerenteEmpleado extends StatefulWidget {
  @override
  _GerenteEmpleadoState createState() => _GerenteEmpleadoState();
}

class _GerenteEmpleadoState extends State<GerenteEmpleado> {
  static const String URL = 'https://lojacar.herokuapp.com/lojacar/empleados';

  /*Future<void> getVehiculo() async {
    var resp = await http.get(url);
    print(resp.body);
  }*/
  http.Client cliente;
  List<Empleado> empleados;
  bool loading = true;
  bool error = false;
  bool data = false;

  // Cuando la ventana se abra
  @override
  void initState() {
    cliente = http.Client();
    empleados = List<Empleado>();
    fetchDataFromJson();
    super.initState();
  }

  // Metodo para obtener los vehiculos
  Future<void> fetchDataFromJson() async {
    http.Response respuesta = await cliente.get(URL);
    if (respuesta.statusCode == 200) {
      empleados.clear();
      List jsonData = json.decode(utf8.decode(respuesta.bodyBytes));
      jsonData
          .map((dynamic json) => empleados.add(Empleado.fromJson(json)))
          .toList();

      //vehiculos.add();
      setState(() {
        loading = false;
      });
      // Si no cargan los valores
      if (empleados.isEmpty) {
        data = false;
      }
    } else {
      Exception('Ha sucedido un error al consultar la Api');
      setState(() {
        loading = false;
        error = true;
      });
    }
  }

  void updateContent() {
    setState(() {
      error = false;
      loading = true;
      fetchDataFromJson();
    });
  }

// Cuando la ventana se cierra
  @override
  void dispose() {
    cliente?.close();
    super.dispose();
  }

  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      backgroundColor: Colors.blue[100],
      body: loading ? customLoading() : customListBuilder(),
    );
    return scaffold;
  }

  Widget customLoading() {
    return SafeArea(
      child: Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget customListBuilder() {
    if (error) {
      return dataError();
    } else {
      return SafeArea(
        child: RefreshIndicator(
          child: Container(
            margin: new EdgeInsets.all(40.0),
            // Todo ver por que no funciona la condicion cunado no retorna valores
            child: data
                ? dataEmpty()
                : ListView.builder(
                    itemCount: empleados.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          child: Column(
                        children: <Widget>[
                          //Image.asset('assets/images/vehiculo.jpg'),

                          // TD: Mejorar la presentación
                          Icon(
                            Icons.account_box,
                            color: Colors.white,
                            size: 150.0,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              '${empleados[index].getEmpleadoId}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              '${empleados[index].getEmpleadoNombres}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                '${empleados[index].getEmpleadoApellidos}'),
                          ),
                          SizedBox(height: 10.0),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('TD: @empleado.com'),
                          ),
                          SizedBox(height: 20.0),
                          buildButtonContainer(),
                        ],
                      ));
                    },
                  ),
          ),
          onRefresh: () async =>
              await Future.delayed(Duration(seconds: 2), () => updateContent()),
        ),
      );
    }
  }

  Widget dataEmpty() {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('No hay vehiculos para mostrar'),
            subtitle:
                Text('Ocurrio un problemas mientras se recuperaban los datos'),
          ),
        ],
      ),
    );
  }

  Widget dataError() {
    return Container(
      color: Colors.red,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              'ERROR',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'La url no esta disponible',
              style: TextStyle(color: Colors.white),
            ),
          ),
          RaisedButton(
            child: Text(
              'Reintentar',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            color: Colors.green,
            onPressed: () => updateContent(),
          )
        ],
      ),
    );
  }

  Widget buildButtonContainer() {
    return Center(
      child: RaisedButton(
        onPressed: () {
          /*Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GerenteHome()),
          );*/
        },
        textColor: Colors.white,
        padding: EdgeInsets.all(0.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.0),
            color: Colors.blue,
          ),
          padding: EdgeInsets.all(12),
          width: 100,
          child: Align(
            child: Text(
              'Detalles',
              style: TextStyle(fontSize: 12),
            ),
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}

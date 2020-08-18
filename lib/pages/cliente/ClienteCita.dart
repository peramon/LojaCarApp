import 'package:flutter/material.dart';
import 'package:app_lojacar/main.dart';

class ClienteCita extends StatefulWidget {
  // Variables para almacenar los datos del cliente que quiere ser contactado
  @override
  _ClienteCitaState createState() => _ClienteCitaState();
}

class _ClienteCitaState extends State<ClienteCita> {
  String nameCustomer;

  String lastNameCustomer;

  String phoneCustomer;

  String emailCustomer;

  final formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.arrow_back),
                  // Este metodo me permite volver a la pantalla del Home
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyStatefulWidget()),
                    );
                  },
                );
              },
            ),
            title: Text('Lojacar'),
            centerTitle: true,
          ),
          body: Center(
            child: new Container(
              // TD cambiar por un color mas chevere
              color: Color.fromRGBO(0, 0, 0, 0),
              margin: new EdgeInsets.all(30.0),
              // Construyendo el formulario de contacto del  cliente
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      'AGENDAR CITA',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    TextFormField(
                      validator: (value) =>
                          value.isEmpty ? 'Por favor ingrese su nombre' : null,
                      onSaved: (value) => nameCustomer = value,
                      decoration: InputDecoration(labelText: 'Nombre: '),
                    ),
                    TextFormField(
                      validator: (value) => value.isEmpty
                          ? 'Por favor ingrese su apellido'
                          : null,
                      onSaved: (value) => lastNameCustomer = value,
                      decoration: InputDecoration(labelText: 'Apellido: '),
                    ),
                    TextFormField(
                      validator: (value) => value.length != 10
                          ? 'Por favor ingrese el número de su celular'
                          : null,
                      onSaved: (value) => phoneCustomer = value,
                      decoration: InputDecoration(labelText: 'Celular: '),
                    ),
                    TextFormField(
                      validator: (value) => !value.contains('@')
                          ? 'Por favor ingrese su correo electronico'
                          : null,
                      onSaved: (value) => emailCustomer = value,
                      decoration: InputDecoration(labelText: 'Correo: '),
                    ),
                    // TD acomodar los estilos de Detalle
                    Text(''),
                    Text(''),
                    Text(
                      'DETALLE',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    Text(''),
                    new DropdownButton<String>(
                      items:
                          <String>['Cita ', 'Test Driver'].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      hint: Text("Tipo de cita"),
                      onChanged: (_) {},
                    ),
                    new DropdownButton<String>(
                      items: <String>['Chevrolet 4x4', 'Suzuki 2001']
                          .map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      hint: Text("Seleccione el vehiculo"),
                      onChanged: (_) {},
                    ),
                    Text(''),
                    Text(''),
                    RaisedButton(
                      child: Text('Aceptar'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: () {
                        final form = formKey.currentState;
                        if (form.validate()) {
                          print('Correcto');
                        } else {
                          print('Los datos ingresados no son correctos');
                        }
                      },
                    ),
                  ],
                ),
              ),
              /*child: Text('Hola'),

              // color: Colors.blueAccent,
              decoration: BoxDecoration(
                color: Colors.cyan,
                border: Border.all(
                  color: Colors.amber,
                  width: 4,
                ),
              ),
              padding: EdgeInsets.all(2),*/
            ),
          ),
        ),
      ),
    );
  }
}

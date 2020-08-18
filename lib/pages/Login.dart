import 'package:app_lojacar/pages/empleado/EmpleadoHome.dart';
import 'package:app_lojacar/pages/gerente/GerenteHome.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xFFFB415B), fontFamily: "Ubuntu"),
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding:
            EdgeInsets.only(top: 100.0, right: 40.0, left: 40.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40.0,
            ),
            Text(
              "TD: Iniciar Sesión",
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            SizedBox(
              height: 80.0,
            ),
            buildTextField("Email"),
            SizedBox(
              height: 20.0,
            ),
            buildTextField("Password"),
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[],
              ),
            ),
            SizedBox(height: 40.0),
            buildButtonContainer(),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16.0,
        ),
        prefixIcon: hintText == "Email" ? Icon(Icons.email) : Icon(Icons.lock),
        suffixIcon: hintText == "Password"
            ? IconButton(
                onPressed: _toggleVisibility,
                icon: _isHidden
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              )
            : null,
      ),
      obscureText: hintText == "Password" ? _isHidden : false,
    );
  }

  Widget buildButtonContainer() {
    return Center(
      child: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: null,
            textColor: Colors.white,
            padding: EdgeInsets.all(0.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.transparent,
              ),
              padding: EdgeInsets.all(14),
              width: 200,
              child: Align(
                child: Text(
                  'INGRESAR',
                  style: TextStyle(fontSize: 20),
                ),
                alignment: Alignment.center,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          RaisedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GerenteHome()),
            ),
            textColor: Colors.white,
            padding: EdgeInsets.all(0.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.blue,
              ),
              padding: EdgeInsets.all(14),
              width: 200,
              child: Align(
                child: Text(
                  'Gerente',
                  style: TextStyle(fontSize: 20),
                ),
                alignment: Alignment.center,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          RaisedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EmpleadoHome()),
            ),
            textColor: Colors.white,
            padding: EdgeInsets.all(0.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.blue,
              ),
              padding: EdgeInsets.all(14),
              width: 200,
              child: Align(
                child: Text(
                  'Empleado',
                  style: TextStyle(fontSize: 20),
                ),
                alignment: Alignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

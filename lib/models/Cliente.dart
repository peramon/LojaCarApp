class Cliente {
  int _id;
  String _nombres;
  String _apellidos;
  String _telefonoCasa;
  String _telefonoMovil;
  String _correoElectronico;
  String _profesion;
  String _detalle;

  Cliente(
      this._id,
      this._nombres,
      this._apellidos,
      this._telefonoCasa,
      this._telefonoMovil,
      this._correoElectronico,
      this._profesion,
      this._detalle);

  get getClienteId => this._id;
  get getClienteNombres => this._nombres;
  get getClienteApellidos => this._apellidos;
  get getClienteTelefonoCasa => this._telefonoCasa;
  get getClienteTelefonoMovil => this._telefonoMovil;
  get getClienteCorreoElectronico => this._correoElectronico;
  get getClienteProfesion => this._profesion;
  get getClienteDetalle => this._detalle;

  set setClienteId(int value) => this._id = value;
  set setClienteNombres(String value) => this._nombres = value;
  set setClienteApellidos(String value) => this._apellidos = value;
  set setClienteTelefonoCasa(String value) => this._telefonoCasa;
  set setClienteTelefonoMovil(String value) => this._telefonoMovil;
  set setClienteCorreoElectronico(String value) => this._correoElectronico;
  set setClienteProfesion(String value) => this._profesion;
  set setClienteDetalle(String value) => this._detalle;
  // Get Data
  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      int.parse(json['id'].toString()),
      json['nombres'],
      json['apellidos'],
      json['telefono_casa'],
      json['telefono_movil'],
      json['correo_electronico'],
      json['profesion'],
      json['detalle'],
    );
  }

  // Send Data
  Map<String, dynamic> toJson() {
    return {
      'id': this._id,
      'nombres': this._nombres,
      'apellidos': this._apellidos,
      'telefono_casa': this._telefonoCasa,
      'telefono_movil': this._telefonoMovil,
      'correo_electronico': this._correoElectronico,
      'profesion': this._profesion,
      'detalle': this._detalle,
    };
  }
}

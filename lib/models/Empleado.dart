class Empleado {
  int _id;
  String _nombre;
  String _apellido;

  Empleado(this._id, this._nombre, this._apellido);

  get getEmpleadoId => this._id;
  get getEmpleadoNombres => this._nombre;
  get getEmpleadoApellidos => this._apellido;

  set setEmpleadoId(int value) => this._id = value;
  set setEmpleadoNombres(String value) => this._nombre = value;
  set setEmpleadoApellidos(String value) => this._apellido = value;

  // Get Data
  factory Empleado.fromJson(Map<String, dynamic> json) {
    return Empleado(
      int.parse(json['id'].toString()),
      json['nombres'],
      json['apellidos'],
    );
  }

  // Send Data
  Map<String, dynamic> toJson() {
    return {
      'id': this._id,
      'nombres': this._nombre,
      'apellidos': this._apellido
    };
  }
}

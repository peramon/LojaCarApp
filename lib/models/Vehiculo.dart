class Vehiculo {
  int _id;
  String _anio;
  String _descripcion;

  Vehiculo(this._id, this._anio, this._descripcion);

  get getVehiculoId => this._id;
  get getVehiculoAnio => this._anio;
  get getVehiculoDes => this._descripcion;

  set setVehiculoId(int value) => this._id = value;
  set setVehiculoAnio(String value) => this._anio = value;
  set setVehiculoDes(String value) => this._descripcion = value;

  // Get Data
  factory Vehiculo.fromJson(Map<String, dynamic> json) {
    return Vehiculo(
      int.parse(json['id'].toString()),
      json['anio'],
      json['descripcion'],
    );
  }

  // Send Data
  Map<String, dynamic> toJson() {
    return {
      'id': this._id,
      'anio': this._anio,
      'descripcion': this._descripcion
    };
  }
}

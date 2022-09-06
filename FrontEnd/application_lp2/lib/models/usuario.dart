class Denuncia {
  int idusuario;
  String correo;
  String contrasena;

  Denuncia(this.idusuario, this.correo, this.contrasena);

  factory Denuncia.fromMap(Map<String, dynamic> json) {
    return Denuncia(
        json['idusuario'],
        json['correo'],
        json['contrasena']
        );
  }

  @override
  String toString() {
    return "$idusuario,$correo, $contrasena";
  }
}

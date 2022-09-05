class DenunciaTodo {
  int iddenuncia;
  String titulo;
  String descripcion;
  String fechaDenuncia;
  int num_Apoyos;
  int idciudadano;
  int idhospital;
  int idestado;
  String nombreHospital;
  String urlHospital;
  String direccionHospital;
  String telefonoHospital;
  int idusuarioHospital;

  DenunciaTodo(
      this.iddenuncia,
      this.titulo,
      this.descripcion,
      this.fechaDenuncia,
      this.num_Apoyos,
      this.idciudadano,
      this.idhospital,
      this.idestado,
      this.nombreHospital,
      this.urlHospital,
      this.direccionHospital,
      this.telefonoHospital,
      this.idusuarioHospital);

  factory DenunciaTodo.fromMap(Map<String, dynamic> json) {
    return DenunciaTodo(
        json['iddenuncia'],
        json['titulo'],
        json['descripcion'],
        json['fechaDenuncia'],
        json['num_Apoyos'],
        json['idciudadano'],
        json['idhospital'],
        json['idestado'],
        json['nombreHospital'],
        json['urlHospital'],
        json['direccionHospital'],
        json['telefonoHospital'],
        json['idusuarioHospital']);
  }

  @override
  String toString() {
    return "$iddenuncia,$titulo, $descripcion, $fechaDenuncia, $num_Apoyos, $idciudadano,$idhospital,$idestado,$nombreHospital, $urlHospital, $direccionHospital, $telefonoHospital, $idusuarioHospital";
  }
}

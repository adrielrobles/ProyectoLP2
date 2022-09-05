class Denuncia {
  int iddenuncia;
  String titulo;
  String descripcion;
  String fechaDenuncia;
  int num_Apoyos;
  int idciudadano;
  int idestado;

  Denuncia(this.iddenuncia, this.titulo, this.descripcion, this.fechaDenuncia,
      this.num_Apoyos, this.idciudadano, this.idestado);

  factory Denuncia.fromMap(Map<String, dynamic> json) {
    return Denuncia(json['iddenuncia'], json['titulo'], json['descripcion'],
        json['fechaDenuncia'], json['num_Apoyos'], json['idciudadano'], json['idestado']);
  }

  @override
  String toString() {
    return "$iddenuncia,$titulo, $descripcion, $fechaDenuncia, $num_Apoyos, $idciudadano, $idestado";
  }
}

class Denuncia{
  int iddenuncia;
  String titulo;
  String descripcion;
  DateTime fechaDenuncia;
  int num_Apoyos;
  int idciudadano;

  Denuncia(this.iddenuncia,this.titulo,this.descripcion,this.fechaDenuncia,this.num_Apoyos,this.idciudadano);

  factory Denuncia.fromMap(Map<String, dynamic> json) { 
      return Denuncia( 
        json['iddenuncia'], 
        json['titulo'], 
        json['descripcion'], 
        json['fechaDenuncia'], 
        json['num_Apoyos'],
        json['idciudadano']
      );
   }

   @override
  String toString() {
    return "$iddenuncia,$titulo, $descripcion, $fechaDenuncia, $num_Apoyos, $idciudadano";
  }
}
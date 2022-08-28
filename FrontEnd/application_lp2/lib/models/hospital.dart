class Hospital{
  int idhospital;
  String nombre;
  String url;
  String direccion;
  String telefono;
  int idusuario;

  Hospital(this.idhospital,this.nombre,this.url,this.direccion,this.telefono,this.idusuario);

  factory Hospital.fromMap(Map<String, dynamic> json) { 
      return Hospital( 
        json['idhospital'], 
        json['nombre'], 
        json['url'], 
        json['direccion'], 
        json['telefono'],
        json['idusuario']
      );
   }

   @override
  String toString() {
    return "$idhospital,$nombre, $url, $direccion, $telefono, $idusuario";
  }
}
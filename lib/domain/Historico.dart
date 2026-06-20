class Historico{
  late int id_musica;

  Historico({
    required this.id_musica
  });

  Historico.fromJson(Map<String,dynamic> json){
    id_musica = int.parse(json['id_musica']);
  }
}
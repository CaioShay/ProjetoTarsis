class Music{
  late String titulo;
  late String audio;
  late String image;

  Music({
    required this.titulo,
    required this.audio,
    required this.image
  });

  Music.fromJson(Map<String,dynamic> json){
    titulo = json['titulo'];
    audio = json['audio'];
    image = json['image'];
  }
}
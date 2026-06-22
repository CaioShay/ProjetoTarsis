class Music{
  late String titulo;
  late String audio_path;
  late String image_url;

  Music({
    required this.titulo,
    required this.audio_path,
    required this.image_url
  });

  Music.fromJson(Map<String,dynamic> json){
    titulo = json['titulo'];
    audio_path = json['audio_path'];
    image_url = json['image_url'];
  }
}
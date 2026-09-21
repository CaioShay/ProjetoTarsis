import 'package:dio/dio.dart';
import 'package:projeto/domain/Music.dart';

Dio dio = Dio();

class ApiHandler {
    Future<Map<String, dynamic>> load_api() async {
    final response = await dio.get('https://api.freetouse.com/v3/music/tracks/All');

    Map<String,dynamic> data = response.data;
    data[''];

    return data;
    }

    Future<List<Music>> getMaisReproduzidas() async{
        var response = await load_api();

        final List<Map<String, dynamic>> data =
        List<Map<String, dynamic>>.from(response['data']);

        List<Map<String, dynamic>> pegarTop10(
            List<Map<String, dynamic>> musicas,
            ) {
            final ordenadas = [...musicas];

            ordenadas.sort(
                    (a, b) => (b['views'] as num).compareTo(a['views'] as num),
            );

            return ordenadas.take(10).toList();
        }

        final List<Map<String, dynamic>> sorted = pegarTop10(data);

        final List<Music> list = [];

        for (final music in sorted) {
            list.add(
                Music(
                    titulo: music['title'],
                    audio_path: music['files']['mp3'],
                    image_url: music['thumbnails']['sm'],
                ),
            );
        }

        print(data);

        return list;
    }
}
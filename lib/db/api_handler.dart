import 'package:dio/dio.dart';
import 'package:projeto/domain/Music.dart';

Dio dio = Dio();

class ApiHandler {
    static List<Map<String, dynamic>>? data;

    Future<List<Map<String, dynamic>>?> load_api() async {
        if (data != null) {
            return data;
        }

        final response = await dio.get('https://api.freetouse.com/v3/music/tracks/All');

        data = response.data;

        return data;
    }

    Future<List<Music>> getMaisReproduzidas() async{
        await load_api();

        List<Map<String, dynamic>> pegarTop10() {

            final ordenadas = [...?data];

            ordenadas.sort(
                    (a, b) => (b['views'] as num).compareTo(a['views'] as num),
            );

            return ordenadas.take(10).toList();
        }

        final List<Map<String, dynamic>> sorted = pegarTop10();

        final List<Music> result = [];

        for (final music in sorted) {
            result.add(
                Music(
                    titulo: music['title'],
                    audio_path: music['files']['mp3'],
                    image_url: music['thumbnails']['sm'],
                ),
            );
        }

        print(data);

        return result;
    }

    Future<List<Music>> search(String query) async{
        var list = await load_api();

        var coiso =list?.where((item){
            return (item['title'].toString().toLowerCase().contains(query));
        });

        final List<Music> result = [];

        for (final music in coiso!) {
            result.add(
                Music(
                    titulo: music['title'],
                    audio_path: music['files']['mp3'],
                    image_url: music['thumbnails']['sm'],
                ),
            );
        }

        print(data);

        return result;
    }

    Future<Music> getById(String id) async{
        final response = await dio.get('https://api.freetouse.com/v3/music/tracks/'+id);

        List<Map<String,dynamic>> music = response.data['data'];

        return Music(
            titulo: music['title'],
            audio_path: music['files'],['mp3'],
            image_url: music['thumbnails']['sm'],
        );
    }
}
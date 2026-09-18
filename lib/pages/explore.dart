import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto/widgets/music_card.dart';
import 'package:projeto/db/music_dao.dart';
import 'package:projeto/domain/Music.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  late Future<List<Music>> _musicasMaisPopulares;
  late Future<List<Music>> _continuarOuvindo;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  void loadData()async{
    _musicasMaisPopulares = MusicDao().getMaisReproduzidas();
    _continuarOuvindo = MusicDao().getHistorico();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      children: [
        Text('Continuar ouvindo'),
        const SizedBox(height: 8),
        SizedBox(
          height: 200,
          child: _MusicHorizontalList(
            future: _continuarOuvindo,
            emptyMessage: 'Nenhuma música ouvida recentemente',
          ),
        ),
        const SizedBox(height: 32),
        Text('Músicas mais populares'),
        const SizedBox(height: 8),
        SizedBox(
          height: 200,
          child: _MusicHorizontalList(
            future: _musicasMaisPopulares,
            emptyMessage: 'Nenhuma música popular encontrada',
          ),
        ),
      ],
    );
  }
}

class _MusicHorizontalList extends StatelessWidget {
  final Future<List<Music>> future;
  final String emptyMessage;

  const _MusicHorizontalList({
    required this.future,
    required this.emptyMessage,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Music>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Erro ao carregar: ${snapshot.error}'));
        }

        final musicas = snapshot.data ?? const <Music>[];
        if (musicas.isEmpty) {
          return Center(child: Text(emptyMessage));
        }

        return ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: musicas.length,
          separatorBuilder: (_, __) => const SizedBox(width: 10),
          itemBuilder: (context, i) {
            return MusicCard(
              music: musicas[i],
              width: 200,
              height: 200,
            );
          },
        );
      },
    );
  }
}
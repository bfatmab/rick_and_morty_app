import 'package:flutter/material.dart';
import 'package:rickandmorty_app/models/characters_model.dart';
import 'package:rickandmorty_app/views/widgets/character_cardview.dart';

class CharacterCardListview extends StatefulWidget {
  final List<CharacterModel> characters;
  final VoidCallback onLoadMore;

  const CharacterCardListview({
    super.key,
    required this.characters,
    required this.onLoadMore,
  });

  @override
  State<CharacterCardListview> createState() => _CharacterCardListviewState();
}

class _CharacterCardListviewState extends State<CharacterCardListview> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    _detectScrollButtom();
    super.initState();
  }

  void _detectScrollButtom() {
    _scrollController.addListener(() {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentPosition = _scrollController.position.pixels;
      const int delta = 200;
      if (maxScroll - currentPosition < delta) {
        widget.onLoadMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        controller: _scrollController,

        itemCount: widget.characters.length,

        itemBuilder: (context, index) {
          final character = widget.characters[index];

          return CharacterCardview(characterModel: character);
        },
      ),
    );
  }
}

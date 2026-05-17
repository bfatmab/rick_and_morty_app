import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty_app/views/screens/characters_view/character_viewmodel.dart';
import 'package:rickandmorty_app/views/widgets/character_card_listview.dart';

class CharactersView extends StatefulWidget {
  const CharactersView({super.key});

  @override
  State<CharactersView> createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> {
  @override
  void initState() {
    super.initState();
    context.read<CharactersViewModel>().getCharacter();
  }

 @override
Widget build(BuildContext context) {

  final viewModel =
      context.watch<CharactersViewModel>();

  return Scaffold(
    body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9),
        child: Column(
          children: [
            const SizedBox(height: 12),

            _searchInputwidget(
              context,
              viewModel: viewModel,
            ),

            if (viewModel.charactersModel == null)
              const CircularProgressIndicator.adaptive()
            else
              CharacterCardListview(
                characters:
                    viewModel.charactersModel!.results,

                onLoadMore: () =>
                    viewModel.getCharactersMore(),

                loadMore: viewModel.loadMore,
              ),
          ],
        ),
      ),
    ),
  );
}

  Widget _searchInputwidget(
    BuildContext context, {
    required CharactersViewModel viewModel,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 16),
      child: TextFormField(
        textInputAction: TextInputAction.search,
        onFieldSubmitted: viewModel.getCharactersByname,
        decoration: InputDecoration(
          labelText: 'Seach ın characters',
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ),
      ),
    );
  }
}
